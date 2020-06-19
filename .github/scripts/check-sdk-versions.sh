#!/bin/bash

SDK_LIST=('javascript' 'swift' 'python')

for SDK in "${SDK_LIST[@]}"
do
    SDK_VERSION=(`curl -s https://raw.githubusercontent.com/pubnub/$SDK/master/.pubnub.yml | grep ^version | cut -s -d : -f 2 | sed 's/"//g'`)
    echo $SDK version is $SDK_VERSION
done
