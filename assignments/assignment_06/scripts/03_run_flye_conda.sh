#!/bin/bash
set -ueo pipefail
##load miniforge, change to the proper source and activate the environment
module load miniforge3/24.9.2-0
source /sciclone/apps/miniforge3-24.9.2-0/etc/profile.d/conda.sh
conda activate flye-env

##make the directory since we're deleting EVERYTHING
mkdir -p ./assemblies/assembly_conda

##reads the file, nano-hq is the command becuase it's ONT data or something
##directs all outputs to the correct folder
##expected general genome size
##a safety net as to not use too many CPU nodes if I write a bad slurm script, aka being a good citizen

flye \
	--nano-hq ./data/SRR33939694.fastq.gz \
	--out-dir ./assemblies/assembly_conda \
	--genome-size 200k \
	--threads 6 \

mv ./assemblies/assembly_conda/assembly.fasta ./conda_assembly.fasta ##renaming the file and moving it out of the assembly folder, as I will delete all the junk files and move it back
mv ./assemblies/assembly_conda/flye.log ./conda_flye.log ##same as above

##gets rid of all the junk files along with the assembly conda folder itself (couldn't think of a better way to do it)
rm -rf ./assemblies/assembly_conda
##recreate the deleted folder
mkdir -p ./assemblies/assembly_conda
##put the wanted files back in the correct folder
mv ./conda_assembly.fasta ./assemblies/assembly_conda/conda_assembly.fasta
mv ./conda_flye.log ./assemblies/assembly_conda/conda_flye.log

