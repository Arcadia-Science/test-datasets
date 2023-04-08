# sourmash gather and taxonomy files for test runs

These test files and CSV are used for testing purposes for the Arcadia-Science/metagenomics workflow to ensure the `sourmash gather` and `sourmash taxannoate` modules of the workflow are working properly.

## Generating mini sourmash dbs
The genomes of *E. coli* and *S. pneumoniae* were downloaded and each made into a sourmash dastabase with `sourmash sketch`:

```
sourmash sketch dna -p k=21,k=31,k=51,scaled=1000,abund -o GCF_003697165.2.db.zip --name GCF_003697165.2 GCF_003697165.2.fasta

sourmash sketch dna -p k=21,k=31,k=51,scaled=1000,abund -o GCF_001457635.1.db.zip --name GCF_001457635.1 GCF_001457635.1.fasta
```

Two lineage CSVs for each genome were generated based on the existing Arcadia-Science/seqqc contam db lineage CSV.

## sourmash test CSV
The CSV to feed into the workflow for test configurations lists the databases and lineage files separately so it tests if the workflow takes in the CSV and sets up the `sourmash gather` and `sourmash taxannotate` commands where it runs all input dbs in a single command per sample.
