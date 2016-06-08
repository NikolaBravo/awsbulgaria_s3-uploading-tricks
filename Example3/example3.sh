#!/usr/bin/env bash
#Example3 - Periodically synchronizing a directory that contains a large number of small and large files that change over time

#### Step 1 create mix of file sizes  

#### UGLY EXAMPLE; DO NOT COPY AND PASTE 
# i=1;
# while [[ $i -le 132000 ]]; do
#     num=$((8192*4/$i))
#     [[ $num -ge 1 ]] || num=1
#     mkdir randfiles/$i
#     seq -w 1 $num | xargs -n1 -P 256 -I % dd if=/dev/urandom of=randfiles/$i/file_$i.% bs=16k count=$i;
#     i=$(($i*2))
# done

#### END Step 1



#### Step 2 - Check our work by getting file sizes and file counts

#du -sh randfiles/
#Output:12G     randfiles/

#find ./randfiles/ -type f | wc -l
#65537

#### END Step2


#### Step 3 - sync files to S3

#time aws s3 sync --quiet . s3://test_bucket/test_randfiles/

#### END Step 3


#### Step 4 - check open conenction

#lsof -i tcp:443 | tail -n +2 | wc -l

#### END Step 4


#### Step 5 - check CPU usage

#mpstat -P ALL 10

#### END Step 5



#### Step 6 - check sync files

#aws s3 ls --recursive s3://test_bucket/test_randfiles/  | wc -l
#Output: 65537

#### END Step 6


#### Step 7 - create 5 more files

# touch 4096/*
# mkdir 5_more
# seq -w 1 5 | xargs -n1 -P 5 -I % dd if=/dev/urandom of=5_more/5_more% bs=1024k count=5

# find . –type f -mmin -10

#### END Step 7



#### Step 8 - sync again files to S3

#time aws s3 sync --quiet . s3://test_bucket/test_randfiles/

#### END Step 8
