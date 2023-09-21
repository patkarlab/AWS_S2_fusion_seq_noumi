#!/bin/bash

SAVEPATH_ROOT=$1;
PFX=$2;
SAVEPATH=$3;
DATAPATH=$4;
CORES=$5;

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

export PATH=/data/home2/hematopath/programs/STAR-2.6.1d/bin/Linux_x86_64:$PATH;

$STAR_FUSION/STAR-Fusion --genome_lib_dir $CTAT/ctat_genome_lib_build_dir --left_fq $SAVEPATH/$PFX.Analysis/$PFX-consensus-R1-trimmed.fastq --right_fq $SAVEPATH/$PFX.Analysis/$PFX-consensus-R2-trimmed.fastq --output_dir $SAVEPATH/$PFX.Analysis --CPU $CORES;



