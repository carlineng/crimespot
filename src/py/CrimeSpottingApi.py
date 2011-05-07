#!/usr/bin/env python

import urllib2

sfPrefix = 'http://sanfrancisco'
oakPrefix = 'http://oakland'

rootSuffix = '.crimespotting.org/crime-data?'

class CrimeSpottingApi:

    def __init__(self, city="sf"):
        self.setCity(city)

    def setCity(self, city):
        if city == "sf":
            self.root = sfPrefix + rootSuffix
        elif city == "oak":
            self.root = oakPrefix + rootSuffix
        else:
            print "Did not recognize city: " + str(city)

    def help(self, param=None):
        if param is None:
            print ("Possible arguments are: type, dstart, dend, dstart, dtend, bbox, count, offset.\n\nCall help(<arg>) for more information on a specific argument")

        if param == "type":
            print ("Crime types to get, in a comma separated list.\nValid options are: aggravated_assault, murder, robbery, simple_assault, arson, burglary, theft, vandalism, vehicle_theft, alcohol, disturbing_the_peace, narcotics, prostitution\nShort versions are also acceptable: AA, Mu, Ro, SA, Ar, Bu, Th, Va, VT, Al, DP, Na, Pr.\nNote that these are case-sensitive")

        if param == "dstart":
            pass

        if param == "dend":
            pass

        if param == "dtstart":
            pass

        if param == "dtend":
            pass

        if param == "bbox":
            pass
        
        if param == "count":
            pass

        if param == "offset":
            pass


    def getCsv(self, **kwargs):
        query = self.root

        params = ['format=csv']
        for key, val in kwargs.iteritems():
            params.append(str(key) + '=' + str(val))

        query = query + '&'.join(params)
        rawData = self.makeRequest(query)

        output = rawData.strip().split('\n')
        return output

    def getCrimeOnDate(self, date, **kwargs):
        query = self.root
        dateTimeStart = 'dtstart=' + date + 'T00:00:00-0700'
        dateTimeEnd = 'dtend=' + date + 'T23:59:59-0700'
        params = ['format=csv',dateTimeStart, dateTimeEnd]

        for key, val in kwargs.iteritems():
            params.append(str(key) + '=' + str(val))

        query = query + '&'.join(params)
        rawData = self.makeRequest(query)

        output = rawData.strip().split('\n')
        return output

    def makeRequest(self, query):
        getRequest = urllib2.urlopen(query)
        rawData = getRequest.read()
        getRequest.close()
        return rawData
