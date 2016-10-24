#!/bin/bash
if [[ ! -f authorized_keys ]]; then
    cp ~/.ssh/chrome.pub authorized_keys
fi

# if [[ ! -d ssh ]]; then
#     cp -r ~/.ssh ssh
# fi

docker build -t my-knife .
