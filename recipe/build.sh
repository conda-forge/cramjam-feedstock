#!/bin/bash

set -ex

if ! command -v pypy --version &> /dev/null; then
  echo "PyPy not detected"
  python -m pip install . -vv
else
  echo "Building for PyPy"
  maturin build -i $(which pypy) --release --out wheels
	pypy ./pypy_patch.py
	rm -f wheels/*.gz
	pypy -m pip install wheels/*.whl
fi
