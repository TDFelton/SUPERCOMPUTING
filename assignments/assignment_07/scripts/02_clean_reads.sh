#!/bin/bash

module load miniforge3/
source /sciclone/apps/miniforge3-24.9.2-0/etc/profile.d/conda.sh
conda activate datasets

BASE="${HOME}/SUPERCOMPUTING/assignments/assignment_07"
DATA="${BASE}/data"

mkdir -p "${DATA}/clean"

for R1 in "${DATA}/raw/"*_1.fastq; do
	SAMPLE=$(basename "${R1}" _1.fastq)
	R2="${DATA}/raw/${SAMPLE}_1.fastq"
	OUT1="${DATA}/clean/${SAMPLE}_1.fastq"
	OUT2="${DATA}/clean/${SAMPLE}_2.fastq"

	fastp \
		--in1 "${R1}" \
		--in2 "${R2}" \
		--out1 "${OUT1}" \
		--out2 "${OUT2}" \
		--thread 8
done
