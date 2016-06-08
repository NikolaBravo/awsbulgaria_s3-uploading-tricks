#!/usr/bin/env bash
#Example2 - Uploading a small number of large files

#### Step 1 generate small large files
#Create 5 files filled with 2 GB of pseudo-random content

#seq -w 1 5 | xargs -n1 -P 5 -I % dd if=/dev/urandom of=bigfile.% bs=1024k count=2048

#### END Step 1 


#### Step 2 - List the files to verify size and number

#du -sk .
#Output: 10485804

#find . -type f | wc -l
#Output: 5
#### END Step 2


#### Step 3 - copy files to S3

#time aws s3 cp --recursive --quiet . s3://test_bucket/test_bigfiles/

#### END Step 3


#### Step 4 - check open conenction

#lsof -i tcp:443 | tail -n +2 | wc -l

#### END Step 4


#### Step 5 - check CPU usage

#mpstat -P ALL 10

#### END Step 5


#### Step 6 - check uploaded files count, should be the same as local files count

#aws s3 ls --recursive s3://test_bucket/test_bigfiles/ | wc -l
#Output: 5

#### END Step 6


#### Step 6 - examine the object head metadata

#aws s3api head-object --bucket test_bucket --key test_bigfiles/bigfile.1

#### END Step 7