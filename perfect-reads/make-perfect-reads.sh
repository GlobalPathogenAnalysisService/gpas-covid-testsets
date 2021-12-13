#! /bin/bash

for read_length in 250; do

    for depth in 250 1000 2000; do

	mkdir samples-articv3-r$read_length-d$depth/
	
	echo "Reference"
	
	gpas-covid-perfect-reads.py --variant_definitions ../../variant_definitions/\
				    --output Reference\
				    --reference ../../gpas-covid-perfect-reads/config/MN908947.3.gbk\
				    --primer_definition ../..//gpas-covid-perfect-reads/config/covid-artic-v3.json\
				    --depth $depth\
				    --read_length $read_length\
				    --output samples-articv3-r$read_length-d$depth/Reference
	
	for lineage in Alpha Beta Delta Eta Gamma Kappa Lambda Omicron Theta Zeta; do

	    echo $lineage

	    gpas-covid-perfect-reads.py --variant_definitions ../../variant_definitions/\
					--variant_name $lineage\
					--reference ../../gpas-covid-perfect-reads/config/MN908947.3.gbk\
					--primer_definition ../../gpas-covid-perfect-reads/config/covid-artic-v3.json\
					--read_length $read_length\
					--depth $depth\
					--output samples-articv3-r$read_length-d$depth/$lineage

	done;

    done;

done;
