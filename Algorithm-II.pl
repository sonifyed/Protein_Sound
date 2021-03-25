#aaSonifyp15.pl by Edston

# sonifies FASTA protein sequences in Sonic Pi format
#Maps to reduced alphabets by instrument/timbre

use strict;
use warnings;

# BEGIN section the user may wish to change
my $beat_duration = 0.33;                                # lower is faster
my $notes_per_line = 16;                                # output formatting

my $group1_pitch = 60;
my $group2_pitch = 62;
my $group3_pitch = 64;
my $group4_pitch = 67;
my $groupBlank_pitch = 40;

#UNUSED but for error warning
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

# reduced alphabets - lenckowski
my @group1 = ('D','E','H','N','R');
my @group2 = ('K','Q','S','T');
my @group3 = ('A','C','G','M','P');
my @group4 = ('F','I','L','V','W','Y');
my @groupBlank = ('X', 'U', '-');


# END section the user may wish to change

die "USAGE: sonify.pl <input_file_name>\n"
    . "  <input_file_name> must contain protein sequence in Fasta format.\n"
    unless ((scalar(@ARGV) == 1));

my $in_fnam = $ARGV[0];
open(IN_FH, $in_fnam) or die "ERROR: cannot open file name $in_fnam\n";

#convert protein sequence to notes
my $strand1 = "[";
my $strand2 = "[";
my $strand3 = "[";
my $strand4 = "[";
my $strandBlank = "[";
my $note_cnt;
my $line = 0;

while (<IN_FH>) {
    $line++;
    chomp;
    if (/^>/) {
    	$note_cnt = 0;
    } else {
	my @residues = split(//,$_);
	foreach my $residue (@residues) {
	    my $residue = uc $residue;
	    my $outputA ="";
	    my $outputB ="";
	    $outputA .= "," if $note_cnt >0;
	    $outputB .= "," if $note_cnt >0;
	    $outputA .="\n            "
		unless ($note_cnt % $notes_per_line) or ($note_cnt == 0);
	    $outputB .="\n            "
		unless ($note_cnt % $notes_per_line) or ($note_cnt == 0);
	    $outputB .= ":r";
	    unless (defined $sounds_hash{$residue}) {
                warn "WARNING: unknown symbol $residue at $in_fnam line "
                    . "$line\n";
                $residue = "-";
            }
	    
	    $note_cnt++;
	    if ($residue ~~ @group1) {
		$outputA .= $group1_pitch;
		$strand1 .=$outputA;
	    } else {
	        $strand1 .=$outputB;
	    }
	    if ($residue ~~ @group2) {
		$outputA .= $group2_pitch;
		$strand2 .=$outputA;
	    } else {
	        $strand2 .=$outputB;
	    }
	    if ($residue ~~ @group3) {
		$outputA .= $group3_pitch;
		$strand3 .=$outputA;
	    } else {
	        $strand3 .=$outputB;
	    }
	    if ($residue ~~ @group4) {
		$outputA .= $group4_pitch;
		$strand4 .=$outputA;
	    } else {
	        $strand4 .=$outputB;
	    }
	    if ($residue ~~ @groupBlank) {
		$outputA .= $groupBlank_pitch;
		$strandBlank .=$outputA;
	    } else {
	        $strandBlank .=$outputB;
	    }
	}
    }
}
$strand1.="]";
$strand2.="]";
$strand3.="]";
$strand4.="]";
$strandBlank.="]";

#printing
print "strand1 =  $strand1\nstrand2 = $strand2\nstrand3 = $strand3\nstrand4 = $strand4\nstrandBlank = $strandBlank\n";
print "$note_cnt.times do |i|\n";
print "    use_synth :tb303\n    play strand1[i], release: 0.7, attack: 0, \n    cutoff: 90, amp: 0.3, pan: -0.75\n";
print "    use_synth :pluck\n    play strand2[i], release: 0.7, attack: 0, \n    cutoff: 102, amp: 0.7, pan: -0.25\n";
print "    use_synth :sine\n    play strand3[i], release: 0.7, attack: 0, \n    cutoff: 80, amp: 0.5, pan: 0.25\n";
print "    use_synth :piano\n    play strand4[i], release: 0.7, attack: 0, \n    cutoff: 80, amp: 0.7, pan: 0.75\n";
print "    use_synth :noise\n    play strandBlank[i], release: 0.7, attack: 0, \n    cutoff: 95, amp: 0.5, pan: 0\n";

print "    sleep $beat_duration\nend";


