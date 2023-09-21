#!/bin/bash

SAVEPATH_ROOT=$1;
PFX=$2;
SAVEPATH=$3;
DATAPATH=$4;

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


mkdir $SAVEPATH/$PFX.Analysis/$PFX.fusioncatcherseq;
mkdir $SAVEPATH/$PFX.Analysis/$PFX.fusioncatcher;


cp $R1 $SAVEPATH/$PFX.Analysis/$PFX.fusioncatcherseq;

cp $R2 $SAVEPATH/$PFX.Analysis/$PFX.fusioncatcherseq;

python $FUSION_CATCHER/fusioncatcher.py -d  $PATKAR_PROGRAMS_ROOT/fusioncatcher_v1.30/fusioncatcher/data/current/ -i $SAVEPATH/$PFX.Analysis/$PFX.fusioncatcherseq/ -o $SAVEPATH/$PFX.Analysis/$PFX.fusioncatcher

