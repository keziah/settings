#!/usr/bin/env bash

# This script takes dotfile templates generated for a specific env.
# It needs to be run 1x when forking my original dotfiles repo and
# customizing it for the env (i.e. personal, work, remote workspace).
# The generated dotfiles are then output to a specific directory
# and can be committed to the private forked repo.

if [[ -z "$OUTPUT_DIR" ]]; then
  echo "Please set the \$OUTPUT_DIR envvar. Suggested: $HOME"
  exit 1
fi

# Check required variables
if [[ -z "$GITHUB_EMAIL" ]]; then
  echo "The \$GITHUB_EMAIL environment variable is not set."
  exit 1
else
  echo "The \$GITHUB_EMAIL environment variable is set to $GITHUB_EMAIL."
fi

echo "Generating all dotfiles to $OUTPUT_DIR"
read -p "Is this correct? (y/n) " -n 1 -r
echo    # move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # if this point is reached, the user entered y (yes)
    echo "You entered yes."
    # continue script execution
else
    echo "Terminating script."
    exit 1
fi

echo "Copying over bash dotfiles..."
for file in bash/.*; do
  if [ -f "$file" ]; then
      cp "$file" $OUTPUT_DIR
  fi
done

echo "Copying over nvim dotfile..."
mkdir $OUTPUT_DIR/.config
cp -r .config/nvim $OUTPUT_DIR/.config

echo "Copying over tmux dotfile..."
cp tmux/.tmux.conf $OUTPUT_DIR

mkdir $OUTPUT_DIR/.logs

if [ ! -d "custom" ]; then
  echo "No custom directory found."
else
  echo "Copying over custom dotfiles"
  for file in custom/.*; do
    if [ -f "$file" ]; then
        cp "$file" $OUTPUT_DIR
    fi
  done
fi

./setup_scripts/gitconfig.sh
./setup_scripts/nvim.sh
