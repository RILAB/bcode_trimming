#$ -S /bin/bash

for file in #ADD the FILE NAMES IN YOUR BARCODE FILE HERE

	perl -w Bar_code_trimmer.pl $file $file.FWD.fastq
done
