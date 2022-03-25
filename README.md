# DotnetForApacheSparkFSharpExamples
.NET For Apache Spark F# Examples

Go to the Docker directory
```bash
cd Docker
```
There are scripts to run in the Docker directory.
First, set the run permissions for everyone with the .sh extension in the Docker directory
```bash
chmod +x *.sh
```

Next
```bash
run_docker_app.sh 
```
This script compiles sources in #F and runs them on a Docker image. The result is available in the same directory.

```bash
run_docker_interactive.sh
```
This script runs an interactive image for .NET for Apache Spark. It also returns a link to login to Jupyter Labs.
Next you must run notebook ***01-start-spark-debug.ipynb*** and our notebook ***Streets.ipynb***

