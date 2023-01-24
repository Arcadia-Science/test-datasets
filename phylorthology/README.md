# phylorthology

## Information & purpose

This repository holds the test dataset and the input file for the [phylorthology pipeline](https://github.com/Arcadia-Science/phylorthology).

The [samplesheet CSV](samplesheet_test.csv) includes all the file paths and the metadata for the test proteomes. The [nextflow_parameters.json](nextflow_parameters.json) file specifies all the inputs to the [phylorthology pipeline](https://github.com/Arcadia-Science/phylorthology) and can be used via the `-params-file` CLI option.

## Test dataset curation
The eukaryote dataset is comprised of 6 species, and includes members of a number of highly conserved gene families (e.g. GTPases, Ras, Actins, and DNA polymerases). These subsampled datasets were derived from their corresponding UniProt reference proteomes. 
The TSAR (Telonemia, Stramenopiles, Alveolata, and Rhizaria) also includes 6 species. Protein sequences for all but one species (Telonema subtile) were obtained from uniprot as a reference proteome. Protein sequences of Telonema subtile were obtained from the EukProt V3 (https://evocellbio.com/eukprot/). The "tsar" directory contains two test datasets: "tsar/complete\_proteomes" and "tsar/downsampled\_proteomes". The complete test dataset includes all protein sequences, excluding those with AA sequences < 20 AA long, and in the case of Telonema (for which protein sequences were obtained from a transcriptome assesmbly) only the single longest isoform per assembled gene was retained. The downsampled dataset was generated through random sampling of 10% of each species' protein sequences using seqkit (https://github.com/shenwei356/seqkit). The script used to do this is included in the tsar directory ("tsar/downsample\_tsar\_proteomes.sh").
