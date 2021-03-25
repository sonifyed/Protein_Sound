#!/usr/bin/perl -w

# dnason - convert Fasta-format DNA or RNA sequences to music loops in
# Sonic Pi format

use strict;
use warnings;

# BEGIN section the user may wish to change

my $beat_duration = 0.2;                                # lower is faster
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
                    "X" => "40",
                    "-" => "40",
		    "U" => "40");

#my $seq_end_sound = "  sample :loop_industrial, " - removed for rests
#    . "beat_stretch: $seq_end_sound_duration\n"
#    . "  sleep $seq_end_sound_sleep";

# END section the user may wish to change

die "USAGE: sonify.pl <input_file_name>\n"
    . "  <input_file_name> must contain DNA or RNA sequence in Fasta format.\n"
    unless ((scalar(@ARGV) == 1));

my $in_fnam = $ARGV[0];
open(IN_FH, $in_fnam) or die "ERROR: cannot open file name $in_fnam\n";

# convert DNA sequence to notes - melody loop
my $note_cnt;
my $line = 0;
my $outputX = "";
while (<IN_FH>) {
    $line++;
    chomp;
    if (/^>/) {
        $note_cnt = 0;
	print "Hydrophobicity = [";
    } else {
        my @residues = split(//, $_);
        foreach my $residue (@residues) {
            my $residue = uc $residue;
            my $output ="";
            $output = "," if $note_cnt > 0;
	    $outputX .= "," if $note_cnt > 0;
            $output .= "\n                  "
                unless ($note_cnt % $notes_per_line) or ($note_cnt == 0);
	    $outputX .= "\n          "
                unless ($note_cnt % $notes_per_line) or ($note_cnt == 0);
            unless (defined $sounds_hash{$residue}) {
                warn "WARNING: unknown symbol $residue at $in_fnam line "
                    . "$line\n";
                $residue = "-";
            }
            if ($sounds_hash{$residue}==40) {$outputX.=$sounds_hash{$residue} and $output.=":r";}
	    else {$output .= $sounds_hash{$residue} and $outputX.=":r";}
            $note_cnt++;
            print $output;
	    }
    }
}
print "]\nBlanks = [$outputX]\n$note_cnt.times do |i|\n	use_synth :sine\n	play Hydrophobicity[i], release: 0.5, cutoff: 80\n	use_synth :noise\n	play Blanks[i], release: 0.2, attack: 0.5, cutoff: 95, amp: 0.5\n	sleep $beat_duration\nend";
