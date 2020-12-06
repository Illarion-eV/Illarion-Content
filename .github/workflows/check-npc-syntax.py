import os
import re
import sys

import github


stream = os.popen('java -jar /tmp/compiler.jar npc 2>&1 | grep "Parsing the NPC"')
lines = stream.readlines()

annotations = []
errors = 0

npc_pattern = re.compile('.*?Parsing the NPC (.+?) failed')

for line in lines:
    match = npc_pattern.match(line)

    if match:
        errors = errors + 1

        annotations.append({
                            'path': 'npc/' + match.group(1),
                            'start_line': 1,
                            'end_line': 1,
                            'annotation_level': 'failure',
                            'message': 'See easyNPC editor for details.',
                            'title': 'NPC syntax error(s) in npc/' + match.group(1)
                          })

        print(annotations[-1]['title'])

github.annotate('Npc Syntax Results', errors, annotations)

if errors > 0:
    sys.exit(1)
