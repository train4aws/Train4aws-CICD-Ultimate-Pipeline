#!/bin/bash

# Download the Helm installation script
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3

# Set the script file permissions
chmod 700 get_helm.sh

# Run the Helm installation script
./get_helm.sh

# Remove the installation script
rm get_helm.sh
