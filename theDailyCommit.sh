#!/bin/bash

REPO_PATH="/Users/Chris/Projects/theDailyCommit"  # Specify the path to your repository
COMMIT_MESSAGE="Daily commit"  # Specify the commit message
NUM_COMMITS=$1                        # Get the number of commits from command line


cd "$REPO_PATH" || exit 1

# Create a dummy file with the current date as the file name
# Generate and push five changes
for ((i=1; i<=NUM_COMMITS; i++))
do
    # Create a dummy file with the current date and iteration number as the file name
    DATE=$(date +%Y-%m-%d-%H-%M-%S)
    FILENAME="$DATE-$i.txt"
    touch "$FILENAME"

    # Stage the new file
    git add "$FILENAME"

    # Commit the changes
    git commit -m "$COMMIT_MESSAGE $i"

    # Push the changes to the remote repository
    git push origin main
done