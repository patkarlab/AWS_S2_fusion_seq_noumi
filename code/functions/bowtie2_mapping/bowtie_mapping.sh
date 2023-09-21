#!/bin/bash

SAVEPATH_ROOT=$1;
PFX=$2;
SAVEPATH=$3;
DATAPATH=$4;
CORES=$5;
R1=$DATAPATH/${PFX}_S*_R1_001.fastq.gz;
R2=$DATAPATH/${PFX}_S*_R2_001.fastq.gz;

#config.txt must be in the $SAVEPATH directory so it can be found
if [ -e $SAVEPATH/config.txt ] #read in config.txt file to get top of code branch
then
   PATKAR_ROOT=$(cat $SAVEPATH/config.txt);
   source $PATKAR_ROOT/code/source.sh  $PATKAR_ROOT;
else
   echo "No config.txt found in $SAVEPATH";
   exit;
fi

mkdir -p $SAVEPATH;

$BOWTIE2/bowtie2 -x $PATKAR_DB_ROOT/bowtie2_ref/hg19 --phred33 --threads $CORES --no-unal -1 $R1 -2 $R2 --very-sensitive -X 1000 -I 200 | $SAMTOOLS/samtools view -bS - > $SAVEPATH/$PFX.Analysis/$PFX.bam ;
 
