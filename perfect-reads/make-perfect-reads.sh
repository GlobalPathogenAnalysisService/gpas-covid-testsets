#! /bin/bash

for i in Alpha Beta Delta Eta Gamma Kappa Lambda Omicron Theta Zeta; do

    echo $i

    gpas-covid-perfect-reads.py --variant_definitions ../../variant_definitions/\
                                --variant_name $i\
                                --reference ../../gpas-covid-perfect-reads/config/MN908947.3.gbk\
                                --primer_definition ../../gpas-covid-perfect-reads/config/covid-artic-v3.json\
                                --output samples-articv3-r250-d500/$i

done;
