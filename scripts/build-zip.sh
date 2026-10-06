#!/bin/sh
# Builds the ZIP for OpenAI's plugin portal (platform.openai.com/plugins).
# It holds only the package: plugin.json, mcp.json and assets/, never store/ or scripts/.
# Before zipping, it checks the limits the portal enforces at submission.
set -eu
cd "$(dirname "$0")/.."

python3 - <<'EOF'
import json, os, sys

p = json.load(open('plugin.json'))
ui = p['extensions']['com.openai']['interface']
review = p['extensions']['com.openai'].get('review', {})
problems = []

def limit(field, value, n):
    if len(value) > n:
        problems.append(f'{field} has {len(value)} characters, at most {n} allowed')

limit('name', p['name'], 64)
limit('displayName', ui['displayName'], 30)
limit('shortDescription', ui['shortDescription'], 30)
limit('longDescription', ui['longDescription'], 4000)
limit('developerName', ui['developerName'], 80)
if len(ui.get('capabilities', [])) > 20:
    problems.append('more than 20 capabilities')
for c in ui.get('capabilities', []):
    limit(f'capability "{c}"', c, 120)
prompts = ui.get('defaultPrompt', [])
if len(prompts) > 3:
    problems.append('more than 3 default prompts')
for d in prompts:
    limit(f'default prompt "{d}"', d, 128)
for key in ('websiteURL', 'supportURL', 'privacyPolicyURL', 'termsOfServiceURL'):
    if not ui.get(key, '').startswith('https://'):
        problems.append(f'{key} must be an https:// URL')
for key in ('logo', 'composerIcon'):
    if not os.path.isfile(ui[key]):
        problems.append(f'{key} file {ui[key]} is missing')
cases = review.get('test_cases', {})
if len(cases.get('positive', [])) != 5 or len(cases.get('negative', [])) != 3:
    problems.append('initial review needs exactly 5 positive and 3 negative test cases')
for case in cases.get('positive', []):
    if not case.get('tools_triggered') or not case.get('expected_behavior'):
        problems.append(f'positive case "{case["description"]}" needs tools_triggered and expected_behavior')
if not review.get('demo_recording_url'):
    print('Note: no demo_recording_url yet; review requires one (store/demo-video.md).')

if problems:
    print('\n'.join(problems), file=sys.stderr)
    sys.exit(1)
EOF

version=$(python3 -c 'import json; print(json.load(open("plugin.json"))["version"])')
mkdir -p dist
out="dist/remember-me-$version.zip"
rm -f "$out"
zip -q -X -r "$out" plugin.json mcp.json assets -x '*.DS_Store'
echo "$out"
