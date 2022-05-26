#!/usr/bin/env bash

root=https://n5eil01u.ecs.nsidc.org/MEASURES/NSIDC-0642.001/2000.09.30
file=GlacierIDs_v01.2
for ext in cpg dbf prj sbn sbx shp shx xml; do
  datalad download-url ${root}/${file}.${ext}
done

