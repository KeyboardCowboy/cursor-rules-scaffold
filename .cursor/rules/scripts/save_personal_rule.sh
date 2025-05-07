#!/bin/bash

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

# Check if source file exists
if [ ! -f "$SOURCE_FILE" ]; then
    echo "Error: Source file '$SOURCE_FILE' does not exist"
    exit 1
fi

# Create the rule file in home directory if it doesn't exist
if [ ! -f "$HOME_RULES_DIR/$RULE_NAME" ]; then
    echo "Creating new rule file: $HOME_RULES_DIR/$RULE_NAME"
    cp "$SOURCE_FILE" "$HOME_RULES_DIR/$RULE_NAME"
else
    echo "Rule file already exists: $HOME_RULES_DIR/$RULE_NAME"
    read -p "Do you want to overwrite it? (y/N) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        cp "$SOURCE_FILE" "$HOME_RULES_DIR/$RULE_NAME"
        echo "File has been overwritten"
    else
        echo "Keeping existing file"
    fi
fi

# Create symlink in project directory
if [ ! -L "$PROJECT_RULES_DIR/$RULE_NAME" ]; then
    echo "Creating symlink in project: $PROJECT_RULES_DIR/$RULE_NAME"
    ln -s "$HOME_RULES_DIR/$RULE_NAME" "$PROJECT_RULES_DIR/$RULE_NAME"
else
    echo "Symlink already exists: $PROJECT_RULES_DIR/$RULE_NAME"
fi

echo "Done! Rule '$RULE_NAME' has been set up." 