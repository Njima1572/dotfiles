#!/bin/bash
THIS_DIR=$PWD

# ===== Setup Git {{{
# Check if git exists
if ! command -v git &> /dev/null
  # Install git
fi
if [ -f ".gitconfig" ]; then
  echo "Found existing .gitconfig, moving to .gitconfig.bk"
  mv .gitconfig .gitconfig.bk
fi
ln $THIS_DIR/.gitconfig

# }}}
# ===== Setup fish {{{
./$THIS_DIR/.config/fish/setup
# }}}
# ===== Setup nvim  {{{
./$THIS_DIR/.config/nvim/setup
# }}}
# ===== Setup Alacritty {{{

# }}}
# ===== Setup bin  {{{
export PATH=$PWD/bin:$PATH
# }}}
# ===== Setup VSCode {{{

# }}}
