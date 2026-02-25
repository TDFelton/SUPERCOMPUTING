Task 1 I simply ran mkdir programs in my home directory

Task 2:
cd ~/programs
wget 'the link'
tar -xzvf gh_2.74.2 ....
rm the old tar.gz file

To find the file in github, it took me forever to find the releases folder, turns out it was on the right sidebar which I have never payed attention to before
Other than that it was very straightforward to locate the file
That's it

Task 3:
I simply put the above commands in a .sh files in programs along with the preamble (#!/bin/bash, set -ueo pipefail)

Task 4:
echo 'export PATH="$HOME/programs/gh_2.74.2_linux_amd64/bin:$PATH"' >> ~/.bashrc

Task 5:
I used the token instead of the password because it's SO much easier

Task 6:
I went to the README in the seqtk github repo and simply by using the lines in the Introduction I was able to succesfully install the software

code:
#!/bin/bash
set -ueo pipefail
cd ~/programs

git clone https://github.com/lh3/seqtk.git
cd seqtk
make
echo 'export PATH="$HOME/programs/seqtk:$PATH"' >> ~/.bashrc

Task 7:
I simply called seqtk in the terminal and it gave me an output with all its associated commands
I then tried calling a few of them like comp and size and telo (because it looked interesting)

Task 8:
The # of sequences and nucleotides I simply took the commands from assignment 3
The table was more difficult, but I was finally able to build it by using the cut -f1 (field 1) command to get the columns
The columns in question came from the seqkt comp command.

code:
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

Task 9:
I went to the GenBank and generated 4 fasta files, cut and paste them into the notepad then moved those files to the data folder with filezilla
I then ran a simple for loop:
code:
for file in data/*.fasta; do bash summarize_fasta.sh "$file"; done

output:
FASTA summary for: data/fasta1.fasta
Total # of nucleotides: 1
Total nucleotides: 15840
----------------------
Sequence name and length table below:
random  15840
FASTA summary for: data/fasta2.fasta
Total # of nucleotides: 10
Total nucleotides: 300025
----------------------
Sequence name and length table below:
random  30000
random  30000
random  30000
random  30000
random  30000
random  30000
random  30000
random  30000
random  30000
random  30000
FASTA summary for: data/fasta3.fasta
Total # of nucleotides: 10
Total nucleotides: 3050009
----------------------
Sequence name and length table below:
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
FASTA summary for: data/fasta4.fasta
Total # of nucleotides: 50
Total nucleotides: 15250049
----------------------
Sequence name and length table below:
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000
random  300000

REFLECTION:
The biggest challenge I faced was fnding that file on github because I couldn't find the releases section. Also generating the fasta files was annoying, I thought there would be a simple download button somewhere. I also kept wanting to use the <() syntax, but it caused errors so I had to use more $'s. 
I don't understand the difference between () <() and $
I learned where the releases tab is on github and how to make my own fasta files. I also learned that bash scripting is a lot less daunting than I originally thought
$PATH is a variable of some sort that tells the terminal where to look for executable programs. It can be modified to contain as many or as little paths as neccessary.
