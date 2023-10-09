process BWAMEM {
    tag "align $sample_id sort and index"
    label 'mapping_process'

    publishDir "${params.outdir}/out/3-bwa", mode: 'copy'

    input:
    tuple val(sample_id), path(paired_reads), path(unpaired_reads)
    path(params.reference)

    output:
    tuple val(sample_id), path("${sample_id}.sam"), 
    path("${sample_id}.bam"), path("${sample_id}.bam.bai")

    script:
    def readGroup = "@RG\\tID:$sample_id\\tSM:$sample_id\\tPL:ILLUMINA"
    
    """
    bwa mem -t ${params.max_threads} -M -R '$readGroup' ${params.reference} ${paired_reads} > ${sample_id}.sam
    samtools sort < ${sample_id}.sam > ${sample_id}.bam
    samtools index ${sample_id}.bam

    """
}
