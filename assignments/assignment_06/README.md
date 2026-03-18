---------------
RUNNING THE PIPELINE
simply relocate to the assigment 6 directory and run using
./pipeline.sh
if you get the error 'fatal: destination path 'Flye' already exists and is not an empty directory.'
find where your current flye package is and remove it completely
if you do not know how to do this DO NOT RUN THIS PIPELINE AND ASK FOR HELP

this pipeline will download a genomic dataset from Oxford Nanopore Technologies
then it will both build flye on your machine (a program for analyzing genomic datasets) and clone the original flye program into your programs directory
it will then run flye to analyze the downloaded dataset, save all the log and fasta files to the assemblies folder and corresponding subfolders and finally print a summary output to your terminal
----------------

Task 1 I simply created the necessary directories with mkdir

Task 2 I created a script (with #!/bin/bash of course) that uses wget the attached link.
To make the .gz file match the image in task 1 I had to remove ?download=1 from the link, that seemed to have no negative effects so I proceeded with it.

Task 3 I had some trouble, after changning my directory to programs (inside the script so it can still be called from the assignment 6 directory) and cutting and pasting the code from github I ran into an error, I was missing zlib.
I went to Claude for help with this issue it helped me look for where the zlib module was located using module avail 2>&1 | grep -iE "gcc|intel|foss|gompi"
This worked and located the module at legacy-tools/gcc-9.5.0, so I included module load legacy-tools/gcc-9.5.0 at the top of my script

Task 4 this website helped me with the installation syntax:
https://anaconda.org/channels/bioconda/packages/flye/overview
I simply created the flye-env environment and installed flye via conda and then printed the version as a failsafe and dumped the documentation in a yml file via the provided bash line

Task 5 I used flye --help to find all the necessary commands

Task 6 I created the conda script first, to handle the junk files I simply removed the wanted files out of the conda assembly folder, deleted the folder and its contents, recreated the folder and moved the log and fasta files back in. It felt kind of round about but it made sense in my head
I then simply cut and paste that script to the other two run scripts and changed how I loaded the environment, module load (found using module avail) for module and export PATH for the local. This does feel a little unethical to contain in the pipeline, but it was all I could come up with.

Task 7 I simply used tail -n 10 and there was no noticeable difference in these lines.

Task 8 I just called each script in a pipeline and ended with tail -n 10 for each of the log files so it is the last thing printed to the terminal

Task 9 I had to remove the flye folder in programs otherwise the entire pipeline broke... hopefully this doesn't cost me points because including a line deleting an existing flye program on someone elses machine felt VERY unethical




Challenges I had to overcome: the missing zlib library I had no idea what it was or how to fix it so I had to ask claude for the necessary grep command to find the module
deciphering how to use flye: genomic datasets are a mystery to me and using programs built to analyze them is difficult to say the least when I'm not sure exactly what I'm supposed to be doing
figuring out how to download the junk files was also difficult, I wanted to do it in one or two lines without moving any files but I didn't want to risk deleting the files I wanted to hang on to, moving the wanted files out of the folder and then back in was a clean way to minimize risk and save me time debugging

I like the conda environment the best as that is the method I am the most familiar with. I hated the local build as it took forever to install, the git clone and export to path was much nicer
I will probably go to conda environment on the next assignment as I have the most experience with it.

