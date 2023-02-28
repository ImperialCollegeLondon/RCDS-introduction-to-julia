import nbformat as nbf
import glob

solutions = glob.glob('../solutions/*/*.ipynb', recursive=True)
for solution in solutions:
    ntbk = nbf.read(solution, nbf.NO_CONVERT)
    new_ntbk = ntbk
    for cell in new_ntbk.cells:
        if cell.hasattr("outputs"):
            cell.outputs = []
        if not cell.metadata.hasattr("tags"):
            continue
        cell.source = "" if "hide" in cell.metadata.pop("tags") else cell.source

    nbf.write(new_ntbk, solution[10:], version=nbf.NO_CONVERT)