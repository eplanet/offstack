#!/bin/bash

PY_VENV=osvenv
[ ! -d $PY_VENV ] && virtualenv $PY_VENV
source $PY_VENV/bin/activate
# TODO: Fix cherrypy wsgiserver dependency
pip install -r requirements.txt
python ./src/python/server.py
