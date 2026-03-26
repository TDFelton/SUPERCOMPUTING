---------------------------
What is the pipeline and how to run it?

This pipeline will install a conda environment to your machine and activate it in order to
Download some publlic genome data, clean them, and plot them against the Canis familiaris reference genome to see if that species is present in the DNA sample

To run the pipeline all you have to do is have the neccessary scripts in your machine, navigate to the assignment_07 directory and run ./assignment_07_pipeline in the terminal
---------------------------

Each task is documented in the code and frankly it is late to the point where I do not want to type it out again and will tank the corresponding point loss
I also submitted the job overnight Tuesday, saw it did not work... looked into the stderr and stdout and noticed that I had mistakenly called my OUT variable OUTPUT and forgot a bunch of dollar signs.
I also learned that I had mistakenly assigned an input R2 file with a 1 instead of a 2 in the filepath therefore my script was reading the forward file twice and essentially doing nothing
I had to start again and discovered a few more errors relating to filepaths (as was expected) essentially I pushed the sam files to the home assignment directory instead of the output folder and it caused a chain failure
It is now Wednesday night and I will let the code run overnight in hopes that it runs succesfully, if not I will submit what I have.

The major challenge in this script was all the biology software, I do not know genomics and had to resort to Claude for help in terms of syntax as I did not have the time to scrape documentation this week
The second major challenge is with bash, the filepaths do not give you little squiggle errors like in VS or jupyter when your syntax is wrong, you find out hours later in certain circumstances. I found that very annoying.

I did learn that I would much rather write my code in VS then git bash as it will tell me when I make a syntax mistake like a misplaced dollarsign or calling the wrong variable (output vs out) it would likely save me a lot of time
I also learned that congestion on the HPC is very frustrating when you're trying to meet a deaddline and I likely should have started this assignment on Friday rather than Tuesday so I had time to do more intermittent updates. Live and learn I suppose, hopefully my overnight runs well.

UPDATE
my script has been running for 8 hours and has not competed, I am submitting what I have but I clearly did something wrong, maybe my genome files were too large and I should have chosen a different one?

