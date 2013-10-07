#!/usr/bin/perl
#Barcode Trimming by Paul Bilinski, UC Davis
#Will trim the a 5 letter barcode from illumina reads, to change length of barcode change the offset in the substr corresponding to $trimmed
use strict; use warnings;

my ($IN) = @ARGV;
open (INPUT, "<$IN");
open (OUTPUT,">$IN.fastq");

while (my $line = <INPUT>) {
        chomp $line;
        if ($line =~ m/^\@HWI/){
                print OUTPUT "$line\n";
        } 
        elsif ($line =~ m/^\+HWI/){
                print OUTPUT "$line\n";
        }
        elsif ($line) {
                print OUTPUT substr($line,5,100), "\n";
        }
}
close INPUT;
close OUTPUT;