# ---------------------------------------------------------------
# FZF settings
# ---------------------------------------------------------------
# Default FZF options
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--height=50%
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7'

# CTR + t - Only files: fd --type f
export FZF_CTRL_T_OPTS="--preview-window wrap --preview '
if [[ -f {} ]]; then
   bat --color \"always\" {} || (tput setaf 1; file --mime {})
elif [[ -d {} ]]; then
    exa --long --git --icons --tree -L 1 --group-directories-first --header --color=always -b -g {}
else;
    tput setaf 1; echo YOU ARE NOT SUPPOSED TO SEE THIS!
fi'"
export FZF_DEFAULT_COMMAND="fd --hidden --no-ignore"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# ALT + c, Fuzzy folder
export FZF_ALT_C_OPTS="--preview-window wrap --preview '
if [[ -f {} ]]; then
   bat --color \"always\" {} || (tput setaf 1; file --mime {})
elif [[ -d {} ]]; then
    exa --long --git --icons --tree -L 1 --group-directories-first --header --color=always -b -g {}
else;
    tput setaf 1; echo YOU ARE NOT SUPPOSED TO SEE THIS!
fi'"
export FZF_ALT_COMMAND="fd --type d"
export FZF_ALT_C_COMMAND="$FZF_ALT_COMMAND"

# ---------------------------------------------------------------
# Opening using fzf + editor
# ---------------------------------------------------------------
#fzf vscode
fcode() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && code "${files[@]}"
}

#fzf vim
fvim() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && vim "${files[@]}"
}

#fzf bat
fbat() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && bat "${files[@]}"
}
# fzf sublime https://www.sublimetext.com/docs/3/osx_command_line.html
fsub() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && subl "${files[@]}"
}