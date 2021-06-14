# SARS-CoV COG-UK sequences collected on 18 March 2021

All samples collected on 18 March 2021 that were subsequently sequenced by COGUK

The COG-UK metadata can be downloaded via

```
wget https://cog-uk.s3.climb.ac.uk/phylogenetics/latest/cog_metadata.csv
```

but this does not include the ENA accession number. To find that you need to interrogate the EBI:

```
curl "https://www.ebi.ac.uk/ena/portal/api/filereport?accession=PRJEB37886&result=read_run&fields=study_accession,sample_accession,secondary_sample_accession,experiment_accession,run_accession,fastq_ftp&limit=500000&format=tsv&download=true"
```

These are then processed are merged via the jupyter-notebook `create-coguk-18mar21-dataset.ipynb` which creates a CSV file, `coguk-18mar21-dataset.csv`.

All the fastq files have been downloaded and put in the OCI object store in a bucket called `demo_samples`. To create the CSV files use the  jupyter-notebook `coguk-18mar21-dataset.ipynb`.

A CSV looks like and then needs to be uploaded to the SP3 headnode and named so it can be referenced using an absolute path.

```
demo_samples,ERR5874574
demo_samples,ERR5874678
demo_samples,ERR5875498
demo_samples,ERR5938867
demo_samples,ERR5941266
demo_samples,ERR5938720
demo_samples,ERR5939797
demo_samples,ERR5940663
demo_samples,ERR5940664
demo_samples,ERR5942732
demo_samples,ERR5939417
demo_samples,ERR5938098
demo_samples,ERR5936670
```
