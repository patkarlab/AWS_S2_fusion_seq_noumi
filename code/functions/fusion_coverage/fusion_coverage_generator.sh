#!/bin/bash


SAVEPATH_ROOT=$1;
PFX=$2;
SAVEPATH=$3;
BEDFILE=$4;


#config.txt must be in the $SAVEPATH directory so it can be found
if [ -e $SAVEPATH/config.txt ] #read in config.txt file to get top of code branch
then
   PATKAR_ROOT=$(cat $SAVEPATH/config.txt);
   source $PATKAR_ROOT/code/source.sh  $PATKAR_ROOT;
else
   echo "No config.txt found in $SAVEPATH";
   exit;
fi

$SAMTOOLS/samtools sort $SAVEPATH/$PFX.Analysis/$PFX.bam > $SAVEPATH/$PFX.Analysis/$PFX.sorted.bam;

$BEDTOOLS/bedtools bamtobed -i $SAVEPATH/$PFX.Analysis/$PFX.sorted.bam > $SAVEPATH/$PFX.Analysis/$PFX.bed;

$BEDTOOLS/bedtools coverage -counts -a $BEDFILE -b $SAVEPATH/$PFX.Analysis/$PFX.bed > $SAVEPATH/$PFX.Analysis/$PFX.coverage.intermediate;

sed -i "1i \Chr\tStart\tStop\tRegion_Name\tCoverage\tBasestart\tBasestop\tsomething" $SAVEPATH/$PFX.Analysis/$PFX.coverage.intermediate;

grep -v all $SAVEPATH/$PFX.Analysis/$PFX.coverage.intermediate > $SAVEPATH/$PFX.Analysis/$PFX.coverage.final.txt;
