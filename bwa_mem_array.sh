#!/bin/bash

#SBATCH --account=rsbaucom0
#SBATCH --job-name=bwa_mem_Rifkin
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --cpus-per-task=6
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=12GB
#SBATCH --time=24:00:00
#SBATCH --output=bwa_mem-%A-%a.log
#SBATCH --partition=standard
#SBATCH --array=1-9%2


module purge
module load Bioinformatics
module load Bioinformatics  gcc/10.3.0-k2osx5y
module load bwa/0.7.17-mil4ns7
module load samtools/1.13-fwwss5n
module list

file=$(ls /nfs/turbo/rsbaucom/lab/Hesperis_ddRAD_September_2022/fastqs_6799-SB/demultiplexed/trimmed-barcode0*.1.fastq.gz | sed -n ${SLURM_ARRAY_TASK_ID}p)
samplename=${file%1.fastq.gz}

#echo $file
echo $samplename

  bwa mem /nfs/turbo/rsbaucom/lab/Hesperis_Dovetail/Hi-Rise_Assembly_September_2022/Hesperis_assembly.fasta \
  -t 8 \
  $samplename\1.fastq.gz \
  $samplename\2.fastq.gz | \
  samtools sort -@8 -o $samplenamebam

#By default, this puts the output in the same directory as the input fastq files. 