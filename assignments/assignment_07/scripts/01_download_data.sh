#!/bin/bash

module load miniforge3/
source /sciclone/apps/miniforge3-24.9.2-0/etc/profile.d/conda.sh
conda activate datasets

BASE="${HOME}/SUPERCOMPUTING/assignments/assignment_07"
DATA="${BASE}/data"
METADATA="${DATA}/SraRunTable.csv"

mkdir -p "${DATA}/dog_reference" "${DATA}/raw"

for FWD in $(tail -n +2 "${METADATA}" | cut -d',' -f1); do
	prefetch "${FWD}"
	fasterq-dump \
		--split-files \
		--skip-technical \
		--threads 8 \
		--outdir "${DATA}/raw" \
		"${FWD}"
done

datasets download genome \
	taxon "Canis familiaris" \
	--reference \
	--filename "${DATA}/dog_reference/dog_reference.zip"
unzip -o "${DATA}/dog_reference/dog_reference.zip" \
	-d "${DATA}/dog_reference/scr"
mv "${DATA}/dog_reference/scr"*.fna "${DATA}/dog_reference/"

rm -rf "${DATA}/dog_reference/scr" "${DATA}/dog_reference/dog_reference.zip"
