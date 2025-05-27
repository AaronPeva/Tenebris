#!/bin/sh
echo -ne '\033c\033]0;Tenebris\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Tenebris.x86_64.arm64.x86_64" "$@"
