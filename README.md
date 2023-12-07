# DVT-WGS
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![license-shield]][license-url]

Nextflow- Evolutionary divergence time / Divergence Time estimation using SNPs.
Pipeline for standardised Quality analisis, mapping and variant calls on yeast genomes. The pipeline take input: fastqs, followed by hard filtering and outputs: html, bams, and gvcfs for joint genotyping.

## Process:

The recommended way is to clone it from github:
```
git clone https://github.com/jimmlucas/DVT-WGS.git
cd DVT-WGS
```
## Requirements

The pipeline requires NextFlow and Docker on the target system. These are often pre-installed on HPC systems.

It is recommended that you pre-pull the Docker imagen required by the workflow, there is a script "Dockerfile" in the workflow directory to help you with this, just run:

```
docker pull jimmlucas/dvt
```
If you want to run the workflow in local location, you can create a new conda enviroment using the file "envWGS.yaml", just run:

```
conda env create -n newenv -f envWGS.yaml
```
## Preparation of inputs

***Download***

If you already have the reads downloaded or perhaps you will use your data, ignore this step and proceed to the next one. However, if you plan to use reads form the DB, you can use a script "download_reads.sh" to download all the data, just nead an input list in the format .txt "Acc_List.txt". Then, run the script in the root using: 

```
bash ./bin/download_reads.sh 
```

***Reference-genome***

The pipeline requires a refence-genome, which will be index using BWA and create a dictionary. These can be done in the first step. Just be sure to move your reference-genome to the corrected directory. Remember to give all the necessary access to your reference file. Use the following command:

```
chmod 644 $projectDir/data/reference-genome/reference-genome/*.fasta
```

Befor start all the process in NextFlow, you must to know what happens in the entire workflow.
## How is works ?

To estimate Divergence Times (DVT) in this case, I decided to use SNPs from a WGS data used in the publication [Nespolo et al, 2020](https://journals.plos.org/plosgenetics/article?id=10.1371/journal.pgen.1008777), to estimate DVT in sub-populations of *S.eubayanus*.

The finality of this workflow, step by step using NextFlow, was to connect all the process of curating data and reduce the time of processing. 

The workflow was classified in order to:

* Quality-(Fastqc): quality control raw data
* Trimming-(Trimmomatic): reduce the noise and adaptators
* Quality control-(Fastqc): second quality control
* Mapping-(BWA): 
* Identification of Duplicate-(GATK): 
* Filter of SNPs-(GATK): 

After all these processes, you get a VCF with all the filtered SNPs. 

Depending on the objective of your project, you can continue with this process or skip it and proceed in other way.

Now, you can run the following command:

Using Docker:
```
nextflow run tutorial.nf -with-docker jimmlucas/dvt:wgs
```
if you are using a local envieroment in conda:
```
nextflow run tutotial.nf
```
## Determination of DVT using SNPS

Estimate Time of Divergence is not an easy task, and depending on the objetive of your project, you might have to use others methods. In this case, I decide use SNPs to determine DVT.

First of all, we have to determinate the model of substitution that we need to use. In this case, I want to introduce how to select a substitution model for phylogenetic analysisi with the sofware PAUP.

*PAUP* is a program develop in 1980 used for inferring models of substitution. The author is Dave Swofford, who has never relased a final version. You could use a tested version for free on his new [WEBSITE](http://phylosolutions.com/paup-test/)

You can find the interface version or a commond-line version for Mac OS X or Windows.




```

```

[contributors-shield]: https://img.shields.io/github/contributors/jimmlucas/DVT-WGS.svg?style=for-the-badge

[contributors-url]: https://github.com/jimmlucas/DVT-WGS/graphs/contributors

[forks-shield]: https://img.shields.io/github/forks/jimmlucas/DVT-WGS.svg?style=for-the-badge
[forks-url]: https://github.com/jimmlucas/DVT-WGS/network/members

[stars-shield]: https://img.shields.io/github/stars/jimmlucas/DVT-WGS.svg?style=for-the-badge
[stars-url]: https://github.com/gjimmlucas/DVT-WGS/stargazers

[issues-shield]: https://img.shields.io/github/issues/jimmlucas/DVT-WGS.svg?style=for-the-badge
[issues-url]: https://github.com/jimmlucas/DVT-WGS/issues

[license-shield]: https://img.shields.io/github/license/jimmlucas/DVT-WGS.svg?style=for-the-badge
[license-url]: https://github.com/jimmlucas/DVT-WGS/blob/master/LICENSE.txt
