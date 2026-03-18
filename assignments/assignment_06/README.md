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

Task 7 I simply used tail -n 10, the only difference was the conda flye had a larger (by 5) mean coverage than the other two approaches.


