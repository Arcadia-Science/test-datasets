# Noveltree

## Information & purpose

This repository holds the test dataset and the input file for the [Noveltree pipeline](https://github.com/Arcadia-Science/noveltree).

The [samplesheet CSV](downsamp_test_tsar_samplesheet.csv) includes all the file paths and required metadata for the test proteomes. The [nextflow_parameters.json](tsar_downsamp_test_parameters.json) file specifies all the inputs to the [Noveltree pipeline](https://github.com/Arcadia-Science/noveltree) and can be used via the `-params-file` CLI option.

## Test dataset curation

The test dataset is comprised of 6 species of TSAR eukaryotes (Telonemia, Stramenopiles, Alveolata, and Rhizaria). Protein sequences for all but one species (_Telonema subtile_) were obtained from uniprot as a reference proteome. Protein sequences of _Telonema subtile_ were obtained from the EukProt V3 (https://evocellbio.com/eukprot/). These datasets were filtered to exclude AA sequences < 50 AA long, and in the case of _Telonema_ (for which protein sequences were obtained from a transcriptome assesmbly) only the single longest isoform per assembled gene was retained. The downsampled dataset was generated through random sampling of 5% of each species' protein sequences using seqkit (https://github.com/shenwei356/seqkit). The script used to do this is included in [tsar-noveltree](https://github.com/Arcadia-Science/2023-tsar-noveltree) repository.
