#!/bin/bash

set -ex

if [[ "$python_impl" == "pypy" ]]; then
  maturin build -i $(which pypy) --release --out wheels
	pypy ./pypy_patch.py
	rm -f wheels/*.gz
	pypy -m pip install wheels/*.whl
else
  python -m pip install . -vv
fi
