#!/bin/bash

module load miniforge3/
source /sciclone/apps/miniforge3-24.9.2-0/etc/profile.d/conda.sh
conda activate datasets

BASE="${HOME}/SUPERCOMPUTING/assignments/assignment_07"
DATA="${BASE}/data"
DOG="${DATA}/dog_reference/".fna
OUT="${BASE}/output"

mkdir -p "${OUT}"

for R1 in "${DATA}/clean/"*_1.fastq.gz; do
	SAMPLE=$(basename "${R1}" _1.fastq.gz)
	R2="${DATA}/clean/${SAMPLE}_2.fastq.gz"
	SAM="${OUTPUT}/${SAMPLE}.sam"
	BAM="${OUTPUT}/${SAMPLE}_dog-matches.bam"

	bbmap.sh \
		-Xmx16g \
		ref="${DOG}" \
		in1="${R1}" \
		in2="${R2}" \
		outm="${SAM}" \
		minid=0.95 \
		threads=8
	samtools view -F 4 -b "${SAM}" > "${BAM}"
	rm "{$SAM}"
done
