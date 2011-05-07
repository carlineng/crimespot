#!/usr/bin/env R

setwd('/Volumes/hobo/githobo/crimespot/src')

sfPrefix = 'http://sanfrancisco'
oakPrefix = 'http://oakland'

rootSuffix = '.crimespotting.org/crime-data?'


getCsv <- function(...) {
    query = paste(sfPrefix, rootSuffix, "format=csv", sep="")
    paramList = character()

    argList = list(...)
    argNames = names(argList)

    numArgs = length(argList)
    
    for(i in c(1:numArgs)) {
        argVal = argList[[i]]
        argName = argNames[i]
        arg = paste(argName, argVal, sep="=")
        print(arg)
        paramList = paste(paramList, arg, sep="&")
    }
    
    query = paste(query, paramList, sep="")
    print(query)
    result = read.csv(query)
    return(result)
}

getCrimeOnDate <- function(dait, ...) {
    dateTimeStart = paste(dait, 'T00:00:00-0700', sep="")
    dateTimeEnd = paste(dait, 'T23:59:59-0700', sep="")
    return(getCsv(dtstart=dateTimeStart, dtend=dateTimeEnd, ...))
}

