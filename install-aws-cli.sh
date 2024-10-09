#!/bin/bash

# Function to detect architecture
detect_architecture() {
  ARCH=$(uname -m)
  if [[ $ARCH == "x86_64" ]]; then
    echo "amd64"
  elif [[ $ARCH == "aarch64" ]]; then
    echo "arm64"
  else
    echo "unsupported"
  fi
}

# Install AWS CLI based on architecture
install_aws_cli() {
  ARCH=$(detect_architecture)

  if [[ $ARCH == "unsupported" ]]; then
    echo "Unsupported architecture: $ARCH"
    exit 1
  fi

  echo "Detected architecture: $ARCH"

  # Set the URL based on the architecture
  if [[ $ARCH == "amd64" ]]; then
    CLI_URL="https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip"
  elif [[ $ARCH == "arm64" ]]; then
    CLI_URL="https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip"
  fi

  # Download AWS CLI zip
  echo "Downloading AWS CLI for $ARCH..."
  sudo curl -o "awscliv2.zip" "$CLI_URL"

  # Unzip the downloaded file
  echo "Unzipping AWS CLI..."
  sudo unzip awscliv2.zip

  # Run the install script
  echo "Installing AWS CLI..."
  sudo ./aws/install

  # Verify installation
  aws --version

  # Clean up
  echo "Cleaning up..."
  sudo rm -rf awscliv2.zip aws
}

# Run the install function
install_aws_cli
