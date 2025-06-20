#!/bin/bash
# Render Build Script for Keras (standalone)
# Optimized for Python 3.9.11 on Render.com

set -e  # Exit immediately on error

echo "=== Starting Keras Build on Render ==="

# 1. Verify Python version (Render respects runtime.txt)
if ! python -V | grep -q "Python 3.9.11"; then
    echo "ERROR: Wrong Python version. Ensure runtime.txt contains: python-3.9.11"
    exit 1
fi

# 2. Install system dependencies (Ubuntu 20.04 LTS base)
echo "--- Installing system dependencies ---"
apt-get update -qq && apt-get install -y \
    python3-dev \
    build-essential \
    libpython3.9-dev \
    && rm -rf /var/lib/apt/lists/*

# 3. Upgrade pip and setuptools
python -m pip install --upgrade pip==23.1.2
pip install setuptools==65.5.0

# 4. Install Keras and dependencies
echo "--- Installing Python packages ---"
pip install --no-cache-dir \
    --default-timeout=300 \
    -r requirements.txt

# 5. Verify Keras installation
echo "=== Verifying Keras Installation ==="
python -c "
import keras
print('✓ Keras version:', keras.__version__)
from keras.models import load_model
print('✓ Keras model loading verified')
"

# 6. Cleanup
echo "--- Cleaning build artifacts ---"
find /usr/local/lib/python3.12 -type d -name '__pycache__' -exec rm -rf {} +
rm -rf /root/.cache/pip

echo "=== Keras Build Successful - Ready for Deployment ==="