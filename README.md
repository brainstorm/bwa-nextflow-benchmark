Locally
=======

    nextflow cloud create bwa-nextflow-test -c 1


On the AWS cluster
==================

    apt-get install openjdk-8-jre bwa graphviz
    ./nextflow run brainstorm/bwa-nextflow-benchmark -with-timeline timeline.html -with-trace -with-dag flowchart.png


TODO
====

* Test on raijin
* Add samtools sort:
samtools sort  -@ 16 -m 768M -T /mnt/work/icgc_mb/mb_workflow/work/bcbiotx/tmppN1MkM/control_downsample-sort-80000001_160000000-sorttmp-spl -o /mnt/work/icgc_mb/mb_workflow/work/bcbiotx/tmpx5WRJU/control_downsample-sort-80000001_160000000-sr.bam -) --discordantFile >(/mnt/work/bcbio/galaxy/../anaconda/bin/samtools sort  -@ 16 -m 768M -T /mnt/work/icgc_mb/mb_workflow/work/bcbiotx/tmppN1MkM/control_downsample-sort-80000001_160000000-sorttmp-disc -o
/mnt/work/icgc_mb/mb_workflow/work/bcbiotx/tmpnsnTaV/control_downsample-sort-80000001_160000000-disc.bam -) | /mnt/work/bcbio/galaxy/../anaconda/bin/samtools sort -n -@ 16 -m 1G -T /mnt/work/icgc_mb/mb_workflow/work/bcbiotx/tmppN1MkM/control_downsample-sort-80000001_160000000-sorttmp-full -o /mnt/work/icgc_mb/mb_workflow/work/bcbiotx/tmppN1MkM/control_downsample-sort-80000001_160000000.bam 

* Ansible deployment?
* Piping/channels process to compare with normal I/O process
