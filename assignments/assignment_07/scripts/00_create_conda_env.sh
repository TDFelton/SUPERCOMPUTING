#!/bin/bash

module load miniforge3/

source /sciclone/apps/miniforge3-24.9.2-0/etc/profile.d/conda.sh
##Create the conda environment and skip the error if the environment already exists, easier than deleting the env every time I want to test
conda create -n datasets --yes 2>/dev/null ||true
conda activate datasets
##install the fasterq-dump command
mamba install -y -c bioconda sra-tools
##install the datasets command
mamba install -y -c conda-forge ncbi-datasets-cli
##install bbmap
mamba install -y -c bioconda bbmap
