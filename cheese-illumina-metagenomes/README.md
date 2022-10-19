# cheese-illumina-metagenomes

## Information & Purpose
There are two sets of Illumina metagenomic samples in this directory - `comm_1` and `vir_1`. These samples were acquired from different cheeses, where `comm_1` is a bulk extraction and `vir_1` is a viral enrichment community. These samples were sequenced with 2x150 bp Illumina paired-end sequencing.

## Test Dataset Generation
The raw, unfiltered metagenomes were subsampled using the `seqtk` package:

```
seqtk sample -s100 comm_1_CSFP220022072-1a_HN2W7DSX3_L1_1.fq.gz 1000 > comm_1_subsampled.fq.gz
seqtk sample -s100 comm_1_CSFP220022072-1a_HN2W7DSX3_L1_2.fq.gz 1000 > comm_1_subsampled_2.fq.gz

seqtk sample -s100 vir_1_combined_1.fq.gz 1000 > vir_1_subsampled_1.fq.gz
seqtk sample -s100 vir_1_combined_2.fq.gz 1000 > ../subsampled_fastqs/vir_1_subsampled_2.fq.gz

```

## Full-Sized Dataset

<!-- TODO Add information about where the full-sized dataset is once it is published through pubpub/NCBI -->
