import os
import re
import sys

import github


stream = os.popen('.github/workflows/check-headers.sh npc; .github/workflows/check-headers.sh lua')
lines = stream.readlines()

annotations = []
errors = 0

file_pattern = re.compile('\.\/(.+)')

for line in lines:
    match = file_pattern.match(line)

    if match:
        errors = errors + 1

        annotations.append({
                            'path': match.group(1),
                            'start_line': 1,
                            'end_line': 1,
                            'annotation_level': 'failure',
                            'message': 'See .github/workflows/' + match.group(1)[-3:] + '.header for expected header.',
                            'title': 'File ' + match.group(1) + ' has incorrect licence header'
                          })

        print(annotations[-1]['title'] + ": " + annotations[-1]['message'])

github.annotate('Header Results', errors, annotations)

if errors > 0:
    sys.exit(1)
