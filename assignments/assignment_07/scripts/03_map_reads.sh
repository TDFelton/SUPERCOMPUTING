#!/bin/bash

module load miniforge3/
source /sciclone/apps/miniforge3-24.9.2-0/etc/profile.d/conda.sh
conda activate datasets

##path variables for cleaner code
BASE="${HOME}/SUPERCOMPUTING/assignments/assignment_07"
DATA="${BASE}/data"
DOG="${DATA}/dog_reference/".fna
OUT="${BASE}/output"

##creates the output directory
mkdir -p "${OUT}"

##this takes all the files from the clean directory and writes an output to a fastq file
for R1 in "${DATA}/clean/"*_1.fastq; do
	##this is the number or 'name' from the file
	SAMPLE=$(basename "${R1}" _1.fastq.gz)
	##this is the reverse file
	R2="${DATA}/clean/${SAMPLE}_2.fastq.gz"
	##sam/bam filepaths, asked claude for help with the bio specific software
	SAM="${OUT}/${SAMPLE}.sam"
	BAM="${OUT}/${SAMPLE}_dog-matches.bam"

	##I hit a button and it condensed everything to one line in bbmap.sh and I was too lazy to undo it
	##Xmx16g to help computation speed
	##ref is the dog reference file
	##in 1 and in 2 are the R1/R2 files
	##outm is the output sam file
	##minid = 0.95 means that 95% has to match the dog reference to go through
	##threeads allows processing across 8 cpus
	bbmap.sh \ -Xmx16g \ ref="${DOG}" \ in1="${R1}" \ in2="${R2}" \ outm="${SAM}" \ minid=0.95 \ threads=8
	##I asked claude for this syntax, it essentially filters to only include mapped reads
	samtools view -F 4 -b "${SAM}" > "${BAM}"
	rm "{$SAM}"
done
