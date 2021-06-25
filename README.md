## SARS-CoV testsets derived from all publicly available COG-UK sequences

We need a range of testsets covering size, diversity and difficulty. The two main sources are 
* the small set of samples sequenced by Oxford using both Oxford Nanopore and Illumina and ARTIC and SISPA protocols. (only ARTIC is supported at present in GPAS)
* all the publicly available samples deposited by COGUK in the ENA

The COG-UK metadata can be downloaded via

```
wget https://cog-uk.s3.climb.ac.uk/phylogenetics/latest/cog_metadata.csv
```

but this does not include the ENA accession number. To find that you need to interrogate the EBI (and we can also pick up the `instrument_platform,base_count` at the same time:

```
curl "https://www.ebi.ac.uk/ena/portal/api/filereport?accession=PRJEB37886&result=read_run&fields=study_accession,sample_accession,secondary_sample_accession,experiment_accession,run_accession,instrument_platform,country,submitted_ftp,read_count,base_count&limit=1000000&format=tsv&download=true" > cog-ena-20210624.tsv
```

Hence all of these data are public and are then processed and merged via the jupyter-notebook `create-coguk-dataset/create-cog-testset.ipynb` which creates a CSV file, `create-coguk-dataset/cog_dataset-20210624.csv.gz`.

### Samples for the demo - 18 March 2021 (COGUK)

All samples from 18 March 2021, which was the first day that the B.1.617.2 / Delta variant was detected in the UK (in two Illumina samples). In total there were 2,107 samples, 2,013 Illumina and 94 Oxford Nanopore. The datasets for each are called e.g. `demo-18March2021-dataset/cog-testset-18March2021-2013samples-illumina.csv.gz`

50 Illumina and 50 Nanopore samples were then randomly selected from each group but making sure that
* the two Delta variants are included in the Illumina set
* only samples with moderate numbers of `base_counts` were included to try and speed up the processing

The files that start with `sp3-` are formated for SP3 i.e. are `bucket_name,unique_identifier` so that the FASTQ files can be retrieved from object store. e.g.

```
demo_samples,ERR5874574
demo_samples,ERR5874678
demo_samples,ERR5875498
```

### Genetically diverse testset (COGUK)

To efficiently test the pipelines, we need a compact testset that contains as much genetic (and hence lineage) diversity as possible. An intial logic that does this is found in `genetically-diverse-dataset/create-testset-genetically-diverse.ipynb`.

In brief, the logic is 

1. for a given lineage, randomly pick 10 samples (with replacement to deal with cases where there are fewer than 10 samples in that lineage)
2. for each, make a set out of its mutations ($A_i$)
3. for the samples stored to date, make a single set of all their collective mutations ($B$)
4. by considering $B-A_i$ in turn, choose the sample which has the most mutations not already in $B$
5. add to to the testset and repeat

The intention is that such a genetically diverse dataset could then be used as a development end-to-end test.

