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

#1) Deduce proper name of reads from MiSeq or NextSeq
echo 'Preprocess reads' >> $SAVEPATH/$PFX.log; 
date +"%D %H:%M" >> $SAVEPATH/$PFX.log; 

MISEQ=$(echo $DATAPATH/${PFX}_S*_L001_R1_001.fastq.gz)
NEXTSEQ=$(echo $DATAPATH/${PFX}_S*_R1_001.fastq.gz)
if [ -f $MISEQ ]; then #MiSeq format
   R1=$(echo $DATAPATH/${PFX}_S*_L001_R1_001.fastq.gz)
   R2=$(echo $DATAPATH/${PFX}_S*_L001_R2_001.fastq.gz)
elif [ -f $NEXTSEQ ]; then #NextSeq format
   R1=$(echo $DATAPATH/${PFX}_S*_R1_001.fastq.gz)
   R2=$(echo $DATAPATH/${PFX}_S*_R2_001.fastq.gz)
else
   echo "$DATAPATH/${PFX}_S*_L001_R1_001.fastq.gz nor $DATAPATH/${PFX}_S*_R1_001.fastq.gz exist";
fi


$STAR_FUSION/STAR-Fusion --genome_lib_dir $CTAT/ctat_genome_lib_build_dir --left_fq $R1 --right_fq $R2 --output_dir $SAVEPATH/$PFX.Analysis --CPU $CORES;



