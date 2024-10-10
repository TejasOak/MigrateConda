#!/bin/bash
  
# Loop through each conda environment
for env in $(conda env list | awk '{print $1}' | grep -v '^#'); do
    echo "Processing environment: $env"

    # Activate the environment
    conda activate "$env"

    echo "# env:" > "${env}_requirements.txt"
    echo "# $env" >> "${env}_requirements.txt"
    echo "# python version:" >> "${env}_requirements.txt"
    echo "# $(python3 --version | cut -d ' ' -f 2)" >> "${env}_requirements.txt"
    echo "" >> "${env}_requirements.txt"

    # Create requirements.txt with installed packages
    pip list --format=freeze >> "${env}_requirements.txt"

    # Deactivate the environment
    conda deactivate
done

echo "Requirements files generated ... Done!"
