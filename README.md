# Protein_Sound
Five algorithms for sonifying proteins and protein Multiple Sequence Alignments.

These scripts take FASTA protein sequences or FASTA protein Multiple Sequence Alignments and create sonic pi code [Link](https://sonic-pi.net). The resultant code can be pasted into Sonic Pi to create the sonifications. 

By rendering protein data as sound, it is hoped that human psychoacoustic intuition can find new knowledge from large data sets.

## Installing / Getting started
To run the scripts you will require Perl (v5.16.3 was used). 

To create sound from the output scripts you will need Sonic Pi (v3.1.0 or later)


The algorithms are given as Perl scripts. They do not require installation. They can be run in the command line. 



```shell
packagemanager install awesome-project
awesome-project start
awesome-project "Do something!"  # prints "Nah."
```

Here you should say what actually happens when you execute the code above.

## Features

What's all the bells and whistles this project can perform?
* What's the main functionality
* You can also do another thing
* If you get really randy, you can even do this

## Configuration

Here you should write what are all of the configurations a user can enter when
using the project.

#### Argument 1
Type: `String`  

The first argument details the name of the input FASTA file. For algorithms I, II, and III, these will be protein sequence files. For algorithms IV and V, these will be FASTA Multiple Sequence Alignments.

#### Argument 2
Type: `string`  

This is the name of the output file. It will be created in the current working directory. The file will contain code that can be copied and pasted (or otherwise executed) in Sonic Pi software.

Example:
```bash
Algorithm-I.pl Example.fasta Example-Sonic-Pi.txt # Prints to file sonic-pi code for sonifictaion 
```

#### Sonic Pi
The output code must be entered into sonic pi software to create sound. 

Image of Sonic pi and click play


## Links

Even though this information can be found inside the project on machine-readable
format like in a .json file, it's good to include a summary of most useful
links to humans using your project. You can include links like:

- Project homepage: https://your.github.com/awesome-project/
- Repository: https://github.com/sonifyed/Protein_Sound/
- Issue tracker: https://github.com/your/awesome-project/issues
  - In case of sensitive bugs like security vulnerabilities, please contact
    my@email.com directly instead of using issue tracker. We value your effort
    to improve the security and privacy of this project!
- Related projects:
  - Your other project: https://github.com/your/other-project/
  - Someone else's project: https://github.com/someones/awesome-project/


## Licensing

One really important part: Give your project a proper license. Here you should
state what the license is and how to find the text version of the license.
Something like:

"The code in this project is licensed under MIT license."



Algorithm-I-example-questionnaire.wav		Sound File used in Questionnaire Task 1
Algorithm-I.pl					                Algorithm I Perl Script
Algorithm-II-example-SCTR.wav			      Sound File from Algorithm II using SCTR_HUMAN (https://www.uniprot.org/uniprot/P47872)
Algorithm-II.pl					                Algorithm II Perl Script
Algorithm-III-example-SCTR.wav			    Sound File from Algorithm III using SCTR_HUMAN (https://www.uniprot.org/uniprot/P47872)
Algorithm-III.pl				                Algorithm III Perl Script
Algorithm-IV-example-GPCR.wav			      Sound File from Algorithm IV using GPCR_MSA detailed in MSAs.pdf
Algorithm-IV.pl					                Algorithm IV Perl Script
Algorithm-V-example-WD40.wav			      Sound File from Algorithm V using WD40_MSA detailed in MSAs.pdf
Algorithm-V-example-questionnaire.wav		Sound File used in Questionnaire Task 2
Algorithm-V.pl					                Algorithm V Perl Script
MSAs.pdf					                      MSAs used in examples
Questionnaire.pdf				                Full content of questionnaire inc. Tasks 1 and 2
Representative_Statements.pdf			      Complete Focus Group representative statements

