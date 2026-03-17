#!/bin/bash
set -ueo pipefail

module load legacy-tools/gcc-9.5.0
cd ~/programs/
git clone https://github.com/fenderglass/Flye
cd Flye
make
