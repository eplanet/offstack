#!/bin/bash

[ ! -d data ] && mkdir data

env "PYTHONPATH=src/python" python ./src/python/server.py
