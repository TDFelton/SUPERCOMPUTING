
#!/bin/bash

set -ueo pipefail
##download the data, the proper directory assigned in the download data script
bash ./scripts/01_download_data.sh
##simple for loop, loops through all the R1 files in raw, no need to call the R2 files as the call/outputs for those are assigned in the fastp script
for FWD in ./data/raw/*_R1_*.fastq.gz
do
bash ./scripts/02_run_fastp.sh $FWD
##make sure to actually pass the input into the call function
done

##included bash in the call lines because it doesn't actually change anything, even though I made the scripts executable with chmod

