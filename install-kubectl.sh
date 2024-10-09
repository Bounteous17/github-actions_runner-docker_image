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

# Install kubectl based on architecture
install_kubectl() {
  ARCH=$(detect_architecture)

  if [[ $ARCH == "unsupported" ]]; then
    echo "Unsupported architecture: $ARCH"
    exit 1
  fi

  echo "Detected architecture: $ARCH"

  # Set the URL based on the architecture
  if [[ $ARCH == "amd64" ]]; then
    CLI_URL="https://dl.k8s.io/release/v1.30.0/bin/linux/amd64/kubectl"
  elif [[ $ARCH == "arm64" ]]; then
    CLI_URL="https://dl.k8s.io/release/v1.30.0/bin/linux/arm64/kubectl"
  fi

  wget "$CLI_URL"
  install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
}

# Run the install function
install_kubectl
