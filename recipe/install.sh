curl -O https://pypi.org/pypi/cramjam/json
url=$(cat json | jq -r '.releases."$VERSION" | .[] | select(.python_version == "cp$MAJOR_MINOR") | select(.filename | contains("$TARGET") and contains("$ARCH") ) | select(.filename | contains("musllinux") | not) | .url')
fln=$(cat json | jq -r '.releases."$VERSION" | .[] | select(.python_version == "cp$MAJOR_MINOR") | select(.filename | contains("$TARGET") and contains("$ARCH") ) | select(.filename | contains("musllinux") | not) | .filename')
echo "Fetching wheel at $url"
curl -o "$fln" "$url"        
echo "Installing wheel"
$PYTHON -m pip install --pre --no-deps --no-index cramjam --find-links . -vv --target $SP_DIR
