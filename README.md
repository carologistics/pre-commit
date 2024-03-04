# pre-commit configuration for projects of Team Carologistics
This Repository contains some useful pre-commit hooks which can be set up locally when developing.

## Requirements
On fedora, there is a system pacakge for pre-commit:
```bash
dnf install pre-commit
```
Alternatively, pre-commit can bre installed via pip:
```bash
pip install pre-commit
```
## Usage
Call the setup.bash script from the root directory of your repository:
```bash
<path-to-this-repo>/./setup.bash
```
It will copy all required hidden files and hooks, unless it would override existing files.
If you want to force the installation, add `-f`.
