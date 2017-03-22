Locally
=======

	wget -qO- get.nextflow.io | bash
    nextflow cloud create bwa-nextflow-test -c 1


On the AWS cluster created above
================================

    apt-get install openjdk-8-jre bwa samtools graphviz
    chmod +x nextflow && ./nextflow run brainstorm/bwa-nextflow-benchmark -with-timeline timeline.html -with-trace -with-dag flowchart.png

Sample run:

    time ~/nextflow run main.nf -with-timeline timeline.html -with-trace -with-dag flowchart.png -profile cloud --read1 /mnt/work/icgc_mb/data/control_MB99_downsample-1.fastq.gz --read2 /mnt/work/icgc_mb/data/control_MB99_downsample-2.fastq.gz --threads 64


On a HPC cluster
================

	module load java && conda install bwa samtools
	nextflow run main.nf -with-timeline timeline.html -with-trace -with-dag flowchart.png -profile cluster

Sample run:

    time nextflow run main.nf -with-timeline timeline.html -with-trace -with-dag flowchart.png -profile cluster --read1 /g/data/gx8/projects/ICGC_MB/data/control_MB99_downsample-1.fastq.gz --read2 /g/data/gx8/projects/ICGC_MB/data/control_MB99_downsample-2.fastq.gz --threads 64

TODO
====

* Ansible deployment after `nextflow cloud create`?
* ~~Test on kops deployed kubernetes cluster~~
* Piping/channels process to compare with normal I/O process
