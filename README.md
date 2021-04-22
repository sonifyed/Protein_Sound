# Contents of Archive
Algorithm-I.pl - Perl script for Algorithm I

Algorithm-II.pl - Perl script for Algorithm II

Algorithm-III.pl - Perl script for Algorithm III

Algorithm-IV.pl - Perl script for Algorithm IV

Algorithm-V.pl - Perl script for Algorithm V

Examples-with-sound - Folder of Examples

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Algorithm-I-example-questionnaire.wav - Sound file example of Algorithm I used in Task 1 of the Questionnaire

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Algorithm-V-example-questionnaire.wav - Sound file example of Algorithm V used in Task 2 of the Questionnaire

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MSA_GAPDH - Folder containing Fasta files, sonic pi code, and sound files of GAPDH MSA Examples

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MSA_insulin - Folder containing Fasta files, sonic pi code, and sound files of insulin MSA Examples

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SCTR - Folder containing Fasta files, sonic pi code, and sound files of SCTR protein Examples

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;histone-h4 - Folder containing Fasta files, sonic pi code, and sound files of histone-h4 protein Examples

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;insulin - Folder containing Fasta files, sonic pi code, and sound files of insulin protein Examples

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;transmembrane - Folder containing Fasta files, sonic pi code, and sound files of transmembrane protein Examples

Questionnaire.pdf - pdf copy of the questionnaire used for qualitative reasearch process

README.md - This file explaining how to use the code etc.

Representative_Statements.pdf - quotes from our focus group about the different algorithms

Sonic-Pi-Screenshot.png - a screenshot of sonic pi software used in this README

asciicast.svg - an animation of the commandline implementation of one of the perl scripts

test-MSA.fasta - a Multiple Sequence Alignment in FASTA format that can be used to test Algorithms IV and V

test.fasta - a protein sequence in FASTA format that can be used to test Algorithms I, II, and III

# Using sound to understand protein sequence data
Five algorithms for sonifying proteins and protein Multiple Sequence Alignments (MSAs).

