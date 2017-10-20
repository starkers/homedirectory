# First run

just call `./install` to install dotbot which will setup symlinks for you.

Please note that I symlink content from my keybase which will not be available to you



## nvim

When you first launch vim (aliased to neovim) it will need to install the plugins on first run
simply execute: `:PlugInstall`

This requires compiling of stuff like YouCompleteMe.. so ensure u have compile tools like cmake etc installed..

You can manually recompile YCM manually if needed with.. with:

```
cd ~/.local/share/nvim/plugged/YouCompleteMe
./install.py
```
