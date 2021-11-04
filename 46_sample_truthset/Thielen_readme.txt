# README

**Citation:**
"Genomic diversity of SARS-CoV-2 during early introduction into the
Baltimore–Washington metropolitan area", Thielen et al 2021.
https://doi.org/10.1172/jci.insight.144350

## Data

* This tarball contains the sequencing data from Thielen et al 2021.
It has the Illumina and ONT reads from samples that were sequenced on
both technologies.

* There is a JSON file that contains ENA metadata and supplementary data from
the publication: `thielen_data.json`.

* The file `reads.md5.txt` has the MD5 sums of all FASTQ files.

* There is a directory for each sample, containing the Illumina reads
  `reads.ilm_1.fastq.gz`, `reads.ilm_2.fastq.gz` and the ONT reads
  `reads.ont.covfiltered.fq.gz`.


## Sample names

We have used names of the form `MDHP-*` for the samples. This is the
`name` column used in the supplementary data for the paper.
Note that there are also strain names, but are of the form
eg `hCoV-19/USA/DC-HP00026/2020`, which is not filesystem-friendly, hence
we use the `name` column instead.


## Notes on downloading the data

The reads are in the ENA, in the study PRJNA650037.
We only want reads from the 31 samples that have both Illumina and ONT
sequencing. Note, we excluded MDHP-00057 because the Illumina sequencing
was deemed to
be too low quality, after manual inspection of the read mapping.
Therefore the total number of samples is 30.

The supplementary data files from the paper do not list ENA sample or run
IDs. The supplementary data and the ENA data were matched as follows.
First download a JSON of the ENA project from the ENA:

```
wget -O ena_metadata.PRJNA650037.json 'https://www.ebi.ac.uk/ena/portal/api/filereport?accession=PRJNA650037&result=read_run&fields=study_accession,sample_accession,secondary_sample_accession,experiment_accession,run_accession,scientific_name,instrument_platform,instrument_model,nominal_length,library_layout,read_count,base_count,run_alias,fastq_ftp,sample_alias,sample_title&format=json&download=true'
```

Download the TSV of supplementary data from github:

```
wget https://raw.githubusercontent.com/timplab/jhu-covid-pipeline/master/data/sequencing_metrics.csv
```

The ENA `sample_alias` field is the same as the `strain` column from the
supplementary data. Use this to match the two files up.
Get the samples that have both ONT and Illumina sequencing by taking
those where the `illumina` column in the supplementary file is `yes`.
This is 31 samples.

This was scripted, making a JSON file included in this tarball, called
`thielen_data.json`. It is a dictionary where the keys are the
ENA `sample_alias`/supplementary `strain` names.
Each value has dictionaries of the ENA and supplementary data.

