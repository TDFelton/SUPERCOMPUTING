#!/bin/bash
set -ueo pipefail
##I found this module using module avail flye
module load Flye/gcc-11.4.1/2.9.6

##make the directory since we're deleting EVERYTHING
mkdir -p ./assemblies/assembly_module

##reads the file, nano-hq is the command becuase it's ONT data or something
##directs all outputs to the correct folder
##expected general genome size
##a safety net as to not use too many CPU nodes if I write a bad slurm script, aka being a good citizen

flye \
        --nano-hq ./data/SRR33939694.fastq.gz \
        --out-dir ./assemblies/assembly_module \
        --genome-size 200k \
        --threads 6 \

mv ./assemblies/assembly_module/assembly.fasta ./module_assembly.fasta ##renaming the file and moving it out of the assembly folder, as I will delete all the junk files and move it back
mv ./assemblies/assembly_module/flye.log ./module_flye.log ##same as above

##gets rid of all the junk files along with the assembly conda folder itself (couldn't think of a better way to do it)
rm -rf ./assemblies/assembly_module
##recreate the deleted folder
mkdir -p ./assemblies/assembly_module
##put the wanted files back in the correct folder
mv ./module_assembly.fasta ./assemblies/assembly_module/module_assembly.fasta
mv ./module_flye.log ./assemblies/assembly_module/module_flye.log
