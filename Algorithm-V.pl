#!/bin/perl -w
# sonifies FASTA multiple sequence alignments in Sonic Pi format
# Maps each sequence to hash and prints out as seperate strands played simultaneously

use strict;

use Bio::SeqIO;
use Bio::Seq;


# BEGIN section the user may wish to change

my $notes_per_line = 16;                                # output formatting

# keys: residue symbols (uppercase), values: notes in Sonic Pi: Engelmann1986
my %sounds_hash = ( "F" => "50",
                    "M" => "51",
		    "I" => "52",
                    "L" => "53",
                    "V" => "54",
                    "C" => "55",
                    "W" => "56",
		    "A" => "57",
                    "T" => "58",
		    "G" => "59",
                    "S" => "60",
		    "P" => "61",
		    "Y" => "62",                  
                    "H" => "65",
                    "Q" => "66",
                    "N" => "67",
                    "E" => "71",
                    "K" => "72",
                    "D" => "73",
		    "R" => "77",
                    "X" => ":r",
                    "-" => ":r",
		    "U" => ":r");


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
my $output="";
#my @residues;
#my $residue;


while ( $strand = $seqio_obj->next_seq ) {
	$strand_cnt++;
	$note_cnt=0;
	$strand_seq = $strand->seq();
	$len = $strand->length();
	my @residues = split(//, $strand_seq);
	foreach my $residue (@residues) {
		$output .= "," if $note_cnt >0;
		$output .="\n                      "
		unless ($note_cnt % $notes_per_line) or ($note_cnt == 0);
		$output .= $sounds_hash{$residue};
		$note_cnt++;
		}
	print "strand$strand_cnt = [$output]\n";
	$output="";
}

#printing play instrictions
print "$len.times do |i|\n";
my $strand_cnt2 = 0;
foreach my $iloop (1..$strand_cnt) {
	$strand_cnt2++;
	print"    use_synth :saw\n    play strand";
	print $strand_cnt2;
	print "[i], release: 0.5, cutoff: 80\n"; #create hash for instruments?
}
print "    sleep 0.33\nend";

