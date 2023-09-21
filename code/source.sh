#!/bin/bash

#Activate virtual enviornment
source /data/home2/hematopath/hemoseq_v2/virtualenv/python2env/bin/activate

#to use, enter "source $PATKAR_ROOT/source.sh $PATKAR_ROOT" in each script.

# Define environment variables providing paths to reference data, programs, etc

# Export all defined variables
set -a 

#directory where patkar_root is
PATKAR_ROOT=$1;
PATKAR_PROGRAMS_ROOT="/data/home2/hematopath/programs";
PATKAR_DB_ROOT="/data/home2/hematopath/reference_genomes";
PATKAR_BED_ROOT="/data/home2/hematopath/fusion_seq/bed/"

PEAR="$PATKAR_PROGRAMS_ROOT/pear/bin/pear";
#used by igh_pipeline.sh

CUTADAPT_ROOT='$PATKAR_PROGRAMS_ROOT/cutadapt-1.14/';
#used by igh_pipeline.sh

PREPROCESS_READS_MISEQ="$PATKAR_ROOT/code/functions/preprocess_reads_miseq";
#used by igh_pipeline.sh

PEAR_SELF_ASSEMBLY="$PATKAR_ROOT/code/functions/pear_self_assembly";
#used by igh_pipeline.sh

STAR_FUSION="$PATKAR_PROGRAMS_ROOT/STAR-Fusion-v1.2.0";
#used by igh_pipeline.sh

FUSIONINSPECTOR="$PATKAR_PROGRAMS_ROOT/FusionInspector";
#used by igh_pipeline.sh

SAMTOOLS="$PATKAR_PROGRAMS_ROOT/samtools-1.7";
#used by igh_pipeline.sh

BEDTOOLS="$PATKAR_PROGRAMS_ROOT/bedtools2/bin";
#used by igh_pipeline.sh;

MINNN_PREPROCESSING="$PATKAR_ROOT/code/functions/minnn_preprocessing";
#used by fusion_pipeline.sh

BOWTIE_MAPPING="$PATKAR_ROOT/code/functions/bowtie2_mapping";
#used by igh_pipeline.sh

FUSION_COVERAGE="$PATKAR_ROOT/code/functions/fusion_coverage";
#used by igh_pipeline.sh

FUSIONINS_PROCESSING="$PATKAR_ROOT/code/functions/fusionins_processing";
#used by igh_pipeline.sh

CTAT="$PATKAR_DB_ROOT/GRCh37_v19_CTAT_lib_Feb092018"

PRIMERS="$PATKAR_ROOT/ranges/";

MINNN="$PATKAR_PROGRAMS_ROOT/minnn-1.0.0";

FUSION_CATCHER="$PATKAR_PROGRAMS_ROOT/fusioncatcher_v1.30/fusioncatcher/bin";

FUSIONCATCHER_PROCESSING="$PATKAR_ROOT/code/functions/fusion_catcher/";

ADAPTER_TRIMMING="$PATKAR_ROOT/code/functions/adapter_trimming/";
#used by adapter_trimming.sh

ONCOFUSE="$PATKAR_PROGRAMS_ROOT/oncofuse-1.1.1/Oncofuse.jar";

BOWTIE2="$PATKAR_PROGRAMS_ROOT/bowtie2-2.2.9/";

ONCOFUSE_PROCESSING="$PATKAR_ROOT/code/functions/onco_fuse/";

FINAL_FOLDER="$PATKAR_ROOT/code/functions/final_folder/";
