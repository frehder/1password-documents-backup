#!/bin/bash

echo 'Using jq json tool:'
which jq

# 1password login
eval $(op signin $NAME)

# create ./docs directory if it does not exist
mkdir -p docs

# read content of given file
# iterate over each item of array
#   read data
#     get title and uuid
#     echo message
#     download document
cat $1 | \
jq -rc '.[]' | \
while IFS='' read document; do
    title=$(echo "$document" | jq .overview.title | tr -d '"')
    uuid=$(echo "$document" | jq .uuid | tr -d '"')
    echo "File: $title ($uuid)"
    op get document $uuid > "docs/$title"
done
