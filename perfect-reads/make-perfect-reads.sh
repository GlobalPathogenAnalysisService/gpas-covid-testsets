#! /bin/bash

for scheme_name in artic; do

    mkdir $scheme_name

    for scheme_version in v3; do

        mkdir $scheme_name/$scheme_version

        for tech in illumina nanopore; do

            mkdir $scheme_name/$scheme_version/$tech

            for read_length in 250;  do

                mkdir $scheme_name/$scheme_version/$tech/read_length_$read_length/

                for read_depth in 100 250 500 1000; do

                    mkdir $scheme_name/$scheme_version/$tech/read_length_$read_length/read_depth_$read_depth/

                    for error_rate in 0; do

                        mkdir $scheme_name/$scheme_version/$tech/read_length_$read_length/read_depth_$read_depth/error_rate_$error_rate


                        for lineage in Alpha Beta Delta Eta Gamma Kappa Lambda Omicron Theta Zeta; do

                            echo $lineage

                            gpas-covid-perfect-reads.py --variant_definitions ../../variant_definitions/\
                                        --variant_name $lineage\
                                        --reference ../../gpas-covid-perfect-reads/config/MN908947.3.gbk\
                                        --primer_definition ../../gpas-covid-perfect-reads/config/covid-artic-v3.json\
                                        --read_length $read_length\
                                        --depth $read_depth\
                                        --tech $tech\
                                        --error_rate $error_rate\
                                        --output $scheme_name/$scheme_version/$tech/read_length_$read_length/read_depth_$read_depth/error_rate_$error_rate/$lineage &
                        done;

                        gpas-covid-perfect-reads.py --variant_definitions ../../variant_definitions/\
                                        --output Reference\
                                        --reference ../../gpas-covid-perfect-reads/config/MN908947.3.gbk\
                                        --primer_definition ../..//gpas-covid-perfect-reads/config/covid-artic-v3.json\
                                        --depth $read_depth\
                                        --read_length $read_length\
                                        --tech $tech\
                                        --error_rate $error_rate\
                                        --output $scheme_name/$scheme_version/$tech/read_length_$read_length/read_depth_$read_depth/error_rate_$error_rate/Reference


                    done;
                done;
            done;
        done;
    done;
done;
#
#
#
# for read_length in 250; do
#
#     for depth in 250 1000 2000; do
#
# 	mkdir samples-articv3-r$read_length-d$depth/
#
# 	echo "Reference"
# #
# 	gpas-covid-perfect-reads.py --variant_definitions ../../variant_definitions/\
# 				    --output Reference\
# 				    --reference ../../gpas-covid-perfect-reads/config/MN908947.3.gbk\
# 				    --primer_definition ../..//gpas-covid-perfect-reads/config/covid-artic-v3.json\
# 				    --depth $depth\
# 				    --read_length $read_length\
# 				    --output samples-articv3-r$read_length-d$depth/Reference
#
# 	for lineage in Alpha Beta Delta Eta Gamma Kappa Lambda Omicron Theta Zeta; do
#
# 	    echo $lineage
#
# 	    gpas-covid-perfect-reads.py --variant_definitions ../../variant_definitions/\
# 					--variant_name $lineage\
# 					--reference ../../gpas-covid-perfect-reads/config/MN908947.3.gbk\
# 					--primer_definition ../../gpas-covid-perfect-reads/config/covid-artic-v3.json\
# 					--read_length $read_length\
# 					--depth $depth\
# 					--output samples-articv3-r$read_length-d$depth/$lineage
# #
# # 	done;
# #
# #     done;
# #
# # done;
