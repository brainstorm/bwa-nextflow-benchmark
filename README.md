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

AWS:

Using Nextflow
--------------

	[main] Version: 0.7.15-r1140
	[main] CMD: bwa mem -M -t 32 data/seq/hg19.fa /mnt/work/icgc_mb/data/control_MB99_downsample-1.fastq.gz /mnt/work/icgc_mb/data/control_MB99_downsample-2.fastq.gz
	[main] Real time: 18923.516 sec; CPU: 599486.676 sec

	real    315m23.609s
	user    9926m45.216s
	sys     64m41.536s

Without Nextflow
----------------

	
	$ time samtools view -@ 32 -bS vanilla_bwa_run.sam > vanilla_bwa_run.bam

	real    208m17.284s
	user    1086m22.328s
	sys     107m55.372s





TODO
====

* Ansible deployment after `nextflow cloud create`?
* Piping/channels process to compare with normal I/O process
