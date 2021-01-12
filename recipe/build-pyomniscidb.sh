#!/bin/sh

set -e
set -x

cd python

$PYTHON setup.py \
        build_ext \
        install --single-version-externally-managed \
                --record=record.txt
