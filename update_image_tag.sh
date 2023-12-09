#!/bin/bash

# Path to the values.yaml file
VALUES_FILE="helm/values.yaml"

# New image tag
NEW_TAG=$1

# Use jq to update the image tag
yq eval ".frontend.image.tag = \"$NEW_TAG\" | .backend.image.tag = \"$NEW_TAG\"" "$VALUES_FILE" > temp.yaml

# Move the temp.yaml to the original VALUES_FILE
mv temp.yaml "$VALUES_FILE"