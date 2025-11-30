#!/usr/bin/env bash
set -euo pipefail

# Update Recyclarr Homebrew formula with new version and SHA256 hashes
#
# Usage: ./scripts/update-formula.sh <version>
# Example: ./scripts/update-formula.sh 7.5.1

VERSION="${1:-}"

if [[ -z "$VERSION" ]]; then
    echo "Usage: $0 <version>" >&2
    echo "Example: $0 7.5.1" >&2
    exit 1
fi

BASE_URL="https://github.com/recyclarr/recyclarr/releases/download/v${VERSION}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="${SCRIPT_DIR}/.."
TEMPLATE_PATH="${REPO_ROOT}/Formula/recyclarr.rb.template"
FORMULA_PATH="${REPO_ROOT}/Formula/recyclarr.rb"

echo "Updating formula to v${VERSION}..."

# Fetch SHA256 hashes
echo "  Fetching hash for osx-arm64..."
SHA_OSX_ARM64=$(curl -sL "${BASE_URL}/recyclarr-osx-arm64.tar.xz" | sha256sum | cut -d' ' -f1)
echo "    ${SHA_OSX_ARM64}"

echo "  Fetching hash for osx-x64..."
SHA_OSX_X64=$(curl -sL "${BASE_URL}/recyclarr-osx-x64.tar.xz" | sha256sum | cut -d' ' -f1)
echo "    ${SHA_OSX_X64}"

echo "  Fetching hash for linux-arm64..."
SHA_LINUX_ARM64=$(curl -sL "${BASE_URL}/recyclarr-linux-arm64.tar.xz" | sha256sum | cut -d' ' -f1)
echo "    ${SHA_LINUX_ARM64}"

echo "  Fetching hash for linux-x64..."
SHA_LINUX_X64=$(curl -sL "${BASE_URL}/recyclarr-linux-x64.tar.xz" | sha256sum | cut -d' ' -f1)
echo "    ${SHA_LINUX_X64}"

# Generate formula from template
sed -e "s/{{VERSION}}/${VERSION}/" \
    -e "s/{{SHA_OSX_ARM64}}/${SHA_OSX_ARM64}/" \
    -e "s/{{SHA_OSX_X64}}/${SHA_OSX_X64}/" \
    -e "s/{{SHA_LINUX_ARM64}}/${SHA_LINUX_ARM64}/" \
    -e "s/{{SHA_LINUX_X64}}/${SHA_LINUX_X64}/" \
    "$TEMPLATE_PATH" > "$FORMULA_PATH"

echo "Formula updated: ${FORMULA_PATH}"
