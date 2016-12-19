#!/bin/bash

script="$0"
FOLDER="$(pwd)/$(dirname $script)"

source $FOLDER/utils.sh
PROJECT_ROOT="$(abspath $FOLDER/..)"
echo "project root folder $PROJECT_ROOT"

echo "build docker image"
/bin/bash $FOLDER/build.sh

##### VOLUMES #####

# folder containing notebooks
NOTEBOOKS_DIR=$PROJECT_ROOT/notebooks
echo "Using notebooks in $NOTEBOOKS_DIR"

# folder containing data
DATA_DIR=$PROJECT_ROOT/data
echo "Using data in $DATA_DIR"

##### RUN #####
echo "Staring container..."

docker run -it \
           --rm \
           --name traffic_light_example \
           -p 8888:8888 \
           -v $DATA_DIR:/data \
           -v $NOTEBOOKS_DIR:/notebooks \
           dominicbreuker/traffic_light_example:latest
