#!/bin/bash

for i in {1..9};
do
    wget "https://github.com/CSSLab/maia-chess/raw/master/maia_weights/maia-1${i}00.pb.gz"
done
