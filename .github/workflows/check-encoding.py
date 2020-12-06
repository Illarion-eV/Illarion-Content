import os
import re
import sys

import github

    
stream = os.popen('find . -type d \( -path ./.git -o -path ./.github \) -prune -false -o -type f | xargs file -i | grep -vE "iso-8859-1|us-ascii"')
lines = stream.readlines()

annotations = []
errors = 0

file_pattern = re.compile('\.\/(.+?):.*charset=(\S+)')

for line in lines:
    match = file_pattern.match(line)

    if match:
        errors = errors + 1

        annotations.append({
                            'path': match.group(1),
                            'start_line': 1,
                            'end_line': 1,
                            'annotation_level': 'failure',
                            'message': 'Please change encoding to iso-8859-1.',
                            'title': 'File ' + match.group(1) + ' has invalid encoding \'' + match.group(2) + '\''
                          })

        print(annotations[-1]['title'] + ": " + annotations[-1]['message'])

github.annotate('Encoding Results', errors, annotations)

if errors > 0:
    sys.exit(1)
