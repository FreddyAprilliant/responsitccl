#!/bin/sh

# /opt/data is mounted in docker-compose.yml
cd /opt/data
make clean
make html
cd /opt/data/output
python -m pelican.server 4000
