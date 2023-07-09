#!/bin/bash

# Path to your kubernetes manifests
DEPLOYMENT_DIR='./deploy'
CONFIGMAPS_DIR='./deploy/configs'

# Apply all manifests in the deployments directory
for manifest in $DEPLOYMENT_DIR/*.yaml; do
    kubectl apply -f $manifest
done

# Create configmaps from all files in the configmaps subdirectory
for configmap in $CONFIGMAPS_DIR/*; do
    configmap_name=$(basename $configmap)
    kubectl create configmap $configmap_name --from-file=$configmap
done