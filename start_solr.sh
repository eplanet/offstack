#!/bin/bash

[ ! -d data ] && mkdir data

mvn install jetty:run
