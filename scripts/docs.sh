#!/bin/bash
set -eux

ROOT_DIR=`echo ${PWD}`
DOCS_DIR=$ROOT_DIR/docs

DIR=`echo $1 | awk -F 'docs.py' '{print $1}'`
TARGET=`echo $1 | awk -F '/' '{print $(NF-2) "-docs.json"}'`
cd $DIR
poetry install
poetry run python docs.py
mv $TARGET $DOCS_DIR
cd $ROOT_DIR