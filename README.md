Locally
=======

	wget -qO- get.nextflow.io | bash
    nextflow cloud create bwa-nextflow-test -c 1


On the AWS cluster created above
================================

    apt-get install openjdk-8-jre bwa samtools graphviz
    chmod +x nextflow && ./nextflow run brainstorm/bwa-nextflow-benchmark -with-timeline timeline.html -with-trace -with-dag flowchart.png


On a HPC cluster
================

	module load java && conda install bwa samtools
	nextflow run main.nf -with-timeline timeline.html -with-trace -with-dag flowchart.png -profile cluster

TODO
====

* ~~Test on raijin (PBS Pro HPC system)~~
* ~~Add samtools sort~~
* Ansible deployment after `nextflow cloud create`?
* Test on kops deployed kubernetes cluster.
* Piping/channels process to compare with normal I/O process
