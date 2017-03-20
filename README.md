Locally
=======

    nextflow cloud create bwa-nextflow-test -c 1


On the AWS cluster
==================

    apt-get install openjdk-8-jre bwa graphviz
    ./nextflow run brainstorm/bwa-nextflow-benchmark -with-timeline timeline.html -with-trace -with-dag flowchart.png
