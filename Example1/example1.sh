#!/usr/bin/env bash
#Example1 - Uploading a large number of very small files to Amazon S3

#### Step 1 generate many small files
#Create the 26 directories named for each letter of the alphabet, 
#then create 2048 files containing 32K of pseudo-random content in each

# for i in {a..z}; do
#     mkdir $i
#     seq -w 1 2048 | xargs -n1 -P 256 -I % dd if=/dev/urandom of=$i/% bs=32k count=1
# done

#### END Step 1 


#### Step 2 - verify files

#find . -type f | wc -l

#Output: 53248

#### END Step 2


#### Step 3 - copy files to s3

#time aws s3 cp --recursive --quiet . s3://test_bucket/test_smallfiles/

#### END Step 3


#### Step 4 - check open conenction

#lsof -i tcp:443 | tail -n +2 | wc -l

#### END Step 4


#### Step 5 - check CPU usage

#mpstat -P ALL 10

#### END Step 5



#### Step 6 - check uploaded files count, should be the same as local files count

#aws s3 ls --recursive s3://test_bucket/test_smallfiles/ | wc -l
#Output: 53248

#### END Step 6
