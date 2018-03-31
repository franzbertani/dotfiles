#!/bin/bash

for file in $(pwd)/.* ; do
    if [ ! -d "$file" ]
        then ln -sf "$file" "${HOME}"
    fi
done
