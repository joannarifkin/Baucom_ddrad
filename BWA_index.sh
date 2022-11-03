#!/bin/bash

#SBATCH --account=rsbaucom0
#SBATCH --job-name=bwa_index_Rifkin_Hesperis
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --cpus-per-task=1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=3GB 
#SBATCH --time=30:00
#SBATCH --partition=standard
#SBATCH --output=BWA_index-%A-%a.log

module purge
module load Bioinformatics
module load Bioinformatics  gcc/10.3.0-k2osx5y
module load bwa/0.7.17-mil4ns7
module list


bwa index /nfs/turbo/rsbaucom/lab/Hesperis_Dovetail/Hi-Rise_Assembly_September_2022/Hesperis_assembly.fasta