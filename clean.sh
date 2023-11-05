#!/usr/bin/env bash

set -e
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "[+] Remove .DS_Store files from :: $SCRIPT_DIR"

pushd $SCRIPT_DIR &> /dev/null
find . -name '.DS_Store' -type f -delete -print
popd &> /dev/null