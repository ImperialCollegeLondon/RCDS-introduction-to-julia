import nbformat as nbf
import glob

solutions = glob.glob('solutions/*/*.ipynb', recursive=True)
for solution in solutions:
    ntbk = nbf.read(solution, nbf.NO_CONVERT)
    new_ntbk = ntbk
    for cell in new_ntbk.cells:
        if cell.cell_type == "markdown":
            continue
        if cell.hasattr("outputs"):
            cell.outputs = []
        if not cell.metadata.hasattr("tags"):
            continue
        
        tags = cell.metadata.pop("tags")
        if "hide" in tags:
            cell.source = []
        elif "todo" in tags:
            cell.source = ["## YOUR CODE GOES HERE"]

    nbf.write(new_ntbk, solution[10:], version=nbf.NO_CONVERT)