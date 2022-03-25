#!/bin/bash
echo "Run docker image"
sudo docker run --name dotnet-spark-interactive -d -v $PWD:/home/jovyan/Docker -v $PWD/../Notebooks:/home/jovyan/dotnet.spark/Notebooks -p 8888:8888 3rdman/dotnet-spark:interactive-latest
echo "Fix docker image"
sudo docker exec -u root -ti dotnet-spark-interactive /home/jovyan/Docker/container_interactive_fix.sh
echo Wait for run jupyter logs 15s
sleep 15
echo "Get jupyter logs"
sudo docker logs dotnet-spark-interactive

