# Using sound to understand protein sequence data
Five algorithms for sonifying proteins and protein Multiple Sequence Alignments.

These scripts take FASTA protein sequences or FASTA protein Multiple Sequence Alignments and creates [Sonic Pi](https://sonic-pi.net) code. The resultant code can be pasted into Sonic Pi to create the sonifications. 

By rendering protein data as sound, it is hoped that human psychoacoustic intuition can find new knowledge from large data sets.

This README is written in markdown and is best viewed on GitHub at https://github.com/sonifyed/Protein_Sound/blob/main/README.md

## Installing / Getting started
You will require [Perl](https://www.perl.org) to run scripts (v5.16.3 was used). 

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

It may be easier to print the output of the script to a file. You can do this using the > command. This way the code is saved for later. 

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
The output code must be pasted into Sonic Pi software to create sound. Click the 'Run' button in the top left to play the sound.

![Screenshot of code created by running Algorithm-I.pl on protein test.fasta which has been copied and pasted into Sonic Pi GUI](https://github.com/sonifyed/Protein_Sound/blob/main/Sonic-Pi-Screenshot.png?raw=true)


## Links
- Examples Page: https://sonifyed.com/bmc-bioinformatics-2021
- Repository: https://github.com/sonifyed/Protein_Sound/

## Licensing

The code in this project is licensed under [Creative Commons License: Attribution 4.0 International](http://creativecommons.org/licenses/by/4.0/legalcode).


## Repository Contents
**Algorithm-I-example-questionnaire.wav**
Sound File used in Questionnaire Task 1
**Algorithm-I.pl**			                
Algorithm I Perl Script
**Algorithm-II-example-SCTR.wav**      
Sound File from Algorithm II using SCTR_HUMAN (https://www.uniprot.org/uniprot/P47872)
**Algorithm-II.pl**	                
Algorithm II Perl Script
**Algorithm-III-example-SCTR.wav**    
Sound File from Algorithm III using SCTR_HUMAN (https://www.uniprot.org/uniprot/P47872)
**Algorithm-III.pl**               
Algorithm III Perl Script
**Algorithm-IV-example-GPCR.wav**     
Sound File from Algorithm IV using GPCR_MSA detailed in MSAs.pdf
**Algorithm-IV.pl**		                
Algorithm IV Perl Script
**Algorithm-V-example-WD40.wav**      
Sound File from Algorithm V using WD40_MSA detailed in MSAs.pdf
**Algorithm-V-example-questionnaire.wav**
Sound File used in Questionnaire Task 2
**Algorithm-V.pl**                
Algorithm V Perl Script
**MSAs.pdf**	                      
MSAs used in examples
**Questionnaire.pdf**	                
Full content of questionnaire inc. Tasks 1 and 2
**Representative_Statements.pdf**     
Complete Focus Group representative statements

