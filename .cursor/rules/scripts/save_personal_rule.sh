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

# Store current directory
CURRENT_DIR=$(pwd)

# Pull latest changes from repository if git is available
if [ "$GIT_AVAILABLE" = true ]; then
    echo "Pulling latest changes..."
    cd "$HOME_RULES_DIR" || exit 1
    git pull || exit 1
    cd "$CURRENT_DIR" || exit 1
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
ln -sf "$HOME_RULES_DIR/$RULE_NAME" "$PROJECT_RULES_DIR/$RULE_NAME"

# Commit and push changes if git is available
if [ "$GIT_AVAILABLE" = true ]; then
    echo "Committing and pushing changes..."
    # Change to home rules directory for git operations
    cd "$HOME_RULES_DIR" || exit 1
    
    # Add all modified files in the rules directory except personal rules
    git add .
    
    # Check if there are any changes to commit
    if git status --porcelain | grep -q '^'; then
        git commit -m "chore(rules): update personal rules"
        git push
    else
        echo "No changes to commit"
    fi
    
    # Return to original directory
    cd "$CURRENT_DIR" || exit 1
fi

echo "Done! Rule '$RULE_NAME' has been set up${GIT_AVAILABLE:+ and synchronized with repository}." 