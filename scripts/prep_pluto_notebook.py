#!/usr/bin/env python3

import argparse
from pathlib import Path


CELL_MARKER = "# ╔═╡ "
SOLUTION_TAG = "# @solution"
KEEPCODE_TAG = "# @keepcode"
PLACEHOLDER = "## YOUR CODE GOES HERE\n"


def split_pluto_notebook(text: str) -> tuple[str, list[list[str]]]:
    lines = text.splitlines(keepends=True)
    preamble: list[str] = []
    cells: list[list[str]] = []
    current: list[str] | None = None

    for line in lines:
        if line.startswith(CELL_MARKER):
            if current is not None:
                cells.append(current)
            current = [line]
        elif current is None:
            preamble.append(line)
        else:
            current.append(line)

    if current is not None:
        cells.append(current)

    return "".join(preamble), cells


def cell_body_lines(cell: list[str]) -> list[str]:
    return cell[1:]


def is_markdown_cell(body_lines: list[str]) -> bool:
    body = "".join(body_lines).lstrip()
    return body.startswith('md"""')


def classify_cell(body_lines: list[str]) -> str | None:
    body = "".join(body_lines)
    if SOLUTION_TAG in body:
        return "solution"
    if KEEPCODE_TAG in body:
        return "keepcode"
    return None


def strip_tags(body_lines: list[str]) -> list[str]:
    return [
        line
        for line in body_lines
        if line.strip() not in (SOLUTION_TAG, KEEPCODE_TAG)
    ]


def render_cell(cell: list[str], variant: str) -> str:
    header = cell[0]
    body_lines = cell_body_lines(cell)

    if header.startswith(CELL_MARKER + "Cell order:"):
        return "".join(cell)

    if is_markdown_cell(body_lines):
        return "".join(cell)

    kind = classify_cell(body_lines)
    clean_body = strip_tags(body_lines)

    if kind == "solution" and variant == "root":
        return header + PLACEHOLDER

    if kind is None and variant == "root":
        return header + "\n"

    return header + "".join(clean_body)


def render_notebook(source: Path, destination: Path, variant: str) -> None:
    preamble, cells = split_pluto_notebook(source.read_text(encoding="utf-8"))
    rendered = preamble + "".join(render_cell(cell, variant) for cell in cells)
    destination.parent.mkdir(parents=True, exist_ok=True)
    destination.write_text(rendered, encoding="utf-8")


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Generate root and completed Pluto notebooks from tagged solutions notebooks."
    )
    parser.add_argument(
        "paths",
        nargs="*",
        help="Specific notebook filenames under solutions/ to process. Defaults to all solutions notebooks.",
    )
    args = parser.parse_args()

    if args.paths:
        source_paths = [Path("solutions") / name for name in args.paths]
    else:
        source_paths = sorted(Path("solutions").glob("*.jl"))

    for source_path in source_paths:
        if not source_path.exists():
            continue
        name = source_path.name
        render_notebook(source_path, Path(name), "root")
        render_notebook(source_path, Path("completed") / name, "completed")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
