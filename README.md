Locally
=======

    nextflow cloud create bwa-nextflow-test -c 1


On the AWS cluster
==================

    apt-get install openjdk-8-jre bwa samtools graphviz
    ./nextflow run brainstorm/bwa-nextflow-benchmark -with-timeline timeline.html -with-trace -with-dag flowchart.png


TODO
====

* ~~Test on raijin (PBS Pro HPC system)~~
* ~~Add samtools sort~~
* Ansible deployment?
* Test on kops deployed kubernetes cluster.
* Piping/channels process to compare with normal I/O process
