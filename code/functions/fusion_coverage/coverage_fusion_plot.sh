#!/bin/bash

SAVEPATH_ROOT=$1;
PFX=$2;
SAVEPATH=$3;

if [ -e $SAVEPATH/config.txt ] #read in config.txt file to get top of code branch
then
   PATKAR_ROOT=$(cat $SAVEPATH/config.txt);
   source $PATKAR_ROOT/code/source.sh  $PATKAR_ROOT;
else
   echo "No config.txt found in $SAVEPATH";
   exit;
fi


touch $SAVEPATH/$PFX.Analysis/$PFX_cov.R;
echo "library(ggplot2)" > $SAVEPATH/$PFX.Analysis/$PFX.cov.R;
echo "library(scales)" >> $SAVEPATH/$PFX.Analysis/$PFX.cov.R;
echo "library(dplyr)" >> $SAVEPATH/$PFX.Analysis/$PFX.cov.R;
echo "file <- '$SAVEPATH/$PFX.Analysis/$PFX.coverage.final.txt'">> $SAVEPATH/$PFX.Analysis/$PFX.cov.R;
echo "data <- read.delim(file,header = TRUE)">> $SAVEPATH/$PFX.Analysis/$PFX.cov.R;

echo "bxplt <- ggplot(data, aes(x=Region_Name, y=Coverage)) + geom_boxplot()" >> $SAVEPATH/$PFX.Analysis/$PFX.cov.R;

echo "bxplt <- bxplt + scale_y_continuous(trans='log10') + ggtitle('Coverage Metrics for targeted RNAseq assay')">> $SAVEPATH/$PFX.Analysis/$PFX.cov.R;

echo "bxplt <- bxplt + theme(axis.text.x = element_text(size=6, angle=90))">> $SAVEPATH/$PFX.Analysis/$PFX.cov.R;

echo "ggsave('$SAVEPATH/$PFX.Analysis/$PFX.coverage.jpg')">> $SAVEPATH/$PFX.Analysis/$PFX.cov.R;

echo "low_coverage <- filter( data, Coverage < 500)" >> $SAVEPATH/$PFX.Analysis/$PFX.cov.R;

echo "bxplt_lowcov <- ggplot(low_coverage, aes(x=Region_Name, y=Coverage)) + geom_boxplot()">> $SAVEPATH/$PFX.Analysis/$PFX.cov.R;

echo "bxplt_lowcov <- bxplt_lowcov + theme(axis.text.x = element_text(size=6, angle=90))">> $SAVEPATH/$PFX.Analysis/$PFX.cov.R;

echo "bxplt_lowcov <- bxplt_lowcov + ggtitle('Low coverage regions for targeted RNAseq assay')">> $SAVEPATH/$PFX.Analysis/$PFX.cov.R;

echo "ggsave('$SAVEPATH/$PFX.Analysis/$PFX.lowcoverage.jpg')">> $SAVEPATH/$PFX.Analysis/$PFX.cov.R;
