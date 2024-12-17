#!/bin/bash

REPO_PATH="/Users/Chris/Projects/theDailyCommit"  # Specify the path to your repository
COMMIT_MESSAGE="Daily commit"  # Specify the commit message
NUM_COMMITS=$1                        # Get the number of commits from command line

cd "$REPO_PATH" || exit 1

# Confirm the current directory
echo "Running script in directory: $(pwd)"

# Get the current branch name
BRANCH=$(git symbolic-ref --short HEAD)

# Generate and push changes
for ((i=1; i<=NUM_COMMITS; i++))
do
    # Create a unique file name with timestamp
    DATE=$(date +%Y-%m-%d-%H-%M-%S)
    FILENAME="$DATE-$i.txt"
    
    # Create the file and append some unique content
    echo "Commit $i generated at $(date)" >> "$FILENAME"
    
    # Stage the new file
    git add "$FILENAME"
    
    # Commit the changes
    git commit -m "$COMMIT_MESSAGE $i"
    
    # Push the changes to the remote repository
    git push origin "$BRANCH"
    
    # Wait a second to ensure the timestamp changes (optional)
    sleep 1
done
