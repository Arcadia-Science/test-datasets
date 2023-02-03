# hifi2genome test datasets
This README describes how the test datasets for both the subsampled mini test and full test of the Arcadia-Science/hifi2genome workflow were created. These test datasets were generated from the [PacBio's Hifi datasets](https://www.pacb.com/connect/datasets/) from the food safety and infectious microbes 96plex dataset.

## Subsampled mini test dataset
Reads were subsampled from the demultiplexed reads for barcode 2008 and barcode 2007 for Escherichia coli K12 MG1655 and Escherichia coli H10407 respectivley to a more manageable size for uploading to github and running as a first pass test for the workflow. Both datasets form a circular assembly so chances are subsetting down randomly will catch reads that form part of the assembly.

The workflow takes in FASTQ reads as input, so the downloaded BAM files were converted to FASTQ with `samtools bam2fq`

`seqtk sample e_coli_k12_2008.fq 500 > e_coli_k12_2008_subsampled.fq`
`seqtk sample e_coli_H10407.fq 500 > e_coli_H10407_2007_subsampled.fq`

The files were compressed and are listed as ecoli_K12 and ecoli_H10407 in the samplesheet_test.csv file.

Currently the test dataset takes ~30 minutes to assemble and finish the QC part so there is room to subsample the reads down more.

## Full sized test dataset
One replicate from each of the 24 food safety and infectious microbes dataset was downloaded and the BAM files were converted to fastq with `samtools bam2fq`. These compressed fastq files were uploaded to a public AWS S3 bucket for running full tests of the workflows.
