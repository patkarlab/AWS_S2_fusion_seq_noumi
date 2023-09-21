#!/bin/bash

#here's how to install pear to local directory
#cd wherever/PEAR-master
#./autogen.sh
#./configure --prefix=location/to/save/pear
#make
#make install

#PEAR="/home/molmicro/genome/pear/bin/pear"#plop this in to functions source

SAVEPATH_ROOT=$1;
R1=$2;
R2=$3;
PFX=$4;
SAVEPATH=$5;
CORES=$6;

PATKAR_ROOT=$(cat $SAVEPATH_ROOT/config.txt);
source $PATKAR_ROOT/code/source.sh $PATKAR_ROOT;

mkdir -p $SAVEPATH;

echo 'Assemble overlapping reads with PEAR' >> $SAVEPATH/$PFX.log; 
date +"%D %H:%M" >> $SAVEPATH/$PFX.log;

gunzip $SAVEPATH/$PFX.R1.trimmed.fastq.gz;
gunzip $SAVEPATH/$PFX.R2.trimmed.fastq.gz;


#remove file extension
R1_unzipped=$SAVEPATH/$PFX.R1.trimmed.fastq
R2_unzipped=$SAVEPATH/$PFX.R2.trimmed.fastq

#assemble reads using PEAR

$PEAR -f $R1_unzipped -r $R2_unzipped -o $SAVEPATH/$PFX -j $CORES > $SAVEPATH/$PFX.assemble_reads.log;

#zip up reads that were created
gzip $SAVEPATH/$PFX.assembled.fastq 

echo 'Assemble with PEAR complete' >> $SAVEPATH/$PFX.log;
date +"%D %H:%M" >> $SAVEPATH/$PFX.log;
