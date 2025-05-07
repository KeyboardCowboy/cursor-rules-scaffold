#!/bin/bash

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "Git is not installed. Skipping repository operations."
    GIT_AVAILABLE=false
else
    GIT_AVAILABLE=true
fi

# Check if both rule name and source file were provided
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 <rule_name> <source_file>"
    echo "Example: $0 my_new_rule ./templates/my_rule_template.mdc"
    exit 1
fi

# Define paths
HOME_RULES_DIR="$HOME/.cursor/rules/personal"
PROJECT_RULES_DIR=".cursor/rules/personal"
RULE_NAME="$1.mdc"
SOURCE_FILE="$2"

# Pull latest changes from repository if git is available
if [ "$GIT_AVAILABLE" = true ]; then
    echo "Pulling latest changes..."
    git pull origin main || git pull origin master
fi

# Check if source file exists
if [ ! -f "$SOURCE_FILE" ]; then
    echo "Error: Source file '$SOURCE_FILE' does not exist"
    exit 1
fi

# Create or overwrite the rule file in home directory
echo "Creating/updating rule file: $HOME_RULES_DIR/$RULE_NAME"
cp "$SOURCE_FILE" "$HOME_RULES_DIR/$RULE_NAME"

# Create symlink in project directory
echo "Creating symlink in project: $PROJECT_RULES_DIR/$RULE_NAME"
# Remove existing file or symlink if it exists
rm -f "$PROJECT_RULES_DIR/$RULE_NAME"
# Create new symlink
ln -s "$HOME_RULES_DIR/$RULE_NAME" "$PROJECT_RULES_DIR/$RULE_NAME"

# Commit and push changes if git is available
if [ "$GIT_AVAILABLE" = true ]; then
    echo "Committing and pushing changes..."
    # Only commit the script changes, personal rules are git-ignored
    if git status --porcelain .cursor/rules/scripts/save_personal_rule.sh | grep -q '^'; then
        git add .cursor/rules/scripts/save_personal_rule.sh
        git commit -m "chore(scripts): update save_personal_rule script"
        git push
    else
        echo "No script changes to commit"
    fi
fi

echo "Done! Rule '$RULE_NAME' has been set up${GIT_AVAILABLE:+ and synchronized with repository}." 