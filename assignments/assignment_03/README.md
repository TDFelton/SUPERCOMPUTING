##Thomas Felton Assignment 3 2/17/2026
##All outputs from code are italicized
cd ~/SUPERCOMPUTING/assignments/assignment_03 <br />
wget https://gzahn.github.io/data/GCF_000001735.4_TAIR10.1_genomic.fna.gz <br />
gunzip GCF_000001735.4_TAIR10.1_genomic.fna.gz <br />
##I tried running cat on the file... that was a mistake. <br />
ll GCF_000001735.4_TAIR10.1_genomic.fna <br />
*-rw-r-----. 1 tdfelton meldrum 115M Feb 10 16:35 GCF_000001735.4_TAIR10.1_genomic.fna* <br />

**1.** <br />
grep -c ">" GCF_000001735.4_TAIR10.1_genomic.fna <br />
*7* <br />
**2.** <br />
##I had serious trouble with this one because I was ecountering 7 additional characters in the file and I couldn't for the life of me figure out why. Because all the new lines (after filtering for headers) started with nucleotides. Apparently I was not actively excluding the new line character so when I incorporated tr -d '\n' it fixed the numerical output <br />
grep -v "^>" GCF_000001735.4_TAIR10.1_genomic.fna| tr -d '\n' | wc -m <br />
*119668634* <br />
**3.** <br />
wc -l GCF_000001735.4_TAIR10.1_genomic.fna <br />
*14 GCF_000001735.4_TAIR10.1_genomic.fna* <br />
**4.** <br />
grep "mitochondrion" <(grep "^>" GCF_000001735.4_TAIR10.1_genomic.fna) | wc -l <br />
*1* <br />
**5.** <br />
grep "chromosome" <(grep "^>" GCF_000001735.4_TAIR10.1_genomic.fna) | wc -l <br />
*5* <br />
**6.** <br />
##I used this command to find the line numbers of the chromosomes, since the first chromosome is in line 1, the sequence has to be in line 2 and the second sequence in line 4 etc. <br />
cat <(grep "^>" GCF_000001735.4_TAIR10.1_genomic.fna) <br />
*>NC_003070.9 Arabidopsis thaliana chromosome 1 sequence* <br />
*>NC_003071.7 Arabidopsis thaliana chromosome 2, partial sequence* <br />
*>NC_003074.8 Arabidopsis thaliana chromosome 3, partial sequence* <br />
*>NC_003075.7 Arabidopsis thaliana chromosome 4, partial sequence* <br />
*>NC_003076.8 Arabidopsis thaliana chromosome 5, partial sequence* <br />
*>NC_037304.1 Arabidopsis thaliana ecotype Col-0 mitochondrion, complete genome* <br />
*>NC_000932.1 Arabidopsis thaliana chloroplast, complete genome* <br />
echo "chromosome 1 has this many nucleotides:  $(head -2 GCF_000001735.4_TAIR10.1_genomic.fna | tail -1 | wc -m)" <br />
*chromosome 1 has this many nucleotides:  30427672* <br />
echo "chromosome 2 has this many nucleotides:  $(head -4 GCF_000001735.4_TAIR10.1_genomic.fna | tail -1 | wc -m)" <br />
*chromosome 2 has this many nucleotides:  19698290* <br />
echo "chromosome 3 has this many nucleotides:  $(head -6 GCF_000001735.4_TAIR10.1_genomic.fna | tail -1 | wc -m)" <br />
*chromosome 3 has this many nucleotides:  23459831* <br />
##I included the echo portion to minimize confusion (and to work on my bash script logic)
**7.** <br />





