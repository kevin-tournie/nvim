# Neovim configuration

## What you need

Before using this neovim configuration, you need somes tools to be installed

### npm (via Node here)
npm is used by `Mason` to install some language servers like `tsserver`, `cssls` and formatters like `prettier`

 - go to https://nodejs.org/en and download Node LTS
 - extract the archive in /opt directory with `sudo tar -xvf <your-downloaded-file> -C /opt`
 - add node to your PATH by edting your .bashrc for example : `export PATH="$PATH:/opt/node-v20.16.0-linux-x64/bin"`
 - don't forget to `source` the file

### gcc, make, cmake

`telescope-fzf-native` needs to build fzf when you install it. Make sure that `make`, `cmake` and `gcc` are installed on your machine.
Follow this documentation if necessary https://github.com/nvim-telescope/telescope-fzf-native.nvim

## Installation
First, install neovim by following this documentation https://github.com/neovim/neovim/blob/master/INSTALL.md#linux

Then, you can install this configuration with `git clone https://github.com/kevin-tournie/nvim.git` in `~/.config` directory.
