#!/bin/sh
rm *.csv
cd ../Microsoft.Spark.FSharp.Example
echo "Build"
dotnet build
echo "Start docker"
sudo docker run --network host -d --name dotnet-spark -v $PWD/Microsoft.Spark.FSharp.Example.StreetCounter/bin/Debug:/dotnet/Debug 3rdman/dotnet-spark:latest
echo "Wait 10s to run docker"
sleep 10
echo "Run .NET for Apache Spark app"
dotnet run --project Microsoft.Spark.FSharp.Example.StreetCounter
echo 
echo Copy result
cd "$PWD/Microsoft.Spark.FSharp.Example.StreetCounter/bin/Debug/netcoreapp3.1/result/" 
cp *.csv ../../../../../../Docker
echo Clean docker
sudo docker rm -f dotnet-spark
echo Clean result
cd ..
sudo rm -rf result
echo Finished