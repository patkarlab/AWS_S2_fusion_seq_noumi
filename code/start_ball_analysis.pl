#!/usr/bin/perl
# start_NGS_analysis.pl by Nikhil Patkar
use warnings;
use strict;

die "Usage: perl start_NGS_analysis.pl <file>\n" if (@ARGV !=1);
my ($file) = @ARGV;
print "Processing $ARGV[0] file\n";

open(my $data, "<", $file ) or die "The specified file: $file does not exist\n";
while (my $line = <$data>) {
    chomp $line;
    my @fields = split ",", $line;
    my $command1 = "nohup /data/home2/hematopath/hemoseq_v2/fusion_seq_noumi/code/pipeline/fusion_pipeline/ball_temp_pipeline.sh";
    my $command2 = "$fields[0] " ;
    my $command3 = "$fields[1]  ";
    my $command4 = "$fields[2] " ;
    my $command5 = "$fields[3] "; 
    my $command6 = "$fields[4] "; 
    my $command = "$command1 $command2 $command3 $command4 $command5 $command6";
    system($command);
    wait;
    my $command11 = "mv nohup.out $fields[0].nohup.out";
    system($command11);
    wait;
    
}
close $file;
