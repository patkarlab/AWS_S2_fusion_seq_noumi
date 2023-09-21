#!/bin/bash

#trims illumina fastq reads.
#trimmed reads are saved to savepath

#nohup /mnt/disk4/labs/salipante/code/functions/preprocess_reads_miseq/preprocess_reads_miseq.sh SAVEPATH A2A /mnt/disk4/labs/salipante/code/preproces_test /mnt/disk4/labs/salipante/test_data /mnt/disk4/labs/salipante/code/functions/preprocess_reads_miseq &

SAVEPATH_ROOT=$1;
PFX=$2;
SAVEPATH=$3;
DATAPATH=$4;
PREPROCESS_READS_MISEQ=$5;

PATKAR_ROOT=$(cat $SAVEPATH_ROOT/config.txt);
source $PATKAR_ROOT/code/source.sh $PATKAR_ROOT;

#force make of save path
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
 
#2) Trim adaptors off and remove duplicates

#force make of save path

{
export PATH=/home/parallels/NGS/smips_pipeline/programs/cutadapt-1.5/bin$PATH

cutadapt -a AATGATACGGCGACCACCGAGATCTACAC -b CAAGCAGAAGACGGCATACGAGATA $R1 $R2 -o $SAVEPATH/$PFX.R1.trimmed.fastq -p $SAVEPATH/$PFX.R2.trimmed.fastq >> $SAVEPATH/$PFX.log

}

gzip $SAVEPATH/$PFX.R1.trimmed.fastq &
gzip $SAVEPATH/$PFX.R2.trimmed.fastq &
wait

echo 'End Preprocess reads' >> $SAVEPATH/$PFX.log; 
date +"%D %H:%M" >> $SAVEPATH/$PFX.log; 
