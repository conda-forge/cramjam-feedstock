import sysconfig
import pathlib
import re
import sys

"""
The entire point of this file is to rename resulting wheels to match the expected
naming convention for PyPy. Ref: https://github.com/PyO3/maturin/issues/312
"""

abi = sysconfig.get_config_var("SOABI").replace('-', '_')
major, minor = sys.version_info.major, sys.version_info.minor

# Ref: https://github.com/PyO3/maturin/issues/312#issuecomment-640113323
regex = re.compile(r"(?P<name>pp3[py0-9_]+-pypy[3_p0-9]+)")

for file in pathlib.Path("./wheels").iterdir():
    if file.name.endswith(".whl"):
        new_name = regex.sub(f"pp{major}{minor}-{abi}", file.name)
        print(f"Renaming {file.name} -> {new_name}")
        file.rename(file.parent.joinpath(new_name))
