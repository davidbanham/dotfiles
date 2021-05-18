#!/bin/bash
cd /home/davidbanham/go/src/clubman
rm -r data_dumps/*
source ./.envrc && make prod_backup
