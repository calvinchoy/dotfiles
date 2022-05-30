# .dotfiles
Dot files for ZSH terminal setup with configurations for:
- ZSH plugins and aliases
- NeoVim
- Tmux

## Installation macos/linux
Note: dependencies can be installed using a package manager of your os:

### Dependencies
- [Zsh](https://zsh.sourceforge.io/) - Z shell, v5.X
  - Plugin overview in .zshrc zinit section
- [Zinit](https://github.com/zdharma-continuum/zinit) - a zsh plugin manager
- [Starship prompt](https://starship.rs/) -  cross shell prompt
- [Nerd fonts](https://www.nerdfonts.com/): patched fonts
- [Neovim](https://neovim.io/) -  https://neovim.io/
- [packer.nvim](https://github.com/wbthomason/packer.nvim) - packer.nvim
  - Plugins overview in plugins.lua file
- [Tmux](https://github.com/tmux/tmux/wiki) - terminal multiplexer
  - Plugins overview in tmux.conf.local tpm section
- [Tmux config template](https://github.com/gpakosz/.tmux): tmuxconfig template starter
- [TPM](https://github.com/tmux-plugins/tpm): Tmux package manager
- [Fasd](https://github.com/clvv/fasd) - fast directory and file navigation
- [zoxide](https://github.com/ajeetdsouza/zoxide) - maybe a better alternative for fasd as cd alternative
- [Fzf](https://github.com/junegunn/fzf) - fuzzy finder
- [fd](https://github.com/sharkdp/fd) - find alternative
- [Exa](https://the.exa.website/) - fast ls replacement
- [Bat](https://github.com/sharkdp/bat) - cat improved
- [Stow](https://www.gnu.org/software/stow/manual/stow.html) - symlink manager
- [Ag](https://github.com/ggreer/the_silver_searcher) - ag the silver searcher
- [Lazygit](https://github.com/jesseduffield/lazygit) - lazygit terminal interface for git

## Installation MacOS (linux) - Manual
With the above dependencies installed
1. Clone this repository to your home directory into `.dotfiles`
2. Symlink the configurations into your home directory using `stow` inside the `.dotfiles` directory:

Note: Stow is used to manage aliasing/symlinking dotfiles, stow what you want to use

    ```sh
    # ~/.dotfiles
    stow zsh
    stow starship
    stow nvim
    stow tmux
    ```
3. Make sure zinit is installing zsh plugins (using alias `zinit-update`)
5. Make sure to install tmux plugins using tpm (`Prefix + I`) if not done automatically
6. Reload your terminal

## Installation MacOS Ansible playbook - Automated provisioning
You have to have the ansible binary installed. You can install this using pip install ansible.
The playbook currenly assume that you don't have any existing setup of any of these tools installed already.

    ```sh
    ansible-playbook playbook_macos-terminal-setup.yml
    ```

## Installation windows powershell
Note: You can use WSL2 with for example ubuntu, but performance is slow. 
Resource: [devaslife](https://www.youtube.com/watch?v=5-aK2_WwrmM)

### Dependencies
- Powershell, 7.2.1 as of writing
- Windows Terminal
- scoop, package manager
- chocolatey, package manager
- neovim + check treesitter windows guide top install gcc
- z, fuzzy navigation like fasd
- Nerd fonts, I use Jetbrains Mono font
- Colortheme, i use tokyonight storm
- Terminal-Icons module
- Fzf and PSFzf module

### Config and setup
1. Update appearance of Widows Terminal (font, transparancy, theme in settings json)
2. Install dependencies using Scoop, chocolatey and PS Modules
3. Reconfigure nvim default config path to align with linux:
```
setx /M XDG_CONFIG_HOME "%USERPROFILE%\\.config”
```
4. Use symlinks to link dot files to your .config folder:
```
new-item -itemtype symboliclink -path . -name FakeFolder -value f:\driver\RealFolder
```
5. Install and activate terminal icons:
```
Install-Module -Name Terminal-Icons -Repository PSGallery --Force
Import-Module Terminal-Icons

```
6. Install and setup fzf and readline module:
```
scoop install fzf
Install-Module -Name PSFzf -Scope CurrentUser -Force
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r’
```
7. Make sure to execute your `.config/powershell/user_profile.ps1` in `$PROFILE.CurrentUserCurrentHost`:
```
. $env:USERPROFILE\.config\powershell.user_profile.ps1
```

## Some neovim personal mappings
- Harpoon 4 indexes are mappt to <leader>1, <leader>2, <leader>3 and <leader>4. Harpoon menu is mapped to M-h
- File and code navigations (using telescope) are mapped modifiers + p combinations: C-p (fuzzy project files), M-p (navigate by symbols), S-p (toggle preview in telescope)
- Terminals are mapped to C-t and can be browser using telescope using <leader>ft
- Lazygit terminal is mapped to <leader> g

## Todo
- [x] Neovim LSP config setup
- [x] Better autocomplete configuration with nvim-cmp
- [x] Setup Harpoon
- [x] Use git worktrees workflow
- [x] creating files and directories
- [x] Figure out using phpactor or intelephense for php
- [x] Fix vue highlight with tree sitter, bug with template highlighting
- [x] Add auto pair functionality for brackets
- [x] Add snippets support to work with nvim-cmp
- [x] Working with search, quickfix lists 
- [x] Create ansible playbook for installation
- [x] Configure nvim-cmp, results and context what snippets to load
- [x] replace airline with lualine for better performance
- [x] create workable powershell neovim setup with fzf and z navigation
- [x] Create telescope picker for dotfiles
- [x] Add git blame plugin
- [x] Replace vim-plug with packer
- [x] Add Neogen for docs scaffolds
- [ ] Improve performance by reducing amount of plugins, lazyloading in packer etc.
- [ ] Add which key plugin to see overview of keymappings
- [ ] Migrate init.vim to full lua
- [ ] lua, telescope plugin creation
- [x] Improve faster fuzzy search with telescope, fg sometimes hangs, use regular grep and QL
- [ ] Using QL and cdo patterns, vimgrep and grep
- [ ] Update playbook to auto install fonts
- [ ] Proper formatting using null-ls or Neoformat
- [ ] Python Setup
- [ ] Golang Setup

## Notes
- zsh setup uses zinit for package management.
- Not using prezto oh oh-my-zsh to reduce bloat.
- If you are using nvm, make sure to lazy load it. Will improve zsh startuptime.

## Resources
- [Awsesome zsh plugins](https://github.com/unixorn/awesome-zsh-plugins)
- [Zsh users community plugins](https://github.com/zsh-users)
- [Awesome rust tools](https://github.com/unpluggedcoder/awesome-rust-tools)
- [Awesome neovim](https://github.com/rockerBOO/awesome-neovim)
- [Prezto modules](https://github.com/sorin-ionescu/prezto/tree/master/modules)
- [Oh-my-zsh plugins](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins)
