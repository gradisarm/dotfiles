# My dotfiles

## Installation

Clone the repo and move into the root directory.

Use stow on specific directories to place the config files in the correct locations on your machine.

Example:

```sh
stow nvim
```

This will create a symlink in `~/.config/nvim`.

## Dependencies

### Core (Required for Installation)

- **Git**: Duh obviously!
- **GNU Stow**: Manages symlinks.
- **Hack Nerd Font Mono**: Required for Kitty/Ghostty/Alacritty.

### Runtime (Required for Configs)

- **Nvim**: fzf, fd, rg, lazygit, tree-sitter-cli
- **Zsh**: fzf, zoxide, fnm zsh-autosuggestions, zsh-syntax-highlighting

## Zsh Plugins

### macOS

```sh
brew install zsh-autosuggestions zsh-syntax-highlighting
```

### Linux

Install zsh-autosuggestions:

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions \
  "${XDG_DATA_HOME:-$HOME/.local/share}/zsh/plugins/zsh-autosuggestions"
```

Install zsh-syntax-highlighting:

```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  "${XDG_DATA_HOME:-$HOME/.local/share}/zsh/plugins/zsh-syntax-highlighting"
```

Or just use distros package manager.

### Windows

Why do you hate yourself?

Install script will be added when I have time.
