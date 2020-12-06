import os
import re
import sys

import github


stream = os.popen('find . -type d \( -path ./.git -o -path ./.github \) -prune -false -o -type f -name *.lua | xargs luac -p 2>&1')
lines = stream.readlines()

annotations = []
errors = 0

luac_pattern = re.compile('luac: \.\/(.+?):(\d+): (.+)')

for line in lines:
    match = luac_pattern.match(line)

    if match:
        errors = errors + 1

        annotations.append({
                            'path': match.group(1),
                            'start_line': int(match.group(2)),
                            'end_line': int(match.group(2)),
                            'annotation_level': 'failure',
                            'message': match.group(3),
                            'title': 'Lua syntax error in ' + match.group(1) + ', line ' + match.group(2)
                          })

        print(annotations[-1]['title'] + ": " + annotations[-1]['message'])

github.annotate('Lua Syntax Results', errors, annotations)

if errors > 0:
    sys.exit(1)
