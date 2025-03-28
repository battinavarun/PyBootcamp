#!/bin/bash

WATCHED_DIR="/c/Users/Temporary/Desktop/udemy/python_boot/Day5"
BRANCH="master"  # Change this to your branch name

# Navigate to the directory
cd "$WATCHED_DIR" || { echo "Directory not found! Exiting..."; exit 1; }

echo "Watching directory: $WATCHED_DIR for changes..."

# Monitor changes using a loop
while true; do
    # Check for changes every 5 seconds
    sleep 5

    # If there are changes, commit and push
    if [[ -n $(git status --porcelain) ]]; then
        git add .
        git commit -m "Auto-commit: $(date)"
        git push origin "$BRANCH"
        echo "Changes detected and committed."
    fi
done

