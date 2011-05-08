#!/usr/bin/env R
setwd('/Volumes/hobo/githobo/crimespot/src/R')
source('CrimeSpottingApi.R')

startYear = 2010
startDate = as.Date(paste(startYear, "-01-01", sep=""))

crime.2010 = data.frame();
numDays = 365
for(i in c(0:(numDays - 1))) {
    print(paste("day", i))
    dait = as.Date(i, origin = startDate)
    crime.2010 = rbind(crime.2010, getCrimeOnDate(dait, count=10000))
}

write.csv(crime.2010, file='../../data/crime_sf_2010.csv')

