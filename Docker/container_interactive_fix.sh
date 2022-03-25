#!/bin/bash
echo Start fix
echo Fix nuget.config
cp -f /home/jovyan/Docker/nuget.config /home/jovyan/nuget.config
echo Copy Notebooks
cp /home/jovyan/dotnet.spark/Notebooks/* /home/jovyan/dotnet.spark/examples
echo Finished fix