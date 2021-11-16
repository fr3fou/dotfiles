#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Clear Local Platform Cache
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.author Simo Aleksandrov
# @raycast.authorURL https://github.com/fr3fou

curl -s -o /dev/null -w "%{http_code}" "http://localhost:5000/config/cache/flush?secret=risitas"
