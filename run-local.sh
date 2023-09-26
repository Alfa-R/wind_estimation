#!/bin/bash
# We are overriding the entrypoint here, so we can use the docker image for testing and in the c2d environment at the same time
docker run -v "$(pwd)"/data:/data --entrypoint Rscript  wind-estimation:main estimate_wind.R /data/inputs/dataset/HKNB.csv

# To run it in C2D, where $ALGO will be replaced with the link from the algorithm file (estimate_wind.R) and $INPUT with the dataset file
#Rscript $ALGO /data/inputs/<id_of_dataset>/0
