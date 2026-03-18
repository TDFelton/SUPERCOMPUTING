#!/bin/bash
set -ueo pipefail
##I know adding the Flye path to the PATH on someone else's machine isn't the most ethical, but it was the only way I could figure out how to do it on a blank HPC
export PATH=$PATH:~/programs/Flye/bin

##make the directory since we're deleting EVERYTHING
mkdir -p ./assemblies/assembly_local

##reads the file, nano-hq is the command becuase it's ONT data or something
##directs all outputs to the correct folder
##expected general genome size
##a safety net as to not use too many CPU nodes if I write a bad slurm script, aka being a good citizen

flye \
        --nano-hq ./data/SRR33939694.fastq.gz \
        --out-dir ./assemblies/assembly_local \
        --genome-size 200k \
        --threads 6 \

mv ./assemblies/assembly_local/assembly.fasta ./local_assembly.fasta ##renaming the file and moving it out of the assembly folder, as I will delete all the junk files and move it back
mv ./assemblies/assembly_local/flye.log ./local_flye.log ##same as above

##gets rid of all the junk files along with the assembly conda folder itself (couldn't think of a better way to do it)
rm -rf ./assemblies/assembly_local
##recreate the deleted folder
mkdir -p ./assemblies/assembly_local
##put the wanted files back in the correct folder
mv ./local_assembly.fasta ./assemblies/assembly_local/local_assembly.fasta
mv ./local_flye.log ./assemblies/assembly_local/local_flye.log
