#!/bin/bash

rm -f work/build.make*
./build.sh -v
./pxeupdate.sh
