##Thomas Felton 2/11/2026 assignment_02
'''This assignment the task was to pull files from a non-local machine utilizing the ftp command. Then one should use the sftp command to put the downloaded files from the local machine onto the HPC.
The directory structure is simply the assignment_02 folder with a subdirectory called data. Those were the only folders required for this assignment.'''

ftp ftp.ncbi.nlm.nih.gov
cd genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/
get GCF_000005845.2_ASM584v2_genomic.fna.gz
get GCF_000005845.2_ASM584v2_genomic.gff.gz
quit
sftp tdfelton@bora.sciclone.wm.edu
cd SUPERCOMPUTING/assignments/assignment_02/data/
put C:/Users/Tdfel/GCF_000005845.2_ASM584v2_genomic.fna.gz
put C:/Users/Tdfel/GCF_000005845.2_ASM584v2_genomic.gff.gz
ls -l
    -rw-r-----    1 tdfelton meldrum   1384894 Feb 11 18:21 GCF_000005845.2_ASM584v2_genomic.fna.gz
    -rw-r-----    1 tdfelton meldrum    406858 Feb 11 18:21 GCF_000005845.2_ASM584v2_genomic.gff.gz
    -rw-r-----    1 tdfelton meldrum         0 Feb  6 11:25 placeholder.txt
##All files are readable by the group
bye
md5sum C:/Users/Tdfel/GCF_000005845.2_ASM584v2_genomic.fna.gz
    24ae85528f4a3ea02f9ba739ee458fc4 *C:/Users/Tdfel/GCF_000005845.2_ASM584v2_genomic.fna.gz
md5sum C:/Users/Tdfel/GCF_000005845.2_ASM584v2_genomic.gff.gz
    2238238dd39e11329547d26ab138be41 *C:/Users/Tdfel/GCF_000005845.2_ASM584v2_genomic.gff.gz
bora
cd SUPERCOMPUTING/assignments/assignment_02/data/
md5sum GCF_000005845.2_ASM584v2_genomic.fna.gz
    24ae85528f4a3ea02f9ba739ee458fc4  GCF_000005845.2_ASM584v2_genomic.fna.gz
md5sum GCF_000005845.2_ASM584v2_genomic.gff.gz
    2238238dd39e11329547d26ab138be41  GCF_000005845.2_ASM584v2_genomic.gff.gz
##The MD5 hashes from my local machine and the HPC match, therefore there was no file corruption in the file transfer
cd
nano .bashrc
##Added the necessary alias's
source ~/.bashrc
## alias u='cd ..;clear;pwd;ls -alFh --group-directories-first' 
## this alias moves up one directory, clears the screen then prints the current directory and lists all files (including hidden files) and their permissions and file sizes

## alias d='cd -;clear;pwd;ls -alFh --group-directories-first'
## this alias moves to the previous directory, clears the screen, prints the new current directory, and lists all files (including hidden files) plus their permissions and file sizes

## alias ll='ls -alFh --group-directories-first'
## this alias just lists all files (including hidden files) plus their permissions and file sizes, essentially it does what the other two alias's do just without changing directories

##Reflection
'''I liked how the files were easily transferrable using get and put, I didn't even have to go into Filezilla. I had slight trouble with the sftp command because it used my local machine username 'TDFel' instead of 'tdfelton' to log into bora. I fixed this by simply typing out the entire address: tdfelton@bora.sciclone.wm.edu. I also had an error calling source ~/.bashrc, I am not sure why as it was pointing to a line that did not exist (it was claiming that some alias that I assigned in my file had an unmatched ) but there were no )'s within 10 lines of that specific line?), I fixed it by simply exiting the bora connection and relogging in. Other than that everything went very smoothly''' 
