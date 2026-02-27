#!/bin/bash

REPO_PATH="/Users/Chris/Projects/theDailyCommit"  # Path to your repository
COMMIT_MESSAGE="Daily commit"                     # Base commit message

cd "$REPO_PATH" || exit 1

echo "Running script in directory: $(pwd)"

BRANCH=$(git symbolic-ref --short HEAD)

# Distribution with:
# - Min: 1
# - Max: 15
# - Mean: ~6
# - Mode: 6
values=(1  2  3  4  5  6  7  8  9  10 11 12 13 14 15)
weights=(4  8  15 22 28 30 25 20 14  9  6  4  3  2  2)
total_weight=192

r=$(( RANDOM % total_weight ))
NUM_COMMITS=1

for i in "${!values[@]}"; do
    w=${weights[$i]}
    if (( r < w )); then
        NUM_COMMITS=${values[$i]}
        break
    fi
    r=$(( r - w ))
done

echo "Generating $NUM_COMMITS commits today on branch: $BRANCH"

created_files=()

for ((i=1; i<=NUM_COMMITS; i++)); do

    DATE=$(date +%Y-%m-%d-%H-%M-%S)
    FILENAME="$DATE-$i.txt"

    echo "Commit $i generated at $(date)" >> "$FILENAME"

    created_files+=("$FILENAME")

    git add "$FILENAME"
    git commit -m "$COMMIT_MESSAGE $i"
    git push origin "$BRANCH"

    sleep 1
done

echo "Cleaning up generated files..."

for f in "${created_files[@]}"; do
    if [ -f "$f" ]; then
        rm "$f"
        echo "Deleted $f"
    fi
done

git add -A
git commit -m "Daily cleanup"
git push origin "$BRANCH"

echo "Daily automation complete."