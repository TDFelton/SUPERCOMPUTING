#!/bin/bash

##usage: ./pipeline.sh [N bases to chop]
DATA_DIR="/sciclone/home/gzahn/SUPERCOMPUTING/lesson_05"

./scripts/chop_files.sh $1

./scripts/get_stats.sh
