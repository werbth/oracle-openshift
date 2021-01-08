#!/usr/bin/env bash

oc import-image oracle12c:12.2.0.1-slim --confirm \
    --reference-policy='local' \
    --from=docker.io/store/oracle/database-enterprise:12.2.0.1-slim
oc tag oracle12c:12.2.0.1-slim oracle12c:latest
oc create sa oracle
oc apply -f anyuid-role.yaml
oc process -f ./oracle-persistent.yaml | oc create -f -

