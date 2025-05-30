#!/bin/sh
echo -ne '\033c\033]0;Tenebris\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Tenebris_linux.x86_64" "$@"
