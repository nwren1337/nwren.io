#!/bin/bash

if [ $# -ne 2 ];
then
    echo "usage: ${0} <s3 bucket> <cloudfront distribution ID>"
    exit 1
fi

S3_BUCKET=$1
CLOUDFRONT_DISTRIBUTION=$2

if [ "$(which aws)" == '' ];
then
    echo "aws-cli binary not found!"
    exit 1
fi

STATIC_ROOT="static/"

echo "Deploying s3 bucket..."

aws s3 sync ${STATIC_ROOT} "s3://${S3_BUCKET}" --delete

echo "Invalidating Cloudfront Cache"

aws configure set preview.cloudfront true

aws cloudfront create-invalidation --distribution-id "${CLOUDFRONT_DISTRIBUTION}" --paths "/*"

