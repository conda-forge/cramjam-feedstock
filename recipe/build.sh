#!/bin/bash

set -xe

echo "Installing cramjam==$PKG_VERSION"
python -m pip install --upgrade pip
python -m pip install --no-deps cramjam==$PKG_VERSION
