Locally
=======

	wget -qO- get.nextflow.io | bash
	nextflow run brainstorm/bwa-nextflow-benchmark main.nf


On AWS
======

Assuming you have a working installation of [aws-cli](https://github.com/aws/aws-cli):

    nextflow cloud create bwa-nextflow-test -c 1
    apt-get install openjdk-8-jre bwa samtools graphviz
    chmod +x nextflow && ./nextflow run brainstorm/bwa-nextflow-benchmark -with-timeline timeline.html -with-trace -with-dag flowchart.png

Sample run:

    time nextflow run main.nf -with-timeline timeline.html -with-trace -with-dag flowchart.png -profile cloud --read1 /mnt/work/icgc_mb/data/control_MB99_downsample-1.fastq.gz --read2 /mnt/work/icgc_mb/data/control_MB99_downsample-2.fastq.gz --threads 64


On a traditional HPC cluster
============================

Assuming bwa, samtools and a jre are module-loaded or installed:

	nextflow run main.nf -with-timeline timeline.html -with-trace -with-dag flowchart.png -profile cluster

Sample run:

    time nextflow run main.nf -with-timeline timeline.html -with-trace -with-dag flowchart.png -profile cluster --read1 /g/data/gx8/projects/ICGC_MB/data/control_MB99_downsample-1.fastq.gz --read2 /g/data/gx8/projects/ICGC_MB/data/control_MB99_downsample-2.fastq.gz --threads 64


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

TODO
====

* Ansible deployment after `nextflow cloud create`?
* Piping/channels process to compare with normal I/O process
