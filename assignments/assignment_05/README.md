For the download data script I was having some trouble with the tar -xzvf command so I had to go ahead and ask Claude, it told me to remove the -z so it became simply -xvf.

The download script simply changes directory into the raw data folder and unzips the tar file then removes the tar file for syntax simply check the 01_download_data.sh file

For instaling fasp I just ran wget http://opengene.org/fastp/fastp | chmod a+x ./fastp as per the github inside of my programs directory and appended it to the path, by just calling fastp in the terminal I can see I am running version 1.1.0

RUNNING THE PIPELINE
--------------------
make sure you have fastp version 1.1.0 installed
if you do not, please visit the GitHub link for installation instructions: https://github.com/OpenGene/fastp?tab=readme-ov-file#or-download-the-latest-prebuilt-binary-for-linux-users
if you don't understand these instructions DO NOT RUN THE PIPELINE
once installed navigate to the folder which you would like to store all the information
ensure this directory has a data folder with raw and trimmed subfolders
ensure this directory has a log folder
run ./pipeline.sh in the terminal
that's it
--------------------
I only stored the html log files, as to my understanding the fastp script does not generate json log files
I struggled with directing the log log files to the log folder, in doing so I learned that in the find and replace syntax (/ / /) \is used to interpret the character literally
I also struggled with understanding fastp, I asked Claude to help with that
Everything else was fairly straightforward in the creation of scripts and pipelines

