#!/bin/bash
#SBATCH --job-name=assignment_7
#SBATCH --nodes=1
#SBATCH --ntasks=2
#SBATCH --cpus-per-task=8
#SBATCH --mem=64G
#SBATCH --time=24:00:00
#SBATCH --output=/sciclone/home/tdfelton/SUPERCOMPUTING/assignments/assignment_07/output/assignment_7.out
#SBATCH --error=/sciclone/home/tdfelton/SUPERCOMPUTING/assignments/assignment_07/output/assignment_7.err
set -ueo pipefail
BASE="${HOME}/SUPERCOMPUTING/assignments/assignment_07"
mkdir -p "${BASE}/output"
##runs all the scripts in scripts
bash "${BASE}/scripts/00_create_conda_env.sh"
bash "${BASE}/scripts/01_download_data.sh"
bash "${BASE}/scripts/02_clean_reads.sh"
bash "${BASE}/scripts/03_map_reads.sh"
