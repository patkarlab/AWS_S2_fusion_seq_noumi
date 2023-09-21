#!/bin/bash

SAVEPATH_ROOT=$1;
PFX=$2;
SAVEPATH=$3;
DATAPATH=$4;

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


oncofuse_input_file=$SAVEPATH/$PFX.Analysis/$PFX.fusioncatcher/final-list_candidate-fusion-genes.hg19.txt;

mkdir $SAVEPATH/$PFX.Analysis/$PFX.oncofuse_input;
mkdir $SAVEPATH/$PFX.Analysis/$PFX.oncofuse_output; 

cp $oncofuse_input_file $SAVEPATH/$PFX.Analysis/$PFX.oncofuse_input;


java -Xmx20G -jar $ONCOFUSE $SAVEPATH/$PFX.Analysis/$PFX.oncofuse_input/final-list_candidate-fusion-genes.hg19.txt fcatcher HEM $SAVEPATH/$PFX.Analysis/$PFX.oncofuse_output/$PFX.ONCOFUSE_predictions.txt