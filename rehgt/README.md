## Test data sets for nextflow rehgt workflow

I made these data sets by running the rehgt pipeline on the Bigelowiella genus.
The only Bigelowiella genome with gene models is very small with just over 300 genes.
Instead of running the diamond blastp step against the full clustered NR database (`nr_rep_seq.fasta.gz`, see [this repo](https://github.com/Arcadia-Science/2023-nr-clustering) for how this file was made), I ran head on the fasta file to subset it to the first 100k lines (50k proteins) and ran against that:

```
gunzip -c nr_rep_seq.fasta.gz | head -n 100000 | gzip > nr_rep_seq_head100k.fasta.gz
```

Once I had hits for Bigelowiella, I extracted them using grep, producing a very small database:
```
while read inline
do
  grep -A 1 $inline ~/github/2023-rehgt/inputs/nr_rep_seq_head100k.fasta >> bigelowiella_test_nr.fasta
done < bigelowiella_test_fa_names.tsv
```

I also made a new sqlite database that only contained lineages for these matches. I did this in R:
```
lca_db_path <- "~/github/2023-rehgt/inputs/nr_cluster_taxid_formatted_final.sqlite"
blast_tsv <- "~/github/2023-rehgt-nextflow/out_test/blastp/Bigelowiella_vs_clustered_nr.tsv"

# connect to the database
lca_db <- DBI::dbConnect(RSQLite::SQLite(), lca_db_path)

# define the table to query
lca <- tbl(lca_db, "nr_cluster_taxid_table")

# read in the BLAST results
blast <- read_tsv(blast_tsv,
                  col_names = c("qseqid", "qtitle", "sseqid", "stitle", "pident", "approx_pident", "length", 
                                "mismatch", "gapopen", "qstart", "qend", "qlen", "qcovhsp", "sstart", "send", 
                                "slen", "scovhsp", "evalue", "bitscore", "score", "corrected_bitscore"))

# make a vector for the sequence ids to retrieve lineages from the sql db for
tmp_query <- unique(blast$sseqid)

# run the SQL query
blast_lca_full <- lca %>%
  filter(rep %in% tmp_query) %>%
  collect()

write_tsv(blast_lca_full, "~/github/2023-rehgt-nextflow/bigelowiella_test_lca.tsv")
db <- dbConnect(SQLite(), dbname = "~/github/2023-rehgt-nextflow/bigelowiella_test_lca.sqlite") 
dbWriteTable(conn = db, name = "nr_cluster_taxid_table", value = "~/github/2023-rehgt-nextflow/bigelowiella_test_lca.tsv", sep="\t")
dbDisconnect(db)
```


I confirmed that this set of test files produces HGT candidates, although they are **completely insensible and biologically wrong**, but that isn't particularly important for this test data set, whose purpose is to make sure the workflow runs.

Potential improvements for the future:
1. Adding genera that have multiple genomes
2. Adding more than one genera
