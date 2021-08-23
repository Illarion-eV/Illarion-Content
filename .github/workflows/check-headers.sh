#!/bin/bash
find . -type d \( -path ./.git -o -path ./.github \) -prune -false -o -type f -name "*.$1" | xargs -I '{}' .github/workflows/check-header.sh "$1" '{}'
