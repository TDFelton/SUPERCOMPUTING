For the download data script I was having some trouble with the tar -xzvf command so I had to go ahead and ask Claude, it told me to remove the -z so it became simply -xvf.

The download script simply changes directory into the raw data folder and unzips the tar file then removes the tar file for syntax simply check the 01_download_data.sh file

For instaling fasp I just ran wget http://opengene.org/fastp/fastp | chmod a+x ./fastp as per the github inside of my programs directory and appended it to the path, by just calling fastp in the terminal I can see I am running version 1.1.0

