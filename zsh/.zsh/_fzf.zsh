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

# fuzzy tmux session management
tm() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}

# fuzzy fasd
eval "$(fasd --init auto)"
alias d="fzf_fasd_d"
fzf_fasd_d() {
  local dir
  dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1 
}

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
  [[ -n "$files" ]] && nvim "${files[@]}"
}

#fzf bat
fbat() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && bat "${files[@]}"
}

# chrome bookmarks
bm() {
     bookmarks_path=~/Library/Application\ Support/Google/Chrome/Default/Bookmarks

     jq_script='
        def ancestors: while(. | length >= 2; del(.[-1,-2]));
        . as $in | paths(.url?) as $key | $in | getpath($key) | {name,url, path: [$key[0:-2] | ancestors as $a | $in | getpath($a) | .name?] | reverse | join("/") } | .path + "/" + .name + "\t" + .url'

    jq -r "$jq_script" < "$bookmarks_path" \
        | sed -E $'s/(.*)\t(.*)/\\1\t\x1b[36m\\2\x1b[m/g' \
        | fzf --ansi \
        | cut -d$'\t' -f2 \
        | xargs open
}
