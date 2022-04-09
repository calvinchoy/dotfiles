# ---------------------------------------------------------------
# Zinit
# ---------------------------------------------------------------
# Keep using emacs style keybinding (ctrl+a/e in tmux)
bindkey -e

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
# ---------------------------------------------------------------
# Zinit Plugins
# ---------------------------------------------------------------
# basics
zinit wait lucid for \
  zdharma-continuum/fast-syntax-highlighting \
  zsh-users/zsh-history-substring-search \
  zsh-users/zsh-autosuggestions \
  zsh-users/zsh-completions \
  urbainvaes/fzf-marks \
  lukechilds/zsh-nvm \
  #.zsh local extensions and aliases
  zinit snippet ~/.zsh/init.zsh


# ---------------------------------------------------------------
# ZSH settings
# ---------------------------------------------------------------
# Smart URLs
autoload -Uz is-at-least
if [[ ${ZSH_VERSION} != 5.1.1 && ${TERM} != "dumb" ]]; then
  if is-at-least 5.2; then
    autoload -Uz bracketed-paste-url-magic
    zle -N bracketed-paste bracketed-paste-url-magic
  elif is-at-least 5.1; then
    autoload -Uz bracketed-paste-magic
    zle -N bracketed-paste bracketed-paste-magic
  fi
  autoload -Uz url-quote-magic
  zle -N self-insert url-quote-magic
fi

# General
setopt COMBINING_CHARS      # Combine zero-length punctuation characters (accents),  with the base character.
setopt INTERACTIVE_COMMENTS # Enable comments in interactive shell.
setopt RC_QUOTES            # Allow 'Henry''s Garage' instead of 'Henry'\''s Garage'.
unsetopt MAIL_WARNING       # Don't print a warning message if a mail file has been accessed.

# Allow mapping Ctrl+S and Ctrl+Q shortcuts
[[ -r ${TTY:-} && -w ${TTY:-} && $+commands[stty] == 1 ]] && stty -ixon <$TTY >$TTY

# Jobs
setopt LONG_LIST_JOBS     # List jobs in the long format by default.
setopt AUTO_RESUME        # Attempt to resume existing job before creating a new process.
setopt NOTIFY             # Report status of background jobs immediately.
unsetopt BG_NICE          # Don't run all background jobs at a lower priority.
unsetopt HUP              # Don't kill jobs on shell exit.
unsetopt CHECK_JOBS       # Don't report on jobs when shell exit.

# disable auto correct
unsetopt correct_all
unsetopt correct
DISABLE_CORRECTION="true"

# directory
setopt AUTO_CD              # Auto changes to a directory without typing cd.
setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
setopt PUSHD_TO_HOME        # Push to home directory when no argument is given.
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt MULTIOS              # Write to multiple descriptors.
setopt EXTENDED_GLOB        # Use extended globbing syntax.
unsetopt CLOBBER            # Do not overwrite existing files with > and >>. Use >! and >>! to bypass.

# Disable git checkout autocompletion slowing down command
zstyle :completion::complete:git-checkout:argument-rest:headrefs command "git for-each-ref --format='%(refname)' refs/heads 2>/dev/null"

# ---------------------------------------------------------------
# Hooks and environment settings
# ---------------------------------------------------------------
# Starship prompt setup - ~/.config/starship.toml
eval "$(starship init zsh)"
# direnv - https://direnv.net/
eval "$(direnv hook zsh)"
# aws completer  - https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html
# complete -C '/usr/local/bin/aws_completer' aws
