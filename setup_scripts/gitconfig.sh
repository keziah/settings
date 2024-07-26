#!/bin/bash

if [[ -z "$GITHUB_EMAIL" ]]; then
  echo "The \$GITHUB_EMAIL environment variable is not set."
  exit 1
else
  echo "The \$GITHUB_EMAIL environment variable is set to $GITHUB_EMAIL."
fi

if [[ -z "$OUTPUT_DIR" ]]; then
  echo "The \$OUTPUT_DIR environment variable is not set."
  exit 1
else
  echo "The \$OUTPUT_DIR environment variable is set to $OUTPUT_DIR."
fi

cat <<EOF > $OUTPUT_DIR/.gitconfig
[push]
  default = current
[rerere]
  enabled = true
[core]
  precomposeunicode = true
  excludesfile = $HOME/.gitignore
  fileMode = false
[user]
  name = Keziah Plattner
  email = $GITHUB_EMAIL
[pull]
  ff = only
EOF

if [ -f "custom/.gitconfig" ]; then
  cat custom/.gitconfig >> $OUTPUT_DIR/.gitconfig
fi
