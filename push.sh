#!/bin/bash
# push.sh — commit and push dashboard updates to GitHub
#
# Usage:
#   ./push.sh                       (auto-generated commit message with timestamp)
#   ./push.sh "Update Round of 16 scores"

set -e
cd "$(dirname "$0")"

echo "==> mundial-2026: syncing with GitHub"

# 1. Stage everything first. You can't pull --rebase with local edits
#    sitting around uncommitted, so commit before touching the remote.
git add -A

if git diff --cached --quiet; then
  echo "==> No changes to commit. Nothing to push."
  exit 0
fi

MSG="${1:-Update dashboard - $(date '+%Y-%m-%d %H:%M')}"
git commit -m "$MSG"
echo "==> Committed: $MSG"

# 2. Now it's safe to sync with the remote. Most "GitHub errors" on push
#    are non-fast-forward rejections because the remote has commits
#    (e.g. edited on github.com) that aren't in your local copy yet.
echo "==> Pulling latest changes (rebase)..."
if ! git pull --rebase origin main; then
  echo ""
  echo "!! Rebase hit a conflict."
  echo "!! Run 'git status' to see which file(s) conflict, edit them to"
  echo "!! remove the <<<<<<< / ======= / >>>>>>> markers, then run:"
  echo "!!   git add <file>"
  echo "!!   git rebase --continue"
  echo "!! and re-run this script."
  exit 1
fi

# 3. Push, with one retry in case the remote moved again mid-script.
echo "==> Pushing to GitHub..."
if ! git push origin main; then
  echo "==> Push rejected — pulling once more and retrying..."
  git pull --rebase origin main
  git push origin main
fi

echo "==> Done. Live at https://carlwc.github.io/mundial-2026"
