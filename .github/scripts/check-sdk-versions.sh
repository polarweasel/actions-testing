#!/bin/bash

SDK_LIST=('javascript' 'swift' 'foobarxyz' 'python')

ERROR_FLAG=0

for SDK in "${SDK_LIST[@]}"
do
    SDK_VERSION=$(curl -s -f https://raw.githubusercontent.com/pubnub/$SDK/master/.pubnub.yml | grep ^version | cut -s -d : -f 2 | sed 's/"//g')

    if [ "$SDK_VERSION" == '' ]
    then
        echo $SDK: ERROR
        let ERROR_FLAG=1
    else
        echo $SDK: $SDK_VERSION
    fi
done

if [ "$ERROR_FLAG" == 1 ]
then
    exit 1
fi
