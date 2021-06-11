#!/usr/bin/env nextflow

/*
========================================================================================
    nf-core/sarek
========================================================================================
    Started March 2016.
    Ported to nf-core May 2019.
    Ported to DSL 2 July 2020.
----------------------------------------------------------------------------------------
    nf-core/sarek:
        An open-source analysis pipeline to detect germline or somatic variants
        from whole genome or targeted sequencing
----------------------------------------------------------------------------------------
    @Homepage
    https://nf-co.re/sarek
----------------------------------------------------------------------------------------
    @Documentation
    https://nf-co.re/sarek/usage
----------------------------------------------------------------------------------------
    @Github
    https://github.com/nf-core/sarek
----------------------------------------------------------------------------------------
    @Slack
    https://nfcore.slack.com/channels/sarek
----------------------------------------------------------------------------------------
*/

nextflow.enable.dsl = 2

/*
========================================================================================
    GENOME PARAMETER VALUES
========================================================================================
*/

params.ac_loci                 = WorkflowMain.getGenomeAttribute(params, 'ac_loci')
params.ac_loci_gc              = WorkflowMain.getGenomeAttribute(params, 'ac_loci_gc')
params.bwa                     = WorkflowMain.getGenomeAttribute(params, 'bwa')
params.chr_dir                 = WorkflowMain.getGenomeAttribute(params, 'chr_dir')
params.chr_length              = WorkflowMain.getGenomeAttribute(params, 'chr_length')
params.dbsnp                   = WorkflowMain.getGenomeAttribute(params, 'dbsnp')
params.dbsnp_index             = WorkflowMain.getGenomeAttribute(params, 'dbsnp_index')
params.dict                    = WorkflowMain.getGenomeAttribute(params, 'dict')
params.fasta                   = WorkflowMain.getGenomeAttribute(params, 'fasta')
params.fasta_fai               = WorkflowMain.getGenomeAttribute(params, 'fasta_fai')
params.germline_resource       = WorkflowMain.getGenomeAttribute(params, 'germline_resource')
params.germline_resource_index = WorkflowMain.getGenomeAttribute(params, 'germline_resource_index')
params.intervals               = WorkflowMain.getGenomeAttribute(params, 'intervals')
params.known_indels            = WorkflowMain.getGenomeAttribute(params, 'known_indels')
params.known_indels_index      = WorkflowMain.getGenomeAttribute(params, 'known_indels_index')
params.mappability             = WorkflowMain.getGenomeAttribute(params, 'mappability')
params.snpeff_db               = WorkflowMain.getGenomeAttribute(params, 'snpeff_db')
params.species                 = WorkflowMain.getGenomeAttribute(params, 'species')
params.vep_cache_version       = WorkflowMain.getGenomeAttribute(params, 'vep_cache_version')


/*
========================================================================================
    VALIDATE & PRINT PARAMETER SUMMARY
========================================================================================
*/

WorkflowMain.initialise(workflow, params, log)


/*
========================================================================================
    NAMED WORKFLOW FOR PIPELINE
========================================================================================
*/

workflow NFCORE_SAREK {
    include { SAREK } from './workflows/sarek'
    SAREK ()
}

/*
========================================================================================
    RUN ALL WORKFLOWS
========================================================================================
*/

// WORKFLOW: Execute a single named workflow for the pipeline
workflow {
    NFCORE_SAREK ()
}