## settings
A copy of my bash/vim/git settings for sharing or for accessing on different computers.

A lot of these files I borrowed from other people, and they are a mix of settings from different computers I use (the remote Unix
clusters at my school, for instance, have a different settings file than my personal laptop) so they probably need some parsing
before anyone can use them.

# Installation steps
To generate all the relevant dotfiles, run:

```
GITHUB_EMAIL=<github_email> OUTPUT_DIR=<dotfiles output) ./setup_scripts/generate.sh
```

I recommend testing out the generation script and outputting it to the /tmp/ directory
to verify that the results are correct for your needs.

# Manual steps
- Install Nord for your terminal client
- Install watchman

# TODOs
- move nord installation to the platform folder
