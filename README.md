# .dotfiles
Dot files for ZSH terminal setup with configurations for:
- ZSH plugins and aliases
- NeoVim
- Tmux

Note: setup only used in macos environment. Should work in linux environments fine.
## Dependencies
Dependencies can be installed using a package manager of your os:
- [Zsh](https://zsh.sourceforge.io/) - Z shell, v5.X
- [Zinit](https://github.com/ryanoasis/nerd-fonts) - a zsh plugin manager
- [Starship prompt](https://starship.rs/) -  cross shell prompt
- [Nerd fonts](https://github.com/junegunn/vim-plug): patched fonts
- [Neovim](https://neovim.io/) -  https://neovim.io/
- [vim-plug](https://github.com/junegunn/vim-plug) - vim plugin manager
- [Tmux](https://github.com/tmux/tmux/wiki) - terminal multiplexer
- [Tmux config template](https://github.com/gpakosz/.tmux): tmuxconfig template starter
- [TPM](https://github.com/tmux-plugins/tpm): Tmux package manager
- [Fasd](https://github.com/clvv/fasd) - fast directory and file navigation
- [Fzf](https://github.com/junegunn/fzf) - fuzzy finder
- [fd](https://github.com/sharkdp/fd) - find alternative
- [Exa](https://the.exa.website/) - fast ls replacement
- [Bat](https://github.com/sharkdp/bat) - cat improved
- [Stow](https://www.gnu.org/software/stow/manual/stow.html) - symlink manager
- [Ag](https://github.com/ggreer/the_silver_searcher) - ag the silver searcher
- [Lazygit](https://github.com/jesseduffield/lazygit) - lazygit terminal interface for git

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
3. Make sure zinit is installing zsh plugins (using alias `zinit-update`)
4. Make sure to install vim plugins after installing vim-plug by running `:PlugInstall` in nvim
5. Make sure to install tmux plugins using tpm (`Prefix + I`) it not done automatically
6. Reload your terminal

## Todo
- [x] Neovim LSP config setup
- [x] Better autocomplete configuration with nvim-compe
- [ ] Add Harpoon
- [ ] Use git worktrees workflow
- [x] neovim eslint using nvim-lint 
- [x] creating files and directories
- [x] Figure out using phpactor or intelephense for php
- [x] Fix vue highlight with tree sitter, bug with template highlighting
- [x] Add auto pair functionality for brackets
- [x] Add snippets support to work with nvim-cmp
- [ ] Working with search, quickfix lists 
- [ ] Create ansible playbook for installation
- [x] Configure nvim-cmp, results and context what snippets to load
- [x] lspsaga install and configuration (not using because unstable)
- [x] replace airline with lualine for better performance

## Resources
- [ThePrimeagen dotfiles](https://github.com/ThePrimeagen/.dotfiles)
- [Awsesome zsh plugins](https://github.com/unixorn/awesome-zsh-plugins)
- [Zsh users community plugins](https://github.com/zsh-users)
- [Prezto modules](https://github.com/sorin-ionescu/prezto/tree/master/modules)
- [Oh-my-zsh plugins](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins)
