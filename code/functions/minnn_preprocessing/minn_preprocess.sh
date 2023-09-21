#!/bin/bash


PFX=$1;
SAVEPATH=$2;
DATAPATH=$3;

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

MISEQ=$(echo $DATAPATH/${PFX}_S*_R1_001.fastq.gz)
NEXTSEQ=$(echo $DATAPATH/${PFX}_S*_001.fastq.gz)
if [ -f $MISEQ ]; then #MiSeq format
   R1=$(echo $DATAPATH/${PFX}_S*_R1_001.fastq.gz)
   R2=$(echo $DATAPATH/${PFX}_S*_R2_001.fastq.gz)
elif [ -f $NEXTSEQ ]; then #NextSeq format
   R1=$(echo $DATAPATH/${PFX}_S*_R1_001.fastq.gz)
   R2=$(echo $DATAPATH/${PFX}_S*_R2_001.fastq.gz)
else
   echo "$DATAPATH/${PFX}_S*_L001_R1_001.fastq.gz nor $DATAPATH/${PFX}_S*_R1_001.fastq.gz exist";
fi

#java -jar $MINNN/minnn.jar extract --pattern "^(barcode:N{8})\*" --input $R1 $R2 --output /$SAVEPATH/$PFX.Analysis/$PFX-extracted.mif;

#java -jar $MINNN/minnn.jar correct --groups barcode --input /$SAVEPATH/$PFX.Analysis/$PFX-extracted.mif --output /$SAVEPATH/$PFX.Analysis/$PFX-corrected.mif;

#java -jar $MINNN/minnn.jar sort --groups barcode --input /$SAVEPATH/$PFX.Analysis/$PFX-corrected.mif --output $SAVEPATH/$PFX.Analysis/$PFX-sorted.mif;

#java -jar $MINNN/minnn.jar stat-groups --input $SAVEPATH/$PFX.Analysis/$PFX-sorted.mif --output $SAVEPATH/$PFX.Analysis/$PFX-stat-groups.txt --groups barcode;

#java -jar $MINNN/minnn.jar stat-positions --input $SAVEPATH/$PFX.Analysis/$PFX-sorted.mif --output $SAVEPATH/$PFX.Analysis/$PFX-stat-positions.txt --groups barcode;

#java -jar $MINNN/minnn.jar consensus --input $SAVEPATH/$PFX.Analysis/$PFX-sorted.mif --output $SAVEPATH/$PFX.Analysis/$PFX-consensus.mif --max-consensuses-per-cluster 1 --groups barcode;

#java -jar $MINNN/minnn.jar mif2fastq --input $SAVEPATH/$PFX.Analysis/$PFX-consensus.mif --group-R1 $SAVEPATH/$PFX.Analysis/$PFX-consensus-R1.fastq --group-R2 $SAVEPATH/$PFX.Analysis/$PFX-consensus-R2.fastq;

