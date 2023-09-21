#!/bin/bash

SAVEPATH_ROOT=$1;
PFX=$2;
SAVEPATH=$3;
CORES=$4;
DATAPATH=$5;

if [ -e $SAVEPATH/config.txt ] #read in config.txt file to get top of code branch
then
   PATKAR_ROOT=$(cat config.txt);
   source $PATKAR_ROOT/code/source.sh  $PATKAR_ROOT;
else
   echo "No config.txt found in $SAVEPATH";
   exit;
fi

#1) Deduce proper name of reads from MiSeq or NextSeq
echo 'Preprocess reads' >> $SAVEPATH/$PFX.log; 
date +"%D %H:%M" >> $SAVEPATH/$PFX.log; 

mkdir -p $SAVEPATH;

mkdir  $SAVEPATH/$PFX.Analysis/fusion_inspector_out;

$FUSIONINSPECTOR/FusionInspector  --fusions $SAVEPATH/$PFX.Analysis/star-fusion.fusion_predictions.tsv --genome_lib $CTAT/ctat_genome_lib_build_dir --left_fq $SAVEPATH/$PFX.Analysis/$PFX-consensus-R1-trimmed.fastq --right_fq $SAVEPATH/$PFX.Analysis/$PFX-consensus-R2-trimmed.fastq --out_dir $SAVEPATH/$PFX.Analysis/fusion_inspector_out --out_prefix finspector --prep_for_IGV --CPU $CORES;