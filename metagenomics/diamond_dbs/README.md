# Test Diamond Databases

The file `test-cheese-proteins-db.dmnd` is a small DIAMOND database made from proteins from the subsetted cheese assemblies that are used as test inputs to the `Arcadia-Science/metagenomics` workflow, from both the Illumina and Nanopore samples. The database was created by predicting proteins from these subsetted sample files using `prodigal` from the workflow, concatenating them together, and creating a DIAMOND database with `diamond makedb --in concatenated_cheese_proteins.fasta --db test-cheese-proteins-db.dmnd`.
