#!/usr/bin/env python

import urllib2

sfPrefix = 'http://sanfrancisco'
oakPrefix = 'http://oakland'

rootSuffix = '.crimespotting.org/crime-data?'

class CrimeSpottingApi:

    def __init__(self, city="sf"):
        if city == "sf":
            self.root = sfPrefix + rootSuffix
        elif city == "oak"
            self.root = oakPrefix + rootSuffix

    def getCsv(**kwargs):
        query = self.root

        params = ['format=csv']
        for key, val in kwargs.iteritems():
            params.append(str(key) + '=' + str(val))

        query = query + '&'.join(params)

        getRequest = urllib2.urlopen(query)
        rawData = getRequest.read()
        getRequest.close()

        output = rawData.strip().split('\n')
        return output
