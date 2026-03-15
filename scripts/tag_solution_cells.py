#!/usr/bin/env python3

import argparse
from pathlib import Path


CELL_MARKER = "# ╔═╡ "
SOLUTION_TAG = "# @solution\n"
KEEPCODE_TAG = "# @keepcode\n"
PLACEHOLDER = "## YOUR CODE GOES HERE"


def parse_cells(text: str) -> tuple[str, list[list[str]]]:
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


def cell_id(cell: list[str]) -> str:
    return cell[0][len(CELL_MARKER):].strip()


def cell_body(cell: list[str]) -> str:
    return "".join(cell[1:])


def classify_root_cell(body: str) -> str | None:
    stripped = body.strip()
    if stripped.startswith('md"""'):
        return None
    if stripped == PLACEHOLDER:
        return "solution"
    if stripped != "":
        return "keepcode"
    return None


def remove_existing_tags(lines: list[str]) -> list[str]:
    return [line for line in lines if line not in (SOLUTION_TAG, KEEPCODE_TAG)]


def tagged_solution_cell(cell: list[str], tag: str | None) -> list[str]:
    header = cell[0]
    body_lines = remove_existing_tags(cell[1:])
    if tag == "solution":
        return [header, SOLUTION_TAG, *body_lines]
    if tag == "keepcode":
        return [header, KEEPCODE_TAG, *body_lines]
    return [header, *body_lines]


def tag_notebook(root_path: Path, solution_path: Path) -> None:
    _, root_cells = parse_cells(root_path.read_text(encoding="utf-8"))
    solution_preamble, solution_cells = parse_cells(solution_path.read_text(encoding="utf-8"))

    tags = {cell_id(cell): classify_root_cell(cell_body(cell)) for cell in root_cells if cell_id(cell) != "Cell order:"}
    tagged_cells = [tagged_solution_cell(cell, tags.get(cell_id(cell))) for cell in solution_cells]
    output = solution_preamble + "".join("".join(cell) for cell in tagged_cells)
    solution_path.write_text(output, encoding="utf-8")


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Tag solution Pluto notebooks from the matching root notebooks."
    )
    parser.add_argument(
        "paths",
        nargs="*",
        help="Notebook filenames to process. Defaults to all root notebooks with matches under solutions/.",
    )
    args = parser.parse_args()

    if args.paths:
        notebook_names = args.paths
    else:
        notebook_names = [path.name for path in sorted(Path(".").glob("*.jl"))]

    for name in notebook_names:
        root_path = Path(name)
        solution_path = Path("solutions") / name
        if root_path.exists() and solution_path.exists():
            tag_notebook(root_path, solution_path)

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
