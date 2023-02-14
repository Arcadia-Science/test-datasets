# phylorthology

## Information & purpose

This repository holds the test dataset and the input file for the [phylorthology pipeline](https://github.com/Arcadia-Science/phylorthology).

The [samplesheet CSV](downsamp_test_tsar_samplesheet.csv) includes all the file paths and required metadata for the test proteomes. The [nextflow_parameters.json](tsar_downsamp_test_parameters.json) file specifies all the inputs to the [phylorthology pipeline](https://github.com/Arcadia-Science/phylorthology) and can be used via the `-params-file` CLI option.

## Test dataset curation
The test dataset is comprised of 6 species of TSAR eukaryotes (Telonemia, Stramenopiles, Alveolata, and Rhizaria). Protein sequences for all but one species (*Telonema subtile*) were obtained from uniprot as a reference proteome. Protein sequences of *Telonema subtile* were obtained from the EukProt V3 (https://evocellbio.com/eukprot/). These datasets were filtered to exclude AA sequences < 50 AA long, and in the case of *Telonema* (for which protein sequences were obtained from a transcriptome assesmbly) only the single longest isoform per assembled gene was retained. The downsampled dataset was generated through random sampling of 5% of each species' protein sequences using seqkit (https://github.com/shenwei356/seqkit). The script used to do this is included in tsar-phylorthology repository.
