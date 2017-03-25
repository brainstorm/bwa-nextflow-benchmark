#!/bin/sh -x

time nextflow run main.nf -with-timeline timeline.html -with-trace -profile cloud --read1 /mnt/work/icgc_mb/data/control_MB99_downsample-1.fastq.gz --read2 /mnt/work/icgc_mb/data/control_MB99_downsample-2.fastq.gz --threads 64
