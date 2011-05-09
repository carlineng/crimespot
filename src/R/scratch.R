#!/usr/bin/env R
setwd('/Volumes/hobo/githobo/crimespot/src/R')
source('CrimeSpottingApi.R')

startYear = 2009
startDate = as.Date(paste(startYear, "-01-01", sep=""))

crime.2009 = data.frame();
numDays = 365
for(i in c(0:(numDays - 1))) {
    print(paste("day", i))
    dait = as.Date(i, origin = startDate)
    crime.2009 = rbind(crime.2009, getCrimeOnDate(dait, count=10000))
}

startYear = 2010
startDate = as.Date(paste(startYear, "-01-01", sep=""))

crime.2010 = data.frame();
numDays = 365
for(i in c(0:(numDays - 1))) {
    print(paste("day", i))
    dait = as.Date(i, origin = startDate)
    crime.2010 = rbind(crime.2010, getCrimeOnDate(dait, count=10000))
}

startYear = 2011
startDate = as.Date(paste(startYear, "-01-01", sep=""))

crime.2011 = data.frame();
numDays = 365
for(i in c(0:(numDays - 1))) {
    print(paste("day", i))
    dait = as.Date(i, origin = startDate)
    crime.2011 = rbind(crime.2011, getCrimeOnDate(dait, count=10000))
}

crime <- rbind(crime.2009, crime.2010, crime.2011)

write.csv(crime, file='../../data/crime_sf.csv')

p <- ggplot(crime, aes(x = Longitude, y = Latitude))
p + facet_grid(. ~ Crime.Type) + geom_point(alpha = I(1/50))

p + facet_wrap(~ Crime.Type, ncol=4) + geom_point(alpha = I(1/50))

