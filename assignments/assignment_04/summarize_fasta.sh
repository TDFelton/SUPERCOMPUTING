#!/bin/bash
set -ueo pipefail

FILE="$1"
SEQS="$(grep -c '^>' "$FILE")"
NUCS="$(grep -v '^>' "$FILE" | tr -d '\n' | wc -c)"
TABLE="$(seqtk comp "$FILE" | cut -f1,2)"

echo "FASTA summary for: $FILE"
echo "Total # of nucleotides: $SEQS"
echo "Total nucleotides: $NUCS"
echo "----------------------"
echo "Sequence name and length table below:"
echo "$TABLE"
