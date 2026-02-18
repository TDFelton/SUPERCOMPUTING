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
echo "chromosome 5 has this many nucleotides:  $(head -10 GCF_000001735.4_TAIR10.1_genomic.fna | tail -1 | wc -m)"
*chromosome 5 has this many nucleotides:  26975503* <br />
**8.** <br />
grep "AAAAAAAAAAAAAAAA" GCF_000001735.4_TAIR10.1_genomic.fna | wc -l <br />
*1* <br />
**9.** <br />
sort <(grep "^>" GCF_000001735.4_TAIR10.1_genomic.fna) <br />
*>NC_000932.1 Arabidopsis thaliana chloroplast, complete genome* <br />
*>NC_003070.9 Arabidopsis thaliana chromosome 1 sequence* <br />
*>NC_003071.7 Arabidopsis thaliana chromosome 2, partial sequence* <br />
*>NC_003074.8 Arabidopsis thaliana chromosome 3, partial sequence* <br />
*>NC_003075.7 Arabidopsis thaliana chromosome 4, partial sequence* <br />
*>NC_003076.8 Arabidopsis thaliana chromosome 5, partial sequence* <br />
*>NC_037304.1 Arabidopsis thaliana ecotype Col-0 mitochondrion, complete genome* <br />
**10.** <br />
paste <(grep "^>" GCF_000001735.4_TAIR10.1_genomic.fna) <(grep -v "^>" GCF_000001735.4_TAIR10.1_genomic.fna ) > tab_sep.txt <br />
##This is how I checked to make sure the code actually worked, I played around with the length to get the shortest proof of concept possible. <br />
cut -c1-83 tab_sep.txt <br />
*>NC_003070.9 Arabidopsis thaliana chromosome 1 sequence ccctaaaccctaaaccctaaaccctaa* <br />
*>NC_003071.7 Arabidopsis thaliana chromosome 2, partial sequence        NNNNNNNNNNNNNNNNNN* <br />
*>NC_003074.8 Arabidopsis thaliana chromosome 3, partial sequence        NNNNNNNNNNNNNNNNNN* <br />
*>NC_003075.7 Arabidopsis thaliana chromosome 4, partial sequence        NNNNNNNNNNNNNNNNNN* <br />
*>NC_003076.8 Arabidopsis thaliana chromosome 5, partial sequence        TATACCATGTACCCTCAA* <br />
*>NC_037304.1 Arabidopsis thaliana ecotype Col-0 mitochondrion, complete genome  AGAG* <br />
*>NC_000932.1 Arabidopsis thaliana chloroplast, complete genome  ATGGGCGAACGACGGGAATT* <br />
##As you can see the files were properly joined together in a tab separated manner. <br />

## REFLECTION <br />
My approach was to look through class notes and stick as closely to the given commands as possible. The internet recommended the 'sed' and 'awk' commands for counting specific characters but I thought that would have abandoned the spirit of the assignment. <br />
I learned that reading files and choosing specific lines based on content is very annoying. I was specifically frustrated by the head command and switching between specific lines as I could not find a simple way to do this without printing the first few characters of a line and selecting the line using head and tail manually based on that output. I do, however, like the grep command a lot and I can see how it can be very useful in automation pipelines and more basic scripts. I also learned how powerful the temporary files can be, ie: the <() syntax in combining and evaluating specific files, however I do not think I fully understand why exactly it works. I will likely watch a video to understand this specific syntax better. <br />
Somehow I initially missed the sort command when looking through the notes, and when I found it I realized how powerful of a command it was. It has lots of variables(?), options(?), whatever the -r, -n, etc. are called so I can infer that it can be applied to many different pipelines. <br />
These skills are essential in computational work, in my experience, because they are able to communicate seamlessly with many other different machines and are not reliant on other packages. I built a bash script pipeline (largely AI generated because I didn't know bash syntax) to automate the submission of jobs through slurm to the kuro and astral clusters for my lab and that would have been impossible without bash scripting. <br />
Bash scripting also seems to be useful for navigating between files seamlessly without the need for a large scale file viewer such as VScode which I have been told, by the legendary Eric Walter, requires a suprising amount of computational power if you were to leave multiple tabs open. 









