#!/usr/bin/env bash
set -x
set -e
set -o pipefail

# Test that the `isolate` command is available
if ! command -v isolate &> /dev/null
then
    echo "isolate could not be found"
    exit 1
fi

# Test sandbox initialization
sandbox_dir=$(isolate --init)

# Test that a program using too much memory is killed
gcc -o /tmp/oom-heap tests/oom-heap.c
isolate --init -b 0
isolate --run -b 0 --cg --cg-mem 1000000 /tmp/oom-heap
