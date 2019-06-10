#!/usr/bin/env bash

JOBNAME="" # put full dir
BASEURL="http://localhost:8080"
TOKEN=""

## Backup jobconfig
curl -X GET "${BASEURL}/job/${JOBNAME}/config.xml" \
-u ${TOKEN} \
-o config_$(date '+%F').xml

## restore jobconfig
curl -X POST "${BASEURL}/job/${JOBNAME}/config.xml" \
-u ${TOKEN} \
--data-binary @config_.xml \ # replace file
-H "Content-Type:text/xml"

## create new job from back-up
curl -X POST "${BASEURL}/createItem?name=${JOBNAME}" \
-u ${TOKEN} \
--data-binary @./build.xml \ # replace file
-H "Content-Type:text/xml"

## delete job
# unsafe
curl -X DELETE "${BASEURL}/job/${JOBNAME}" \
-u ${TOKEN}

# safe
curl -X POST "${BASEURL}/job/${JOBNAME}/doDelete" \
-u ${TOKEN}
