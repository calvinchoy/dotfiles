# .dotfiles
Dot files for ZSH terminal setup with configurations for:
- ZSH plugins and aliases
- NeoVim
- Tmux
## Dependencies
Dependencies can be installed using a package manager
- [Zsh](https://zsh.sourceforge.io/) - Z shell, v5.X
- [Zinit](https://github.com/ryanoasis/nerd-fonts) - a zsh plugin manager
- [Starship prompt](https://starship.rs/) -  cross shell prompt
- [Nerd fonts](https://github.com/junegunn/vim-plug): patched fonts
- [Neovim](https://neovim.io/) -  https://neovim.io/
- [vim-plug](https://github.com/junegunn/vim-plug) - vim plugin manager
- [Tmux]() - terminal multiplexer: https://github.com/tmux/tmux/wiki
- [Tmux config template](https://github.com/junegunn/vim-plug): tmuxconfig template starter
- [Fasd](https://github.com/clvv/fasd) - fast directory and file navigation
- [Fzf](https://github.com/junegunn/fzf) - fuzzt finder
- [Exa](https://the.exa.website/) - fast ls replacement
- [Bat](https://github.com/sharkdp/bat) - cat improved
- [Stow](https://www.gnu.org/software/stow/manual/stow.html) - symlink manager

## Installation
With the above dependencies installed
1. Clone this repository to your home directory into `.dotfiles`
2. Symlink the configurations into your home directory using `stow` inside the `.dotfiles` directory:

    ```sh
    # ~/.dotfiles
    stow zsh
    stow starship
    stow nvim
    stow tmux
    ```
3. Make sure to install vim plugins after installing vim-plug by running `:PlugInstall` in nvim
4. Reload your terminal

## Resources
- [ThePrimeagen dotfiles](https://github.com/ThePrimeagen/.dotfiles)
- [Awsesome zsh plugins](https://github.com/unixorn/awesome-zsh-plugins)
- [Zsh users community plugins](https://github.com/zsh-users)
- [Prezto modules](https://github.com/sorin-ionescu/prezto/tree/master/modules)
- [Oh-my-zsh plugins](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins)