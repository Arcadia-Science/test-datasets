# cheese-ont-metagenomes

## Information & Purpose

These are two subsampled Nanopore metagenomes sequenced from two different cheeses that were sampled at 8 and 12 weeks, respectively. The metagenomes were sequenced using the Nanopore kit [].

## Test Dataset Generation

To create a test dataset for the metagenomics workflow, the test dataset must contain a sufficient number of reads that assemble into contigs to successfully complete the workflow (Flye will error out if there are no assembled reads). Therefore, the test dataset is made up of selected reads that map to assembled contigs ensuring that those reads (most likely) make up that assembled contig. The quick and dirty way of retrieving these reads is:

1. Mapping the metagenomic reads back to the Flye assembly (the assemblies were performed previously for other efforts)
2. Retrieving the number of reads that map to each contig and select contigs with between 2-10 reads mapping to that contig
3. Retrieve the corresponding reads that map to the selected contigs for consolidating into a test dataset

### Mapping
First index the assembly with minimap2 `minimap2 -d om8week_assembly.fasta.mmi om8week_assembly.fasta` and then map the reads with minimap2 `minimap2 -t 4 -x map-ont -a om8week_assembly.fasta.mmi all_omweek8_sup_fastqpass_porechopout.fastq.gz > om_mapping.sam`

Then sort the resulting SAM file with `samtools sort om_mapping.sam > om_mapping.bam` so the resulting BAM file is ordered and indexed with `samtools index om_mapping.bam`. This was done for both samples.

### Retrieve number of reads mapping to each contig
Then with `samtools idxstats` get the number of reads that map to each contig: `samtools idxstats om_mapping.bam | head` to get:

```
contig_1	3809454	732330	0
contig_10	2570	1107	0
contig_100	10249	37	0
contig_1003	6172	6	0
contig_1004	15126	11	0
contig_1005	13936	10	0
contig_1006	8498	6	0
contig_1007	2473	13	0
contig_1008	19984	11	0
contig_1009	6925	8	0
```

Where the first column is the contig name, the second column is the contig length, and the third column is the number of reads that map to that contig (uncertain of what the fourth column of 0s is). We can then filter for the third column for number of reads between 2 and 5 reads mapping (we want more than 1 read so that the reads will actually assemble together). Note that just because a read maps to a contig doesn't mean it necessarily made up that assembled contig as there could be duplicate reads that are similar but only one makes up the contig, so overshooting the number of reads that map to contigs might provide us with sets of reads that actually assemble together.

```
samtools idxstats om_mapping.bam | awk '{ if ($3 >=2 && $3 <=5) print $1"\t"$2"\t"$3 }' | head
```

```
contig_1003	6172	6
contig_1004	15126	11
contig_1005	13936	10
contig_1006	8498	6
contig_1007	2473	13
contig_1008	19984	11
contig_1009	6925	8
contig_1010	2560	6
contig_1011	3087	16
contig_1012	11436	11
```
### Retrieve Corresponding Reads that make up candidate contigs
There are ~120 contigs that meet this criteria. Create a list of those contigs with `samtools idxstats oma_mapping.bam | awk '{ if ($3 >=2 && $3 <=5) print $1 }' > oma_contigs.txt`. Then pass the list of contigs to `samtools view` to create a subset BAM file of just the reads that map to those contigs with `cat oma_contigs.txt | tr "\n" " " | xargs samtools view -bh oma_mapping.bam > oma_subset_reads.bam`.

Then convert the BAM file to fastq for the subsetted reads with `samtools bam2fq om_subset_reads.bam > om_subset_reads.fq`. For this example, the resulting fastq file has 372 reads and is ~4MB in size so this should suffice as a test dataset.

This process was done for both the om8week and el12week samples. The fastqs were gzipped and are listed in the test samplesheet CSV.
