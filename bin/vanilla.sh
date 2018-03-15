#!/bin/sh

time bwa mem -M -t 32 data/seq/hg19.fa /mnt/work/icgc_mb/data/control_MB99_downsample-1.fastq.gz /mnt/work/icgc_mb/data/contro
l_MB99_downsample-2.fastq.gz > vanilla_bwa_run.sam

qsub -I -lwalltime=48:00:00 -lmem=128GB -lncpus=28 -q normalbw -lsoftware=bcbio
time bwa mem -M -t 32 data/seq/hg19.fa ../../ICGC_MB/data/control_MB99_downsample-1.fastq.gz ../../ICGC_MB/data/control_MB99_downsample-2.fastq.gz > vanilla_bwa_run.sam

-bash-4.1$ module load allinea-reports/7.0.0
-bash-4.1$ perf-report bwa mem -M -t 32 data/seq/hg19.fa ../../ICGC_MB/data/control_MB99_downsample-1.fastq.gz ../../ICGC_MB/data/control_MB99_downsample-2.fastq.gz > vanilla_bwa_run.sam


-bash-4.1$ perf-report bwa mem -M -t 32 data/seq/hg19.fa ../../ICGC_MB/data/control_MB99_downsample-1.fastq.gz ../../ICGC_MB/data/control_MB99_downsample-2.fastq.gz > vanilla_bwa_run.sam
Allinea Performance Reports - target file 'bwa' does not exist on this machine... exiting

time samtools view -@ 32 -bS vanilla_bwa_run.sam > vanilla_bwa_run.bam
