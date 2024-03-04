#!/bin/sh
if [ -z "${CAROLOGISTICS_PRE_COMMIT_SETTINGS_DIR}" ]; then
    echo "CAROLOGISTICS_PRE_COMMIT_SETTINGS_DIR is not set. Abort"
    exit 1
fi


# Function to copy file with check
copy_file() {
    source_file="$1"
    destination_file="$2"
    force="$3"
    
    if [ ! -e "$destination_file" ] || [ "$force" = "true" ]; then
        cp "$source_file" "$destination_file"
        echo "Copied $source_file to $destination_file"
    else
        echo "Warning: $destination_file already exists, skipping $source_file"
    fi
}

# Parse command line arguments
force_copy=false
while getopts "f" opt; do
  case $opt in
    f) force_copy=true ;;
    *) echo "Invalid option: -$OPTARG" >&2; exit 1 ;;
  esac
done

# Shift to the next argument after parsing options
shift $((OPTIND - 1))
if [ -d .git ]; then
    copy_file "${CAROLOGISTICS_PRE_COMMIT_SETTINGS_DIR}/.cmake-format" "./.cmake-format" "$force_copy"
    copy_file "${CAROLOGISTICS_PRE_COMMIT_SETTINGS_DIR}/.cmakelint.py" "./.cmakelint.py" "$force_copy"
    copy_file "${CAROLOGISTICS_PRE_COMMIT_SETTINGS_DIR}/.gitlint" "./.gitlint" "$force_copy"
    copy_file "${CAROLOGISTICS_PRE_COMMIT_SETTINGS_DIR}/.gitignore" "./.gitignore" "$force_copy"
    copy_file "${CAROLOGISTICS_PRE_COMMIT_SETTINGS_DIR}/.pre-commit-config.yaml" "./.pre-commit-config.yaml" "$force_copy"
    if [ "$force" = "true" ]; then
      cp ${CAROLOGISTICS_PRE_COMMIT_SETTINGS_DIR}/git-hooks/* ./.git/hooks/  # -n flag prevents overwriting existing files
    else
      cp -n ${CAROLOGISTICS_PRE_COMMIT_SETTINGS_DIR}/git-hooks/* ./.git/hooks/  # -n flag prevents overwriting existing files
    fi
else
    echo "Current directory is not the root directory of a Git repository. Abort."
fi

