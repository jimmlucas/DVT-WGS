process ADDORREPLACE {
    tag "Add or Replcae $sample_id "
    publishDir "${params.outdir}/out/5-ReplaceGroups", mode: 'copy'

    input:
    tuple val(sample_id), path(replace)

    output:
    tuple val(sample_id), path("${sample_id}.RG.bam")

    script:
    """
    picard AddOrReplaceReadGroups \
    INPUT=${replace} \
    OUTPUT=${sample_id}.RG.bam \
    RGID=${sample_id} \
    RGLB=lib1 \
    RGPL=ILLUMINA \
    RGPU=unit1 \
    RGSM=${sample_id} \
    CREATE_INDEX=True
    """
}