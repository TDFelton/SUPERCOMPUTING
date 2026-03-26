#!/bin/bash

module load miniforge3/
source /sciclone/apps/miniforge3-24.9.2-0/etc/profile.d/conda.sh
conda activate datasets

##path definitions
BASE="${HOME}/SUPERCOMPUTING/assignments/assignment_07"
DATA="${BASE}/data"

##create the clean data folder (outdir)
mkdir -p "${DATA}/clean"

##this takes all the fastq files and places them in the proper output folders
for R1 in "${DATA}/raw/"*_1.fastq; do
	##sample I got help from claude, it helped me with the basename syntax, makes the code look cleaner and easier to use later on especially in R2
	SAMPLE=$(basename "${R1}" _1.fastq)
	R2="${DATA}/raw/${SAMPLE}_2.fastq"
	##assigns the output files of the data
	OUT1="${DATA}/clean/${SAMPLE}_1.fastq"
	OUT2="${DATA}/clean/${SAMPLE}_2.fastq"
	##fastp takes the fastq files as inputs and outputs the clean versions to the output files assigned above.
	fastp \
		--in1 "${R1}" \
		--in2 "${R2}" \
		--out1 "${OUT1}" \
		--out2 "${OUT2}" \
		--thread 8
done
