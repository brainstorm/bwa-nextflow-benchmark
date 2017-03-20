#!/usr/bin/env nextflow
 
params.read1 = "$workflow.repository/data/wgs/mt_1.fq.gz"
params.read2 = "$workflow.repository/data/wgs/mt_2.fq.gz"

params.genome = "$workflow.repository/data/seq/hg19.fa"

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
	bwa mem -M -t 1 ${genome} ${fq_read1} ${fq_read2} > outfile
    """
}
