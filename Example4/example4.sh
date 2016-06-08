#!/usr/bin/env bash
#Example4 - Maximizing throughput


#### Step 1 - Launch 26 copies of the aws s3 cp command, one per directory

#time ( find smallfiles -mindepth 1 -maxdepth 1 -type d -print0 | xargs -n1 -0 -P30 -I {} aws s3 cp --recursive --quiet {}/ s3://test_bucket/{}/ )

#### END Step 1



#### Step 2 - check open conenction

#lsof -i tcp:443 | tail -n +2 | wc -l

#### END Step 2


#### Step 3 - check CPU usage

#mpstat -P ALL 10

#### END Step 3


#### Step 4 - check uploaded files count, should be the same as local files count

#aws s3 ls --recursive s3://test_bucket/smallfiles

#### END Step 4