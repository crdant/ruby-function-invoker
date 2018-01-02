#!/usr/bin/env bash

docker build . -t crdant/base64:0.0.2-snapshot
docker push crdant/base64:0.0.2-snapshot
kubectl apply -f base64.yml
