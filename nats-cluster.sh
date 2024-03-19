#!/bin/sh -e
nats-server -p 4222 -cluster nats://localhost:4248 --cluster_name test-cluster -js -n test-cluster1 -routes nats://localhost:4248 -sd /tmp/nats1 &
nats-server -p 5222 -cluster nats://localhost:5248 -routes nats://localhost:4248 --cluster_name test-cluster -js -n test-cluster2 -routes nats://localhost:4248 -sd /tmp/nats2 &
nats-server -p 6222 -cluster nats://localhost:6248 -routes nats://localhost:4248 --cluster_name test-cluster --js -n test-cluster3 -routes nats://localhost:4248 -sd /tmp/nats3
