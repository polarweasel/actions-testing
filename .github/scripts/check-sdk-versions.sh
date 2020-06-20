#!/bin/bash

SDK_LIST=('javascript' 'swift' 'php' 'python' 'java' 'dart' 'kotlin' 'unity' 'go' 'c-sharp' 'objective-c' 'ruby' 'c-core' )

ERROR_FLAG=false

for SDK in "${SDK_LIST[@]}"
do
    SDK_VERSION=$(curl -s -f https://raw.githubusercontent.com/pubnub/$SDK/master/.pubnub.yml | grep ^version | cut -s -d : -f 2 | sed 's/"//g')

    if [ "$SDK_VERSION" == '' ]; then
        echo $SDK ERROR
        ERROR_FLAG=true
    else
        echo $SDK: $SDK_VERSION
        # Instead of an echo, this should actually populate a DB entry
        # or call a script to replace a value in a file.
        # 
        # Something like this:
        #
        # sed -i '' "s/^$SDK.*$/$SDK: $SDK_VERSION/g" sdk-versions.txt
        #
        # (Note: the -i flag on linux is slightly different than on macOS.)
        # (Should also test for existence. If it's a new SDK, just append to the file.)
    fi
done

if [ "$ERROR_FLAG" = true ]; then
    exit 1
fi
