#!/bin/perl -w
# sonifies FASTA multiple sequence alignments in Sonic Pi format
use warnings;
use strict;

use Bio::SeqIO;
use Bio::Seq;
use Statistics::Descriptive;
use POSIX;


# BEGIN section the user may wish to change

my $notes_per_line = 16;                                # output formatting

# keys: residue symbols (uppercase), values: notes in Sonic Pi
#my %sounds_hash = ( "D" => "60",
#                    "S" => "61",
#                    "H" => "62",
#                    "F" => "63",
#                    "M" => "64",
#                    "E" => "65",
#                    "R" => "66",
#                    "Q" => "67",
#                    "L" => "68",
#                    "K" => "69",
#                    "P" => "70",
#                    "A" => "71",
#                    "C" => "72",
#                    "N" => "73",
#                    "T" => "74",
#                    "W" => "75",
#                    "Y" => "76",
#                    "G" => "77",
#                    "I" => "78",
#                    "V" => "79",
#                    "X" => "60",
#                    "-" => ":r" );

#amino acid array
my @acids = ("D","S","H","F","M","E","R","Q","L","K","P","A","C","N","T","W","Y","G","I","V","X","-","U");


# END section the user may wish to change

die "USAGE: sonify.pl <input_file_name>\n"
    . "  <input_file_name> must contain protein sequence in Fasta format.\n"
    unless ((scalar(@ARGV) == 1));

my $in_fnam = $ARGV[0];
open(IN_FH, $in_fnam) or die "ERROR: cannot open file name $in_fnam\n";




#BioPerl operations
my $seqio_obj = Bio::SeqIO->new(-file => "$in_fnam", #load input file
                         -alphabet => "protein",
			-format => 'FASTA' );




my $strand_cnt = 0;
my $strand_seq;
my $note_cnt;
my $len;
my $strand;
my @MSAarray;
#my @residues;
#my $residue;

#create matrix of MSA inputs
while ( $strand = $seqio_obj->next_seq ) {
	$note_cnt=0;
	$strand_seq = $strand->seq();
	$len = $strand->length();
	my @residues = split(//, $strand_seq);
	foreach my $residue (@residues) { 
		$MSAarray[$strand_cnt][$note_cnt] = $residue;
		$note_cnt++;
	}
	$strand_cnt++;
}

#calculate entropy
my $output;
my $entropy;
my @array;
my $string;
my $count;


foreach my $iloop (0..$len-1) {
	#@array = ();
	$entropy=0;
	$string="";
	foreach my $j (0..$strand_cnt-1) {
		$string = $string.$MSAarray[$j][$iloop];
	}
	foreach my $k (@acids) {
		$count=()=$string=~ /$k/gi;
		if ($count!=0) {$entropy = $entropy - ($count/$strand_cnt)*log($count/$strand_cnt)}
	}
	push @array, $entropy; 
}

#Stats for normalising
my $stat = Statistics::Descriptive::Full->new();
$stat->add_data( @array ) ;
my $mean=$stat->mean();
my $std=$stat->standard_deviation();

#standardise entropy values
foreach my $l (@array) {
	if ($std!=0) { 
	 	$l = floor((($l-$mean)/$std)*10+60) }
	}
#Printing note sequence
my $n;
print "Entropy = [";
foreach my $m (0..$len-1) {
	$n = $array[$m];
	print "\n           "
		unless ($m % $notes_per_line) or ($m == 0);
	if ($m==$len-1) {print "$n]\n"}
		else {print "$n,"}
}


#printing play instrictions
print "$len.times do |i|\n";
print"    use_synth :saw\n    play Entropy[i], release: 0.5, attack: 0, cutoff: 80\n    sleep 0.2\nend";


