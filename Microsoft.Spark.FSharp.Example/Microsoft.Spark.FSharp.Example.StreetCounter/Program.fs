// Learn more about F# at http://fsharp.org

open System
open Microsoft.Spark.Sql

[<EntryPoint>]
let main argv =
    printf "Start SparkSession"
    let sparkSession = SparkSession.Builder().AppName("Street Counter F#").GetOrCreate()
    let dfCsv =   sparkSession
                    .Read()
                    .Option("delimiter", ";")
                    .Schema("WOJ string ,POW string ,GMI string ,RODZ_GMI string , " +
                            "SYM string , SYM_UL string , " +
                            "CECHA string , NAZWA_1 string ,NAZWA_2 string , " +
                            "STAN_NA string")
                    .Csv("streets.csv")
    let dataIn = dfCsv
                  .WithColumn("STREET", Functions.ConcatWs(" ", dfCsv.["CECHA"], dfCsv.["NAZWA_1"], dfCsv.["NAZWA_2"]))
    let dataGroup = dataIn
                        .Select("STREET")
                        .GroupBy("STREET")
                        .Count()
                        .WithColumnRenamed("count","COUNT")
    let dataOut = dataGroup
                    .OrderBy(dataGroup.["COUNT"]
                    .Desc()
                     )
    dataOut
                .Coalesce(1)
                .Write()
                .Option("delimiter",";")
                .Csv("result");
    sparkSession.Stop()
    printf "Stop SparkSession"
    0 // return an integer exit code
