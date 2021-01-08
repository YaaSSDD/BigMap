#!/bin/sh

ChangeZoneGcloud ()
{
gcloud compute $1 add-metadata \
    --metadata google-compute-default-region=$2,google-compute-default-zone=$2-$3
}