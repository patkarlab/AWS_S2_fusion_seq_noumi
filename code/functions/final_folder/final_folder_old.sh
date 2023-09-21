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

mkdir $SAVEPATH/$PFX.Analysis/$PFX.final_folder

mv $SAVEPATH/$PFX.Analysis/star-fusion.fusion_predictions.tsv $SAVEPATH/$PFX.Analysis/$PFX.star-fusion_predictions.tsv
mv $SAVEPATH/$PFX.Analysis/$PFX.fusioncatcher/final-list_candidate-fusion-genes.hg19.txt $SAVEPATH/$PFX.Analysis/$PFX.fusioncatcher/$PFX.fusion-catcher_predictions.txt

mv $SAVEPATH/$PFX.Analysis/$PFX.star-fusion_predictions.tsv $SAVEPATH/$PFX.Analysis/$PFX.final_folder
mv $SAVEPATH/$PFX.Analysis/$PFX.coverage.final.txt $SAVEPATH/$PFX.Analysis/$PFX.final_folder
mv $SAVEPATH/$PFX.Analysis/$PFX.oncofuse_output/$PFX.ONCOFUSE_predictions.txt $SAVEPATH/$PFX.Analysis/$PFX.final_folder
mv $SAVEPATH/$PFX.Analysis/$PFX.fusioncatcher/$PFX.fusion-catcher_predictions.txt $SAVEPATH/$PFX.Analysis/$PFX.final_folder
mv $SAVEPATH/$PFX.Analysis/$PFX.lowcoverage.jpg $SAVEPATH/$PFX.Analysis/$PFX.final_folder
mv $SAVEPATH/$PFX.Analysis/$PFX.coverage.jpg $SAVEPATH/$PFX.Analysis/$PFX.final_folder

mkdir $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted

mv $SAVEPATH/$PFX.Analysis/fusion_inspector_out/finspector.bed.sorted.bed.gz $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/fusion_inspector_out/finspector.bed.sorted.bed.gz.tbi $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/fusion_inspector_out/finspector.consolidated.cSorted.bam.bai $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/fusion_inspector_out/finspector.fusion_inspector_web.json $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/fusion_inspector_out/finspector.fusion_predictions.final $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/fusion_inspector_out/finspector.fusion_predictions.final.abridged $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/fusion_inspector_out/finspector.fusion_predictions.final.abridged.FFPM $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/fusion_inspector_out/finspector.igv.FusionJuncSpan $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/fusion_inspector_out/finspector.junction_reads.bam.bed.sorted.bed.gz $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/fusion_inspector_out/finspector.junction_reads.bam.bed.sorted.bed.gz.tbi $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/fusion_inspector_out/finspector.spanning_reads.bam.bed.sorted.bed.gz $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/fusion_inspector_out/finspector.spanning_reads.bam.bed.sorted.bed.gz.tbi $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted

mv $SAVEPATH/$PFX.Analysis/$PFX.fusioncatcher/ $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/fusion_inspector_out/chckpts_dir/ $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/fusion_inspector_out/fi_workdir/ $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/_starF_checkpoints/ $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/_STARgenome/ $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/_STARpass1/ $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/star-fusion.preliminary/ $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/Log.final.out $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/Log.out $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/Log.progress.out $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/SJ.out.tab $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/$PFX.log $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/std.Chimeric.out.junction $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/$PFX.oncofuse_output $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/$PFX.oncofuse_input $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/$PFX.fusioncatcherseq $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/.R $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/Chimeric.out.junction $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/FusionInspector.log $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/$PFX.bed $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/$PFX.cov.R $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/$PFX.coverage.intermediate $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/star-fusion.fusion_predictions.abridged.tsv $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/std.Chimeric.out.sam $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/std.STAR.bam $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/std.STAR.sorted.bam $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/$PFX-consensus-R1.fastq $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/$PFX-consensus-R2.fastq $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/$PFX-corrected.mif $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/$PFX-extracted.mif $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/$PFX-sorted.mif $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/$PFX-consensus.mif $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/$PFX-consensus-R1-trimmed.fastq $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted
mv $SAVEPATH/$PFX.Analysis/$PFX-consensus-R2-trimmed.fastq $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted



rm -rf $SAVEPATH/$PFX.Analysis/$PFX.to_be_deleted

mv $SAVEPATH/$PFX.Analysis/$PFX.final_folder/$PFX.star-fusion_predictions.tsv $SAVEPATH/$PFX.Analysis/$PFX.final_folder/$PFX.star-fusion_predictions.txt

cp $FINAL_FOLDER/combine_excel.py $SAVEPATH/$PFX.Analysis/$PFX.final_folder

cd $SAVEPATH/$PFX.Analysis/$PFX.final_folder

python $SAVEPATH/$PFX.Analysis/$PFX.final_folder/combine_excel.py $SAVEPATH/$PFX.Analysis/$PFX.final_folder $PFX

rm $SAVEPATH/$PFX.Analysis/$PFX.final_folder/combine_excel.py
