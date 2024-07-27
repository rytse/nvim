# Neovim Configuration

To set up, first install neovim

```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
```

And add `PATH="$PATH:/opt/nvim-linux64/bin"` to `~/.zshrc`. Then clone this repo and the `packer` package manager 

```
git clone git@github.com:rytse/nvim.git ~/.config/nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

And install the appropriate language servers and tools

```
mamba install pynvim neovim pyright
cargo install ripgrep
npm install -g neovim
rustup component add rust-analyzer
sudo apt install xclip fzf clangd-12
```

Then open `nvim` and run `:PackerSync` and `:Copilot setup`. You can make sure everything is set up properly by closing and reopening neovim and running `:checkhealth`.
