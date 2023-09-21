#!/bin/bash

PFX=$1;
SAVEPATH=$2;

echo "Running trimming  " > $SAVEPATH/$PFX.Analysis/$PFX.log;


cutadapt -g TATGGCTGCCTG -A CAGGCAGCCATA -m 20 $SAVEPATH/$PFX.Analysis/$PFX-consensus-R1.fastq $SAVEPATH/$PFX.Analysis/$PFX-consensus-R2.fastq -o $SAVEPATH/$PFX.Analysis/$PFX-consensus-R1-trimmed.fastq -p $SAVEPATH/$PFX.Analysis/$PFX-consensus-R2-trimmed.fastq  >>$SAVEPATH/$PFX.Analysis/$PFX.logs


