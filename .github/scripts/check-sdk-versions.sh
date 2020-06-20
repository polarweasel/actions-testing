#!/bin/bash

SDK_LIST=('javascript' 'swift' 'foobarxyz' 'python')

ERROR_FLAG=false

for SDK in "${SDK_LIST[@]}"
do
    SDK_VERSION=$(curl -s -f https://raw.githubusercontent.com/pubnub/$SDK/master/.pubnub.yml | grep ^version | cut -s -d : -f 2 | sed 's/"//g')

    if [ "$SDK_VERSION" == '' ]; then
        echo $SDK: ERROR
        ERROR_FLAG=true
    else
        echo $SDK: $SDK_VERSION
    fi
done

if [ "$ERROR_FLAG" = true ]; then
    exit 1
fi
