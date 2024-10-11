#!/bin/bash

# Check if a requirements file is provided as an argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <requirements_file>"
    exit 1
fi

# Specify the requirements file from the argument
req_file="$1"

# Read the environment name and Python version from the file
env_name=$(grep -A1 "# env:" "$req_file" | tail -n1 | sed 's/^# //g' | xargs)
python_version=$(grep -A1 "# python version:" "$req_file" | tail -n1 | sed 's/^# //g' | xargs)

echo "#####################"
echo " Env name: $env_name"
echo " Python version: $python_version"
echo "#####################"

# Create the Conda environment
if [ -n "$env_name" ] && [ -n "$python_version" ]; then
    conda create --name "$env_name" python="$python_version" -y
    echo "Conda environment '$env_name' created with Python version $python_version."

    # Activate the newly created Conda environment
    conda init
    conda activate "$env_name"

    # Install the packages from the requirements file

    echo ""
    echo "#####################"
    echo "Installing req packages ..."
    echo "#####################"
    echo ""
    pip install -r "$req_file"

    echo "Done!"
else
    echo "Failed to read environment name or Python version from $req_file."
fi
