#!/bin/bash
# =====================================================
# 🧠 update-wiki.sh
# Auto-commit and push all wiki changes to GitHub
# for ChatGPT-Desktop-Linux-VTS (Vishwanath Tec Systems)
# =====================================================

WIKI_DIR="./wiki"
cd "$WIKI_DIR" || { echo "⚠️ Wiki directory not found!"; exit 1; }

# Fetch latest remote changes first to avoid merge issues
echo "🔄 Pulling latest wiki updates..."
git pull --rebase || { echo "⚠️ Pull failed — check connection or conflicts."; exit 1; }

# Stage all modified and new files
echo "📦 Staging changes..."
git add .

# Generate commit message with timestamp
DATE=$(date +"%Y-%m-%d %H:%M:%S")
COMMIT_MSG="📘 Wiki auto-update — ${DATE}"

echo "📝 Committing changes..."
git commit -m "${COMMIT_MSG}" || echo "✅ No changes to commit."

# Push to GitHub wiki
echo "🚀 Pushing to GitHub wiki..."
git push origin master || git push origin main

# Back to project root
cd - > /dev/null

echo "✅ Wiki successfully updated and pushed!"
