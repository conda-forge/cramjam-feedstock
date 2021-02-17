pypy-build-n-install:
	maturin build -i $(shell which pypy) --release --out wheels
	pypy ./pypy_patch.py
	pypy -m pip install wheels/*.whl
