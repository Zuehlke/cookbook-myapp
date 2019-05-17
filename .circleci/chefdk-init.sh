#!/bin/bash

if [ -x "$(command -v chef)" ]; then
    eval "$(chef shell-init bash)"
fi
