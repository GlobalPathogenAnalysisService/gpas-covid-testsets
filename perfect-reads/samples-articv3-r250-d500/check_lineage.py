#! /usr/bin/env python

import glob, pathlib

for i in glob.glob('*.csv'):

    pango_file=pathlib.Path(i)

    INPUT=open(pango_file,'r')
    INPUT.readline()
    line=INPUT.readline()
    results=line.split(',')
    inferred_lineage=results[0]
    expected_lineage=pango_file.stem

    if inferred_lineage==expected_lineage:
        print(expected_lineage+" PASSED")
    else:
        print(expected_lineage,inferred_lineage,results[1],results[2])
