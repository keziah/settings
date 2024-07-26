## settings
A copy of my bash/vim/git settings for sharing or for accessing on different computers.

# Installation steps
Instead of manually parsing through these files (some of which I no longer use), I
recommend using the generation script and looking at the output there.

To generate all the relevant dotfiles, run:

```
mkdir /tmp/dotfiles # Optional but suggested to avoid overwriting existing dotfiles
GITHUB_EMAIL=<github_email> OUTPUT_DIR=<dotfiles_output_dir) ./setup_scripts/generate.sh
```

I recommend testing out the generation script and outputting it to the /tmp/ directory
to verify that the results are correct for your needs.

# Manual steps
- If you are transfering from a computer that already has a similar setup, transfer over
your ~/.logs directory.

- Install Nord for your terminal client (https://github.com/nordtheme/iterm2)
- Install brew (https://brew.sh/)
- Install scmpuff (brew install scmpuff)
- Install ag (brew install ag)
- Install z (brew install z)
- Install watchman
- Install jq

## CLI Wizard
- Install tmux (brew install tmux)
- Install tpm (git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm)
- Install neovim (brew install neovim)
- Install vim-plug (https://github.com/junegunn/vim-plug)
- Install vim plugins via `:PlugInstall`

## Installing watchman on git repos
```bash
brew install watchman
cd /path/to/your/repo
cp $(brew --prefix git)/share/git-core/templates/hooks/fsmonitor-watchman.sample .git/hooks/query-watchman
git config core.fsmonitor .git/hooks/query-watchman
git config core.untrackedCache true
```bash

Optional:
- Install fuzzy search, fzf (brew install fzf)
- Install hstr (brew install hstr) and set export HISTFILE=~/.bash_history

# TODOs
- move nord installation to the platform folder
- Explain my most relevant shortcuts
