#!/bin/bash
# ============================================================
# claude-dev-toolkit — Agent: describe-pr
# Usage: ./agents/describe-pr/run.sh [path-to-project]
# ============================================================

set -e

AGENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROMPT_FILE="$AGENT_DIR/prompt.md"
PROJECT_DIR="${1:-$(pwd)}"

echo "============================================================"
echo " Claude Dev Toolkit — PR Description Generator"
echo "============================================================"
echo " Project : $PROJECT_DIR"
echo " Agent   : describe-pr"
echo "============================================================"

if [ ! -f "$PROMPT_FILE" ]; then
  echo "ERROR: prompt.md not found in $AGENT_DIR"
  exit 1
fi

if [ ! -d "$PROJECT_DIR" ]; then
  echo "ERROR: Project directory does not exist: $PROJECT_DIR"
  exit 1
fi

if ! command -v claude &> /dev/null; then
  echo "ERROR: Claude Code is not installed."
  echo "Install with: npm install -g @anthropic-ai/claude-code"
  exit 1
fi

cd "$PROJECT_DIR"

BRANCH=$(git branch --show-current 2>/dev/null || echo "unknown")
echo " Current branch: $BRANCH"
echo ""
echo "Analyzing changes and generating PR description..."
echo ""

claude --print "$(cat "$PROMPT_FILE")"

echo ""
echo "============================================================"
echo " Description generated: $PROJECT_DIR/PR-DESCRIPTION.md"
echo " Copy the content directly to GitHub when creating the PR."
echo "============================================================"
