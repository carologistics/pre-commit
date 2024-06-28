# pre-commit configuration for projects of Team Carologistics
This Repository contains some useful pre-commit hooks which can be set up locally when developing.

## Requirements
On fedora, there is a system package for pre-commit:
```bash
dnf install pre-commit
```
Alternatively, pre-commit can be installed via pip:
```bash
pip install pre-commit
```
## Usage
Make sure that the environment variable
`CAROLOGISTICS_PRE_COMMIT_SETTINGS_DIR` is pointing to the root directory of this repo, e.g., if you cloned the repo directly in your home directory:
```bash
export CAROLOGISTICS_PRE_COMMIT_SETTINGS_DIR=~/pre-commit
```
We recommend setting the variable within the .bashrc, so that it is automatically set in shells.

Call the setup.bash script from within the root directory of a repo you'll use the hooks for:
```bash
${CAROLOGISTICS_PRE_COMMIT_SETTINGS_DIR}/./setup.bash
```
It will copy all required hidden files and hooks, unless it would override existing files.
If you want to force the installation, add `-f`.
