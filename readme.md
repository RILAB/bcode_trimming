#Barcode Trimmer 

Copyright 2013 Paul Bilinski

## Processing Illumina Reads

This short tutorial will teach you how to parse and remove the 5bp barcodes for your 100bp Illumina reads.  These lengths can be adjusted in the barcodecount.pl scripts.

### Starting Files:

Bzipped fastq forward reads
Bzipped fastq reverse reads
list of barcodes and accession, tab delimited

### Scripts:

barcodecount.pl
Bar_code_trimmer.pl
Call_trimmer.pl

#### Step 1. File Preparation.

Use bunzip2 READ_FILE to unzip the read.  It should be approximately 4 times the size of the zipped file.

Make sure that none of the barcode names have parentheses in them.  I advise replacing them with underscores _ so that later scripts work properly.

#### Step 2.  Use barcodecount.pl to parse reads into different files.

Before using these scripts, please make sure that naming conventions are appropriate and that the regex’s also match your read names.  Check line 28 to make sure your identifier is correct.  Also, for the accessions array, make sure to put in the 96 names of the accessions in the “NAME”, format.  I advise using text wrangler.  See example file for further help.

For all reads, use the following format to parse the reads:

	perl barcodecount.pl BARCODES.txt FASTQ

This will produce the 97 files (1-96 and the unmatched) that correspond to your individuals.  Barcodes will still be attached to the reads, at the front of the read. 

#### Step 3. Barcode Removal

You will be able to run either the Call_trimmer.sh orto remove the barcodes from all of the individual files.  Make sure the accession names are input into the script.  Also, make sure that the Bar_code_trimmer.pl is in the folder that you are executing all of this as well.
	./Call_trimmer.sh

Will call the trimmer for each of the barcoded files.  Your files with the suffix *.fastq are now ready to be examined.

Helpful Hint: It is always a good idea to make sure that the trimming has worked properly.  Check to see that forward and reverse files have approximately the same number of reads.  Also, take a barcoded read and see if it has landed in the correct file.  Check to make sure your unmatched file is not huge compared to the rest of the read files.  Lastly, make sure that the files in the .fastq do not have a barcode!

Good luck, and be ready for each fastq run to be slightly different.


