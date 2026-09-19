#!/usr/bin/env zsh
set -euo pipefail

if [[ $# -ne 2 ]]; then
  echo "Usage: $(basename "$0") <cask_name> <new_version>"
  echo "  e.g. $(basename "$0") pyamoto 2.0"
  exit 1
fi

cask=$1
version=$2
file="Casks/${cask}.rb"

if [[ ! -f $file ]]; then
  echo "Error: $file not found"
  exit 1
fi

url=$(grep 'url "' "$file" | head -1 | sed 's/.*"\(.*\)".*/\1/')

if [[ -z $url ]]; then
  echo "Error: could not extract URL from $file"
  exit 1
fi

expanded_url=${url//'#{version}'/$version}

echo "Fetching hash for: $expanded_url"

tmp=$(mktemp)
trap 'rm -f "$tmp"' EXIT

if ! curl -f -sL -o "$tmp" "$expanded_url"; then
  echo "Error: download failed - version '$version' may not exist"
  exit 1
fi
sha=$(shasum -a 256 "$tmp" | awk '{print $1}')

sed -i '' "s/^  version \".*/  version \"$version\"/" "$file"
sed -i '' "s/^  sha256 \".*/  sha256 \"$sha\"/" "$file"

echo "Updated $cask to v$version ($sha)"
