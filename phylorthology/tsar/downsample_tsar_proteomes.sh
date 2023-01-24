#!/bin/bash
seqkit sample -p 0.10 ./complete_proteomes/Amoebophrya_sp_A120.fasta -o ./downsampled_proteomes/Amoebophrya_sp_A120_downsamp.fasta
seqkit sample -p 0.10 ./complete_proteomes/Aureococcus_anophagefferens.fasta -o ./downsampled_proteomes/Aureococcus_anophagefferens_downsamp.fasta
seqkit sample -p 0.10 ./complete_proteomes/Cafeteria_burkhardae.fasta -o ./downsampled_proteomes/Cafeteria_burkhardae_downsamp.fasta
seqkit sample -p 0.10 ./complete_proteomes/EP00656_Telonema_subtile.fasta -o ./downsampled_proteomes/EP00656_Telonema_subtile_downsamp.fasta
seqkit sample -p 0.10 ./complete_proteomes/Plasmodiophora_brassicae.fasta -o ./downsampled_proteomes/Plasmodiophora_brassicae_downsamp.fasta
seqkit sample -p 0.10 ./complete_proteomes/Tetrahymena_thermophila.fasta -o ./downsampled_proteomes/Tetrahymena_thermophila_downsamp.fasta
