#!/bin/bash

set -xe

echo "Installing cramjam==$PKG_VERSION"
pip install --index-url https://pypi.org/simple cramjam==$PKG_VERSION
#pip install https://files.pythonhosted.org/packages/87/a1/63d406857da2f944768f086dcbe22e712901187ddf3f511182455337b03a/cramjam-2.0.0-cp37-cp37m-manylinux2010_x86_64.whl
