import os
import requests


def annotate(title, errors, annotations):
    if errors > 0:
        payload = {'output': {'title': title, 'summary': str(errors) + ' errors detected.', 'annotations': annotations}}

        repo = os.environ['GITHUB_REPOSITORY']
        job_id = os.environ['JOB_ID']
        run_id = os.environ['GITHUB_RUN_ID']
        github_token = os.environ['GITHUB_TOKEN']

        headers = {'Accept': 'application/vnd.github.v3+json',
                   'Authorization': 'token ' + github_token}
        url = 'https://api.github.com/repos/' + repo + '/actions/runs/' + str(run_id)
        r = requests.get(url, headers=headers)
        check_suite_url = r.json()['check_suite_url']

        url = check_suite_url + '/check-runs'
        r = requests.get(url, headers=headers)
        check_run = next((item for item in r.json()['check_runs'] if item['name'] == job_id), None)

        url = 'https://api.github.com/repos/' + repo + '/check-runs/' + str(check_run['id'])
        r = requests.patch(url, headers=headers, json=payload)
        print(r.status_code)
