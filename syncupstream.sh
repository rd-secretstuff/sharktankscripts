#!/bin/bash

./dogit.sh fetch upstream
./dogit.sh checkout master
./dogit.sh merge upstream/master

