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

#$PREPROCESS_READS_MISEQ/preprocess_reads.sh $SAVEPATH $PFX $SAVEPATH/$PFX.Analysis $DATAPATH $PREPROCESS_READS_MISEQ;

#$PEAR_SELF_ASSEMBLY/pear_self_assembly.sh $SAVEPATH $SAVEPATH/$PFX.Analysis/$PFX.R1.trimmed.fastq.gz $SAVEPATH/$PFX.Analysis/$PFX.R2.trimmed.fastq.gz $PFX $SAVEPATH/$PFX.Analysis $CORES;

$STAR_PROCESSING/star_process.sh $SAVEPATH $PFX $SAVEPATH $DATAPATH $CORES; # calls star-fusion

#$FUSIONINS_PROCESSING/fusionins_processing.sh $SAVEPATH $PFX $SAVEPATH $CORES $DATAPATH;

#mv $SAVEPATH/FusionInspector.log $SAVEPATH/$PFX.Analysis; 

$FUSION_COVERAGE/fusion_coverage_generator.sh $SAVEPATH $PFX $SAVEPATH $BEDFILE;

$FUSION_COVERAGE/coverage_fusion_plot.sh $SAVEPATH $PFX $SAVEPATH;

$FUSIONCATCHER_PROCESSING/fusion_catcher.sh $SAVEPATH $PFX $SAVEPATH $DATAPATH;

$ONCOFUSE_PROCESSING/onco_fuse.sh $SAVEPATH $PFX $SAVEPATH $DATAPATH;

chmod +x $SAVEPATH/$PFX.Analysis/$PFX.cov.R;

Rscript $SAVEPATH/$PFX.Analysis/$PFX.cov.R;

$FINAL_FOLDER/final_folder.sh $SAVEPATH $PFX $SAVEPATH;