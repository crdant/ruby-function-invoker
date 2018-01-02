#!/usr/bin/env bash

docker build . -t crdant/binary:0.0.2-snapshot
docker push crdant/binary:0.0.2-snapshot
kubectl apply -f binary.yml
