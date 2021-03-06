#!/usr/bin/env nextflow

/* params { */
	params.read1 = "$baseDir/data/wgs/mt_1.fq.gz"
	params.read2 = "$baseDir/data/wgs/mt_2.fq.gz"
	params.threads = 1
	params.sortmem = "1G"
	params.genome = "$baseDir/data/seq/hg19.fa"
/*} */

fq_read1 = file(params.read1)
fq_read2 = file(params.read2)
genome = file(params.genome)
 
/*
 * simple bwa-mem align
 */

process align {
 
    input:
    file fq_read1 
    file fq_read2 
     
    output:
    file outfile

    """
	bwa mem -M -t ${params.threads} ${genome} ${fq_read1} ${fq_read2} > outfile
    """
}
