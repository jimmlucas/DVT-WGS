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

The pipeline requires nextflow and Docker on the target system. These are often pre-installed on HPC systems.

It is recommended that you pre-pull the Docker imagen required by the workflow, there is a script "Dockerfile" in the workflow directory to help you with this, just run:

```
docker pull jimmlucas/dvt
```
If you want run the workflow in local location, you can create a new env. conda using the file "envWGS.yaml", just run:

```
conda env create -n newenv -f envWGS.yaml
```
## Preparation of inputs

The pipeline requries a refence-genome, that geneme will be index using bwa and create a dictionary. These can be created at the firs step, just be sure move your reference- genome to the corrected directory.

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
