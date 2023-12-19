#!/bin/bash

count=$(cat $1 | wc -l)

echo "The $1 have $count lines"
