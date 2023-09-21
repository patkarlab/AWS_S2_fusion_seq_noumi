#!/bin/bash

PFX=$1;
SAVEPATH=$2;
DATAPATH=$3;
CORES=$4;
BEDFILE=$5;

#config.txt must be in the $SAVEPATH directory so it can be found
if [ -e $SAVEPATH/config.txt ] #read in config.txt file to get top of code branch
then
   PATKAR_ROOT=$(cat $SAVEPATH/config.txt);
   source $PATKAR_ROOT/code/source.sh  $PATKAR_ROOT;
else
   echo "No config.txt found in $SAVEPATH";
   exit;
fi

#make Analysis folder 
mkdir -p $SAVEPATH/$PFX.Analysis

echo "Running fusion pipeline " > $SAVEPATH/$PFX.Analysis/$PFX.log;
date +"%D %H:%M" >> $SAVEPATH/$PFX.Analysis/$PFX.log;
echo "Command line:" >> $SAVEPATH/$PFX.Analysis/$PFX.log;
echo "$0 $1 $2 $3 $4" >> $SAVEPATH/$PFX.Analysis/$PFX.log;

#echo "Minnn preprocessing " >> $SAVEPATH/$PFX.log;
$MINNN_PREPROCESSING/minn_preprocess.sh $PFX $SAVEPATH $DATAPATH; # calls minnn

#echo "Running bowtie2 " >> $SAVEPATH/$PFX.log;
$BOWTIE_MAPPING/bowtie_mapping.sh $SAVEPATH $PFX $SAVEPATH $DATAPATH $CORES; # calls bowtie2

$FUSION_COVERAGE/fusion_coverage_generator.sh $SAVEPATH $PFX $SAVEPATH $BEDFILE;

#$FUSIONCATCHER_PROCESSING/fusion_catcher.sh $SAVEPATH $PFX $SAVEPATH $DATAPATH;

#$ONCOFUSE_PROCESSING/onco_fuse.sh $SAVEPATH $PFX $SAVEPATH $DATAPATH;

#$FINAL_FOLDER/final_folder.sh $SAVEPATH $PFX $SAVEPATH;

