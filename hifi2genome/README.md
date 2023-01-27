# hifi2genome test dataset

## Information and Purpose
This subsampled dataset was generated as a test dataset for the Arcadia-Science/hifi2genome workflow for assembling PacBio Hifi reads into a single genome and performing QC stats on the resulting assembly. This test dataset was generated from one of [PacBio's Hifi datasets](https://www.pacb.com/connect/datasets/) from the food safety and infectious microbes 96plex dataset. The reads for Escherichia coli K12 MG1655 were downloaded for the demultiplexed reads for barcode 2008 and Escherichia coli H10407 for barcode bc2007.

## Subsample the reads
Reads were subsampled to a more manageable size for uploading to github and running as a first pass test for the workflow. Both datasets form a circular assembly so chances are subsetting down randomly will catch reads that form part of the assembly.

The workflow takes in FASTQ reads as input, so the downloaded BAM files were converted to FASTQ with `samtools bam2fq`

`seqtk sample e_coli_k12_2008.fq 500 > e_coli_k12_2008_subsampled.fq`
`seqtk sample e_coli_H10407.fq 500 > e_coli_H10407_2007_subsampled.fq`

The files were compressed and are listed as ecoli_K12 and ecoli_H10407 in the samplesheet_test.csv file.

Currently the test dataset takes ~30 minutes to assemble and finish the QC part so there is room to subsample the reads down more.
