#!/bin/bash
# Install specific Python version
apt-get update && apt-get install -y python3.9 python3.9-dev
# Make it the default
update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1
update-alternatives --set python3 /usr/bin/python3.9
# Install dependencies
pip install -r requirements.txt