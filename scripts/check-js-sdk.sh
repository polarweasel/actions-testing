#!/bin/bash
curl -s https://raw.githubusercontent.com/pubnub/javascript/master/.pubnub.yml | grep ^version | cut -s -d : -f 2 | sed 's/"//g'
