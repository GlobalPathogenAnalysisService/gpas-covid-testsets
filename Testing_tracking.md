# GPAS Testing and Validation Tracking Document

**This document will hold up to date information on what files have been used to test and validate GPAS/Viridian during the early testing phase**
    
   The aim will be to clearly show what files/samples have been processed, when they were run and what versions were used. There will also be clear locations for output files such as fasta/json/tsv. 

## Truth Sets
The Truth sets collated by Bede and Phil (fastqs) are available at ANALYSIS1:/home/ndm.local/bede/covid/truth/fastq_dehosted/truth/fastq_dehosted

The Core set is available in tar.gz format at: ANALYSIS1:/home/ndm.local/ollyb/Truth_subsets/core_truth_fastqs.tar.gz

The 2 subsets are available in a tar.gz format at: ANALYSIS1:/home/ndm.local/ollyb/Truth_subsets/Truth_sets_MMM.tar.gz

Further information on these sets and how they are derived is available at https://github.com/GenomePathogenAnalysisService/gpas-covid-testsets/blob/main/mmm-2x2-truth/notebook.ipynb

## **Truth Set Testing**

### **Core Truth Set:** *12 samples sequenced with high coverage ARTIC-ONT, ARTIC-Illumina, SISPA-ONT and SISPA-Illumina*

Has been run through COG, Medaka and GPAS-Viridian

- **Date Run:** 28/9/2021 by Bede
- **Output File Locations:** Analysis1:home/ndm.local/ollyb/GPAS_Testing/Core_Truth_Outputs/2x2*
- **Pangolin Version:** 3.1.7

### **Subset 1:** *Lineage calling of ARTIC v3 matched samples between sequencing platforms*

- 25 ARTIC samples with matched ONT + Illumina 

Subset 1 has been run through following pipelines:

#### Illumina - *Viridian/GPAS*
- **Date Run:** 27/9/2021 by Bede
- **Output File Location:** Analysis1:home/ndm.local/ollyb/GPAS_Testing/Truth_subset_outputs/subset_1_Illumina_viridian

#### Illumina - *COG*
- **Date Run:** 27/9/2021 by Bede
- **Output File Location:** Analysis1:home/ndm.local/ollyb/GPAS_Testing/Truth_subset_outputs/subset_1_Illumina_cog

#### ONT - *Medaka*
- **Date Run:** 27/9/2021 by Bede
- **Output File Location:** Analysis1:home/ndm.local/ollyb/GPAS_Testing/Truth_subset_outputs/subset_1_Illumina_cog


### **Subset 2:** *Reproducibility of within-platform ARTIC v3 replicates*

- 10 samples x 2 replicates (ONT)
- 11 samples x 2 replicates (Illumina)

#### Illumina - *Viridian/GPAS*
- **Date Run:** 27/9/2021 by Bede
- **Output File Location:** Analysis1:home/ndm.local/ollyb/GPAS_Testing/Truth_subset_outputs/subset_2_Illumina_viridian

#### Illumina - *COG*
- **Date Run:** 27/9/2021 by Bede
- **Output File Location:** Analysis1:home/ndm.local/ollyb/GPAS_Testing/Truth_subset_outputs/subset_2_Illumina_cog

#### ONT - *Medaka*
- **Date Run** 27/9/2021 by Bede
- **Output File Location:** Analysis1:home/ndm.local/ollyb/GPAS_Testing/Truth_subset_outputs/subset_2_Nanopore_medaka


### External Runs


#### Illumina - Signal/freebayes (**TORONTO**)
- **Date Run** 11/7/2021 by Fin Maguire
- **Output File Location:** 
   -  Analysis1:/home/ndm.local/ollyb/GPAS_Testing/Truth_subset_outputs/Toronto_subset_1_Ill
   -  Analysis1:/home/ndm.local/ollyb/GPAS_Testing/Truth_subset_outputs/Toronto_subset_2_Ill
---
### **Toronto**
#### *Set 1*
- **User:** Early Test Usage
- **Samples:** Previously analysed files uploaded to SRA by Finlay Maguire in Toronto.
- **Pipelines:** Viridian + SIGNAL/freebayes
- **CATSUP RUN UUID:** 0da38206-c713-4b57-b1f1-eaf503a20a0d
- **Output File Location:** Analysis1:home/ndm.local/ollyb/GPAS_Testing/Toronto_set1
- **GPAS Run Date** 9/7/2021
- **Pangolin Version:** 3.0.6
