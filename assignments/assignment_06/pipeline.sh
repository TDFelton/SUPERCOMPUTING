#!/bin/bash

set -ueo pipefail

##download data
./scripts/01_download_data.sh
##install flye on your machine
./scripts/02_flye_2.9.6_manual_build.sh
./scripts/02_flye_2.9.6_conda_install.sh
##run it via 3 different methods
./scripts/03_run_flye_local.sh
./scripts/03_run_flye_module.sh
./scripts/03_run_flye_conda.sh

##print the last 10 lines of the logfile
tail -n 10 ./assemblies/assembly_conda/conda_flye.log
tail -n 10 ./assemblies/assembly_module/module_flye.log
tail -n 10 ./assemblies/assembly_local/local_flye.log
