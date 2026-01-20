#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Configuration
IMAGE_NAME="trigen/dev-container"
PLATFORM="linux/amd64"

echo "🚀 Starting build process for platform: $PLATFORM..."

# ---------------------------------------------------------
# Step 1: Build and Push the main image (latest)
# ---------------------------------------------------------
echo "📦 [1/2] Building and pushing $IMAGE_NAME:latest..."

docker buildx build \
  --platform "$PLATFORM" \
  --tag "$IMAGE_NAME:latest" \
  --file Dockerfile \
  --push \
  .

echo "✅ $IMAGE_NAME:latest pushed successfully."

# ---------------------------------------------------------
# Step 2: Build and Push the tunnel image
# ---------------------------------------------------------
echo "🚇 [2/2] Building and pushing $IMAGE_NAME:tunnel..."

docker buildx build \
  --platform "$PLATFORM" \
  --tag "$IMAGE_NAME:tunnel" \
  --file Dockerfile.tunnel \
  --push \
  .

echo "✅ $IMAGE_NAME:tunnel pushed successfully."
echo "🎉 All images have been built and published!"
