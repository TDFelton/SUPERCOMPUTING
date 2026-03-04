#!/bin/bash

DATA_DIR="/sciclone/home/gzahn/SUPERCOMPUTING/lesson_05"


seqkit stats ${DATA_DIR}/data/*.fastq > ./output/stats.tsv
