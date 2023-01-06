# hifi2genome workflow test datasets

This samplesheet contains two subsetted PacBio HiFi fastq files to test the hifi2genome workflow for assembling and QCing PacBio Hifi reads to genomes.

## Tick test dataset

This test dataset was generated from PacBio HiFi whole genome sequencing of _A americanum_. HiFi reads were subset with `seqtk`:

```
seqtk sample <reads> 100 > a_americanum_hifi_100_subsampled.css.fq
```

Only the first 100 reads were used as the size of PacBio HiFi fastq files is quite large even subsampled down to 100-1000 reads.
```
