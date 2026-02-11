ftp ftp.ncbi.nlm.nih.gov
cd genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/
get GCF_000005845.2_ASM584v2_genomic.fna.gz
get GCF_000005845.2_ASM584v2_genomic.gff.gz
quit
sftp tdfelton@bora.sciclone.wm.edu
cd SUPERCOMPUTING/assignments/assignment_02/data/
put C:/Users/Tdfel/GCF_000005845.2_ASM584v2_genomic.fna.gz
put C:/Users/Tdfel/GCF_000005845.2_ASM584v2_genomic.gff.gz
bye
md5sum C:/Users/Tdfel/GCF_000005845.2_ASM584v2_genomic.gff.gz
    2238238dd39e11329547d26ab138be41 *C:/Users/Tdfel/GCF_000005845.2_ASM584v2_genomic.gff.gz
md5sum C:/Users/Tdfel/GCF_000005845.2_ASM584v2_genomic.fna.gz
    24ae85528f4a3ea02f9ba739ee458fc4 *C:/Users/Tdfel/GCF_000005845.2_ASM584v2_genomic.fna.gz
bora

