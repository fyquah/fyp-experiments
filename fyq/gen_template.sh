#!/bin/bash

set -euo pipefail

cd $(dirname $0)
mkdir $1

cp TEMPLATE/Makefile $1/
cp TEMPLATE/main.ml $1/
cp TEMPLATE/print.c $1/
