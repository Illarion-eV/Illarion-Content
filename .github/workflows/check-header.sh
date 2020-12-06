#!/bin/bash
diff --ignore-space-change <(cat $2 | head -`wc -l < .github/workflows/$1.header`) .github/workflows/$1.header 2>&1 > /dev/null || echo "$2"
