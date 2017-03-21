#!/usr/bin/env nextflow

params {
	read1 = "$baseDir/data/wgs/mt_1.fq.gz"
	read2 = "$baseDir/data/wgs/mt_2.fq.gz"
	threads = 1
	sortmem = "1G"
	genome = "$baseDir/data/seq/hg19.fa"
}

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

process sort {

	input:
	file outfile

	output:
	file result

	"""
	samtools sort -n -@ ${params.threads} -m ${params.sortmem} -o result outfile
	"""
}
