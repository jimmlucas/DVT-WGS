process MARKDUPLICATE {
    tag "Piccar MarkDuplicate $sample_id"
    
    publishDir "${params.out}/out/4-MarkDuplicate", mode: 'copy'

    input:
    tuple val(sample_id), path("${sample_id}.bam")
    path(params.reference)
    
    output:
    tuple val(sample_id), path("${sample_id}.dedup.bam"), path("${sample_id}.dedup.metrics.txt")
    
    script:
    """
    picard \\
        -Xmx${avail_mem}M \\
        MarkDuplicates \\
        --INPUT ${sample_id}.bam \\
        --OUTPUT ${sample_id}.dedup.bam \\
        --REFERENCE_SEQUENCE ${params.reference}\\
        --METRICS_FILE ${sample_id}.dedup.metrics.txt \\
        --ASSUME_SORTED= True
    """
}