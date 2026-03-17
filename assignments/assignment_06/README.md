Task 1 I simply created the necessary directories with mkdir

Task 2 I created a script (with #!/bin/bash of course) that uses wget the attached link.
To make the .gz file match the image in task 1 I had to remove ?download=1 from the link, that seemed to have no negative effects so I proceeded with it.

Task 3 I had some trouble, after changning my directory to programs (inside the script so it can still be called from the assignment 6 directory) and cutting and pasting the code from github I ran into an error, I was missing zlib.
I went to Claude for help with this issue it helped me look for where the zlib module was located using module avail 2>&1 | grep -iE "gcc|intel|foss|gompi"
This worked and located the module at legacy-tools/gcc-9.5.0, so I included module load legacy-tools/gcc-9.5.0 at the top of my script

Task 4

