# seqqc

## Information & purpose

This repository holds the test dataset for the [seqqc pipeline](https://github.com/Arcadia-Science/seqqc).
The dataset is composed of three Sequence Read Archive samples, all of which were sequenced from *Escherichia coli* strain DSM 30083=JCM 1649=ATCC 11775.
We selected this strain because it is present in the [seqqc contamination detection database](https://osf.io/jpdte) and so produces results for the `sourmash gather` processes.
We also selected a mix of long read, short read, paired end, and single end data to test the pipeline with.
In general, we recommend that the seqqc pipeline be run with with only one chemistry (either all short reads or all long reads) for a given run as this will produce the best visualizations, but combining these is useful for testing the pipeline with one test run.

## Test data set generation

We downloaded FASTQ files from the European Nucleotide Archive and then subsampled using the code below.

Code to download:
```
# SRR11550236 # minion RNAseq
curl -JLO https://ftp.sra.ebi.ac.uk/vol1/fastq/SRR115/036/SRR11550236/SRR11550236_1.fastq.gz
# SRR3927310 # illumina genomic
curl -JLO https://ftp.sra.ebi.ac.uk/vol1/fastq/SRR392/000/SRR3927310/SRR3927310_1.fastq.gz
curl -JLO https://ftp.sra.ebi.ac.uk/vol1/fastq/SRR392/000/SRR3927310/SRR3927310_2.fastq.gz
# SRR8528939 # illumina RNAseq
curl -JLO https://ftp.sra.ebi.ac.uk/vol1/fastq/SRR852/009/SRR8528939/SRR8528939.fastq.gz
```

Code to subsample:
```
for infile in SRR*9*fastq.gz
do
bn=$(basename ${infile} .fastq.gz)
gunzip -c $infile | head -n 40000 | gzip > ${bn}_10k.fq.gz
done

gunzip -c SRR11550236_1.fastq.gz | head -n 4000 | gzip > SRR11550236_1_1k.fq.gz
```

## Full-sized test data sets

This folder contains five full-sized test data sets.
These data sets represent different read lengths, paired endedness, and sequencing chemistries.
The data sets are designed to be automatically run when pull requests are made from the `dev` branch to the `master` branch in the seqqc pipeline.
This makes sure that the pipeline runs successfully in a variety of settings and produces example reports.

Below we provide a description of each data set.
Each data set is specified in a CSV file.
The links to the full-sized files are recorded within the CSV file and can be used to download the files using `curl` (see commands above).
The Nextflow pipeline seqqc downloads the data sets automatically using the sample sheets as input.

* [`samplesheet_full.csv`](./samplesheet_full.csv): the full FASTQ files for the `test` data set, described above.
* [`samplesheet_illumina.csv`](./samplesheet_illumina.csv): Illumina sequencing from [PRJEB57452](https://www.ebi.ac.uk/ena/browser/view/PRJEB57452). The study includes 11 paired-end metagenomes, each of which represents a cheese microbiome.
* [`samplesheet_hifi.csv`](./samplesheet_hifi.csv): PacBio Hifi sequencing from [PRJNA909772](https://www.ebi.ac.uk/ena/browser/view/PRJNA909772). Three of the five single end files were selected to include in the test data set. Each represents whole genome sequencing of the barn swallow (*Hirundo rustica*).
* [`samplesheet_isoseq.csv`](./samplesheet_isoseq.csv): PacBio Isoseq sequencing from [PRJNA834823](https://www.ebi.ac.uk/ena/browser/view/PRJNA834823). The study includes 1 long-read transcriptome from the salivary glands of 10 adult female lone star ticks (*Amblyomma americanum*).
* [`samplesheet_nanopore.csv`](./samplesheet_nanopore.csv): Nanopore sequencing from [PRJEB58160](https://www.ebi.ac.uk/ena/browser/view/PRJEB58160). Six of 15 single end files were selected to include in the test data set. Each represents metagenome sequencing of cheese microbial communities.
