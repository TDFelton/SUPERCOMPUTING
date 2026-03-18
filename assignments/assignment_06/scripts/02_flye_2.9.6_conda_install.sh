#!/bin/bash
set -ueo pipefail

module load miniforge3
source /sciclone/apps/miniforge3-24.9.2-0/etc/profile.d/conda.sh
##create env and install flye
mamba create -n flye-env bioconda::flye=2.9.6 -y
conda activate fly-env
##check version
flye -v
##create yml file
conda env export --no-builds > flye-env.yml
