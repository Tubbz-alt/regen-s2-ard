#!/bin/bash

# docker pull s2-ard / docker build -t s2-ard .

docker run --name s2-ard -dit s2-ard

if [ -z "$2" ]
then
      echo "no config.yml file copied"
else
      echo "config.yml file copied"
      docker cp $2 s2-ard:app
fi

if [ -z "$3" ]
then
      echo "no aoi.geojson file copied"
else
      echo "aoi.geojson file copied"
      docker cp $3 s2-ard:app
fi

docker exec -it s2-ard bash -c "python /app/ard.py --tile "$1""