These scripts take FASTA-format protein sequences or FASTA-format protein Multiple Sequence Alignments and creates [Sonic Pi](https://sonic-pi.net) code. The resultant code can be pasted into Sonic Pi to create the sonifications. 

By rendering protein data as sound, it is hoped that human psychoacoustic intuition can find new knowledge from large data sets.

This README is written in markdown and is best viewed on GitHub at https://github.com/sonifyed/Protein_Sound/blob/main/README.md

## Installing / Getting started
You will require [Perl](https://www.perl.org) to run scripts (v5.16.3 was used). You will also require the Statistics::Descriptive module (https://metacpan.org/pod/Statistics::Descriptive)
```bash
cpan install Statistics::Descriptive
```

You will need [Sonic Pi](https://sonic-pi.net) (v3.1.0 or later) to synthesize sound.

The algorithms are Perl scripts - they do not require installation. They should be downloaded and run in the shell. 

## For beginners 
Download the scripts from the [repository](https://github.com/sonifyed/Protein_Sound/)

Open the shell (called Terminal on Macbook, on Windows you may download and use [Moba X-Term](https://mobaxterm.mobatek.net) )

Use cd (change directory) command to move to the same directory as the scripts. 
```bash
cd <location of scripts> # This will make your current working directory the location of the scripts. 
```
Use ls (list files) to confirm you are in the correct directory.
```bash
ls  # List the contents of the current working directory. 
```
This should give you a list containing Algorithm-I.pl, Algorithm-II.pl etc.

Now you are in the correct directory you can test the scripts using the following commands

## Running the script
To run the script use the 'perl' command followed by the name of the script followed by the input file.
```bash
perl Algorithm-I.pl test.fasta # Use Algorithm I on protein sequence test.fasta. 
```
This will output Sonic pi code created from the protein sequence in 'test.fasta'. This code can be pasted into Sonic Pi's graphical user interface and run to listen to the sonification.

It may be easier to print the output of the script to a file. You can do this using the ">" command. This way the code is saved for later. 

```bash
perl Algorithm-I.pl test.fasta > Sonic-Pi-Code.txt # This prints the output to file 'Sonic-Pi-Code.txt'. 
```
The file will be saved in the current working directory. This code can be pasted into Sonic Pi's graphical user interface and run to listen to the sonification. 

Be aware that using the same output name (i.e. Sonic-Pi-Code.txt) will overwrite the previous code file.

## Example
Below is an animated example running script Algorithm-I.pl on protein test.fasta
![SVG animation demonstrating how the perl scripts can be run in the shell](https://github.com/sonifyed/Protein_Sound/blob/main/asciicast.svg)

The resultant code in file Sonic-Pi-Code.txt must then be copied and pasted into Sonic Pi.
## Features
More details can be found in the accompanying paper (link to come)

 ### Algorithm I
 This algorithm sonifies a protein sequence according to the hydrophobicity of the amino acids of the sequence. 20 distinct pitches are used.
 ```bash
prel Algorithm-I.pl test.fasta > Sonic-Pi-Code.txt # Run Algorithm I on protein test.fasta
```
 Prints to file Sonic-Pi-Code.txt the sonic pi code for the Algorithm I sonification of protein test.fasta.
 
 ### Algorithm II
 This algorithm sonifies a protein sequence according to the hydrophobicity of the amino acids of the sequence. However the amino acids have been grouped into a reduced alphabet. This means that only distinct four pitches are used.
  ```bash
perl Algorithm-II.pl test.fasta > Sonic-Pi-Code.txt # Run Algorithm II on protein test.fasta
```
Prints to file Sonic-Pi-Code.txt the sonic pi code for the Algorithm II sonification of protein test.fasta
 
 ### Algorithm III
 This algorithm sonifies a protein sequence according to the hydrophobicity of the amino acids of the sequence. A combination of the first two methods is used, with Algorithm I determining the pitch, and the 'reduced alphabet' of Algorithm II determining the instrument.
  ```bash
perl Algorithm-III.pl test.fasta > Sonic-Pi-Code.txt # Run Algorithm III on protein test.fasta
```
 Prints to file Sonic-Pi-Code.txt the sonic pi code for the Algorithm III sonification of protein test.fasta
 
 ### Algorithm IV
 This algorithm sonifies a protein Multiple Sequence Alignment according to the entropy of each position within the alignment. The higher the pitch at a given position, the greater variety of amino acids can be found at that position.
  ```bash
perl Algorithm-IV.pl test-MSA.fasta > Sonic-Pi-Code.txt # Run Algorithm IV on MSA test-MSA.fasta
```
 Prints to file Sonic-Pi-Code.txt the sonic pi code for the Algorithm IV sonification of Multiple Sequence Alignment test-MSA.fasta
 
 ### Algorithm V
 This algorithm sonifies a protein Multiple Sequence Alignment according to the hydrophobicity of each amino acid as in Algorithm I. Algorithm V can be thought of as Algorithm I run simultaneously on all rows of the multiple sequence alignment.
   ```bash
perl Algorithm-V.pl test-MSA.fasta > Sonic-Pi-Code.txt # Run Algorithm V on MSA test-MSA.fasta
```
Prints to file Sonic-Pi-Code.txt the sonic pi code for the Algorithm V sonification of Multiple Sequence Alignment test-MSA.fasta

## Configuration

The sonification is a two-step process.

First the perl script must be run in the shell.
```bash
perl Algorithm-I.pl test.fasta > test-Sonic-Pi.txt # This uses Algorithm I to create a file called 'test-Sonic-Pi.txt'.
```

Then the resulting Sonic Pi script must be pasted into the Sonic Pi software to create the sound.

### Shell

#### Argument 1
Type: `String`  

The first argument details the name of the input FASTA file. For algorithms I, II, and III, these will be protein sequence files. For algorithms IV and V, these will be FASTA Multiple Sequence Alignments.

Protein Example:
```bash
perl Algorithm-I.pl test.fasta > Sonic-Pi-code.txt # Prints to file sonic-pi code for sonifictaion 
```
MSA Example:
```bash
perl Algorithm-IV.pl test-MSA.fasta > Sonic-Pi-code.txt # Prints to file sonic-pi code for sonifictaion 
```
### Sonic Pi
The output code must be pasted into Sonic Pi software to create sound. Click the 'Run' button in the top left to play the sound. See below a screenshot of what your screen would look like at this stage.

![Screenshot of code created by running Algorithm-I.pl on protein test.fasta which has been copied and pasted into Sonic Pi GUI](https://github.com/sonifyed/Protein_Sound/blob/main/Sonic-Pi-Screenshot.png?raw=true)

Use the 'Rec' button to record your sonification if desired.

## Links
- Examples Page: https://sonifyed.com/bmc-bioinformatics-2021
- Repository: https://github.com/sonifyed/Protein_Sound/
- Repository DOI [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4700420.svg)](https://doi.org/10.5281/zenodo.4700420)

## Licensing

The code in this project is licensed under [Creative Commons License: Attribution 4.0 International](http://creativecommons.org/licenses/by/4.0/legalcode).
