#!/bin/bash
#
if [ -f "custom/init.vim" ]; then
  cat custom/init.vim >> $OUTPUT_DIR/.config/nvim/init.vim
fi
