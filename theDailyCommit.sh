#!/bin/bash

REPO_PATH="/Users/Chris/Projects/theDailyCommit"  # Specify the path to your repository
COMMIT_MESSAGE="Daily commit"  # Specify the commit message

cd "$REPO_PATH" || exit 1

# Create a dummy file with the current date as the file name
DATE=$(date +%Y-%m-%d)
FILENAME="$DATE.txt"
touch "$FILENAME"

# Stage the new file
git add "$FILENAME"

# Commit the changes
git commit -m "$COMMIT_MESSAGE"

# Push the changes to the remote repository
git push origin main