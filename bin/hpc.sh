#!/bin/sh -x

time nextflow run main.nf -with-timeline timeline.html -with-trace -profile hpc-raijin --read1 /g/data/gx8/projects/ICGC_MB/data/control_MB99_downsample-1.fastq.gz --read2 /g/ data/gx8/projects/ICGC_MB/data/control_MB99_downsample-2.fastq.gz --threads 64
