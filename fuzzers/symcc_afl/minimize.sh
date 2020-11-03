#!/bin/bash

##
# Pre-requirements:
# - env FUZZER: path to fuzzer work dir
# - env TARGET: path to target work dir
# - env PROGRAM: name of program to run (should be found in $OUT)
# - env ARGS: extra arguments to pass to the program
# - env OUT: path to directory where artifacts are stored
# - env CORPUS_IN: path to directory shared with host (original corpus)
# - env CORPUS_OUT: path to directory where minimized corpus is stored
##

export AFL_PATH="$FUZZER"
"$FUZZER/repo/afl-cmin" -m 100M -i "$CORPUS_IN" -o "$CORPUS_OUT" \
    -- "$OUT/$PROGRAM" $ARGS 2>&1
