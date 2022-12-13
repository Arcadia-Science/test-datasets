This repository holds the test dataset for the [seqqc pipeline](https://github.com/Arcadia-Science/seqqc).
The dataset is composed of three Sequence Read Archive samples, all of which were sequenced from *Escherichia coli* strain DSM 30083=JCM 1649=ATCC 11775
We downloaded FASTQ files from the European Nucleotide Archive and then subsampled using the code below.

Code to download:
```
# SRR11550236 # minion RNAseq
curl -JLO https://ftp.sra.ebi.ac.uk/vol1/fastq/SRR115/036/SRR11550236/SRR11550236_1.fastq.gz
# SRR3927310 # illumina genomic
curl -JLO https://ftp.sra.ebi.ac.uk/vol1/fastq/SRR392/000/SRR3927310/SRR3927310_1.fastq.gz
curl -JLO https://ftp.sra.ebi.ac.uk/vol1/fastq/SRR392/000/SRR3927310/SRR3927310_2.fastq.gz
# SRR8528939 # illumina RNAseq
curl -JLO https://ftp.sra.ebi.ac.uk/vol1/fastq/SRR852/009/SRR8528939/SRR8528939.fastq.gz
```

Code to subsample:
```
for infile in SRR*9*fastq.gz
do
bn=$(basename ${infile} .fastq.gz)
gunzip -c $infile | head -n 40000 | gzip > ${bn}_10k.fq.gz
done

gunzip -c SRR11550236_1.fastq.gz | head -n 4000 | gzip > SRR11550236_1_1k.fq.gz
```

