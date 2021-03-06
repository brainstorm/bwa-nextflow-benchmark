Locally
=======

	wget -qO- get.nextflow.io | bash
	nextflow run brainstorm/bwa-nextflow-benchmark main.nf


On AWS
======

Assuming you have a working installation of [aws-cli](https://github.com/aws/aws-cli):

    nextflow cloud create bwa-nextflow-test -c 1
    apt-get install openjdk-8-jre bwa samtools graphviz
    chmod +x nextflow && ./nextflow run brainstorm/bwa-nextflow-benchmark -with-timeline timeline.html -with-trace

Sample run:

	bin/aws.sh

On a traditional HPC cluster
============================

Assuming bwa, samtools and a jre are module-loaded or installed:

	nextflow run main.nf -with-timeline timeline.html -with-trace -profile cluster

Sample run:

	bin/hpc.sh

On a Kubernetes cluster
=======================

Install [kubectl](https://kubernetes.io/docs/tasks/kubectl/install/) then [kops (Kubernetes OPerationS)](https://github.com/kubernetes/kops/blob/master/docs/install.md), then follow [Nivenly](https://www.nivenly.com/kops-1-5-1/) k8s setup and [operations](https://www.nivenly.com/2nd-hour/). YMMV but I launch it like this now:

	kops create cluster \
		--node-count 1 \
		--zones ap-southeast-2a \
		--master-zones ap-southeast-2a \
		--dns-zone umccr.nopcode.org \
		--node-size t2.small \
		--master-size t2.small \
		--topology private \
		--networking calico \
		--bastion \
		cluster.umccr.nopcode.org --yes

That is, for non-production testing purposes, with a single AZ to reduce costs.


Plain benchmarks
================

AWS
---

    $ time bwa mem -M -t 32 data/seq/hg19.fa /mnt/work/icgc_mb/data/control_MB99_downsample-1.fastq.gz /mnt/work/icgc_mb/data/control_MB99_downsample-2.fastq.gz > vanilla_bwa_run.sam
    [main] Version: 0.7.15-r1140
    [main] CMD: bwa mem -M -t 32 data/seq/hg19.fa /mnt/work/icgc_mb/data/control_MB99_downsample-1.fastq.gz /mnt/work/icgc_mb/data/control_MB99_downsample-2.fastq.gz
    [main] Real time: 19522.095 sec; CPU: 604843.360 sec

    real    325m22.271s
    user    9976m23.400s
    sys     104m20.124s

	
	$ time samtools view -@ 32 -bS vanilla_bwa_run.sam > vanilla_bwa_run.bam

	real    208m17.284s
	user    1086m22.328s
	sys     107m55.372s


	(with ulimit -n 65535):

	$ time samtools sort -m2G -@ 32 -o vanilla_bwa_run-sorted.bam vanilla_bwa_run.bam                                               
	[bam_sort_core] merging from 544 files...

	real    281m46.054s
	user    1259m7.888s
	sys     1306m51.124s

HPC
---
	$ qsub -I -lwalltime=48:00:00 -lmem=128GB -lncpus=28 -q normalbw -lsoftware=bcbio

    $ time bwa mem -M -t 28 data/seq/hg19.fa ../../ICGC_MB/data/control_MB99_100x-1.fastq.gz ../../ICGC_MB/data/control_MB99_100x-2.fastq.gz > vanilla_bwa_run.sam

	 [main] Version: 0.7.15-r1140
	 [main] CMD: bwa mem -M -t 28 data/seq/hg19.fa ../../ICGC_MB/data/control_MB99_100x-1.fastq.gz ../../ICGC_MB/data/control_MB99_100x-2.fastq.gz
	 [main] Real time: 18189.578 sec; CPU: 470541.623 sec

	 real    303m31.665s
	 user    7772m3.629s
	 sys     70m18.087s


     $ time samtools view -@ 28 -bS vanilla_bwa_run.sam > vanilla_bwa_run.bam

     real    146m49.434s
     user    740m15.296s
     sys     27m38.826s


	$ time samtools sort -m2G -@ 28 -o vanilla_bwa_run-sorted.bam vanilla_bwa_run.bam                                                             
	[bam_sort_core] merging from 560 files...

	real    173m36.295s
	user    976m14.792s
	sys     90m40.223s


TODO
====

* Ansible deployment after `nextflow cloud create`?
* Piping/channels process to compare with normal I/O process
