#!/bin/bash

module load miniforge3/
source /sciclone/apps/miniforge3-24.9.2-0/etc/profile.d/conda.sh
conda activate datasets

##save time writing code we assign some path variables 
BASE="${HOME}/SUPERCOMPUTING/assignments/assignment_07"
DATA="${BASE}/data"
METADATA="${DATA}/SraRunTable.csv"

##makes the data folder and raw subfolder, necessary for a blank machine
mkdir -p "${DATA}/dog_reference" "${DATA}/raw"

##download the sra reads, skip the header and only read the first column
for FWD in $(tail -n +2 "${METADATA}" | cut -d',' -f1); do
	##prefetch caches the sra file locally 
	##the script was taking forever to run so I asked claude how to improve runtime and it said to add prefetch
	prefetch "${FWD}"
	##converts the sra file into fastq files
	##split files writes the fwd and reverse separately
	##skip technical omits junk like barcodes and links
	##threads is parallelizing the computations
	##output to raw
	fasterq-dump \
		--split-files \
		--skip-technical \
		--threads 8 \
		--outdir "${DATA}/raw" \
		"${FWD}"
done

##grabs the data from NCBI
##reference only grabs the referenced canis familiaris gene
##stores the unzipped files in a scratch folder and later moves the desired fna file into the dog reference folder
datasets download genome \
	taxon "Canis familiaris" \
	--reference \
	--filename "${DATA}/dog_reference/dog_reference.zip"
unzip -o "${DATA}/dog_reference/dog_reference.zip" \
	-d "${DATA}/dog_reference/scr"
##find command used because mv created errors due to multiple nested folders and files, asked Claude for help with this line
find "${DATA}/dog_reference/scr" -name "*.fna" -exec mv {} \
	"${DATA}/dog_reference/dog_reference_genome.fna" \;
##removes junk files
rm -rf "${DATA}/dog_reference/scr" \
	 "${DATA}/dog_reference/dog_reference.zip"
