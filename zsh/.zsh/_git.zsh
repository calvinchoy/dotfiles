# TODO: Refactor out to it can be used anywhere
# pretty line fullwidth
alias hr='$HOME/.dotfiles/zsh/.zsh/external/hr'

function headerBar() {
  echo -e -n "$(tput setaf 3)"
  hr '-'
  echo "$1"
  echo -e -n "$(tput setaf 3)"
  hr '-'
  echo -e -n "$(tput setaf 7)"
}
#----------------------------------------------------------------------------------------------------------------
# Basic git wrappers
#----------------------------------------------------------------------------------------------------------------
alias gpl="git pull"
alias gps="git push"
alias gst="git status"
alias gstu="lazygit"
alias gstl="lazygit"
alias gbls="git branch --sort=-committerdate"
alias gblsr="git branch -r --sort=-committerdate"
alias grls="git remote -v"
alias gcb="git checkout -b"
alias gz="cz"

# go back to git root diretory
function gr(){
  cd $(git rev-parse --show-toplevel)
}
alias ga="git add ."
alias gca="gitAddCommit"
function gitAddCommit() {
  git add .
  git commit -a
}

alias gza="gitCommitzenAdd"
function gitCommitzenAdd(){
  git add .
  git cz
}

alias gd="batdiff"
git-diff-with-abs-path() {
  gitpath=$(git rev-parse --show-toplevel) &&
  git diff --name-only --diff-filter=d "$@" | sed "s,^,$gitpath/,"
}
batdiff() {
  git-diff-with-abs-path | xargs bat --diff
}

#----------------------------------------------------------------------------------------------------------------
# Git logs
#----------------------------------------------------------------------------------------------------------------
GIT_LOG_FORMAT="%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"
alias gl="git-log"
function git-log() {
  git log --graph --pretty=format:$GIT_LOG_FORMAT --abbrev-commit
}
alias glf="git-log-file"
function git-log-file() {
  git log --follow --pretty=format:$GIT_LOG_FORMAT -- $1
}
alias gla="git-log-author"
function git-log-author() {
  git log --author="$1" --graph --pretty=format:$GIT_LOG_FORMAT --abbrev-commit
}

# Interactive git log using fzf
gli() {
  local filter
  if [ -n $@ ] && [ -f $@ ]; then
    filter="-- $@"
  fi

  git log \
    --graph --color=always --abbrev=7 --format='%C(auto)%h %an %C(blue)%s %C(yellow)%cr' $@ |
    fzf \
      --ansi --no-sort --reverse --tiebreak=index \
      --preview "f() { set -- \$(echo -- \$@ | grep -o '[a-f0-9]\{7\}'); [ \$# -eq 0 ] || git show --color=always \$1 $filter; }; f {}" \
      --bind "j:down,k:up,alt-j:preview-down,alt-k:preview-up,ctrl-f:preview-page-down,ctrl-b:preview-page-up,q:abort,ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
                FZF-EOF" \
      --preview-window=right:50% \
      --height 80%
}

#----------------------------------------------------------------------------------------------------------------
# GIT WORKTREE
#----------------------------------------------------------------------------------------------------------------
is-worktree()
{
  git rev-parse --is-inside-work-tree  
}
set-remotes(){
  git config --local --add remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
  git fetch origin
}

set-upstream(){
  currentBranch=$(git rev-parse --abbrev-ref HEAD)
  git branch --set-upstream-to=origin/$currentBranch $currentBranch 
}

alias gwa="git worktree add"
alias gwr="git worktree remove"
alias gwd="git worktree remove"
alias gwls="git worktree list"

#----------------------------------------------------------------------------------------------------------------
# FZF - Checkout branch
#----------------------------------------------------------------------------------------------------------------
fzf-git-branch() {
  git rev-parse HEAD >/dev/null 2>&1 || return
  git branch --color=always --all --sort=-committerdate |
    grep -v HEAD |
    fzf --height 80% --reverse --ansi --no-multi --preview-window right:50% \
      --preview 'git log -n 50 --color=always --date=short --pretty="format:%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit $(sed "s/.* //" <<< {})' |
    sed "s/.* //"
}

alias gb="fzf-git-checkout-branch"
alias gc="fzf-git-checkout-branch"
fzf-git-checkout-branch() {
  git rev-parse HEAD >/dev/null 2>&1 || return

  local branch

  branch=$(fzf-git-branch)
  if [[ "$branch" = "" ]]; then
    echo "No branch selected."
    return
  fi

  # If branch name starts with 'remotes/' then it is a remote branch. By
  # using --track and a remote branch name, it is the same as:
  # git checkout -b branchName --track origin/branchName
  if [[ "$branch" = 'remotes/'* ]]; then
    git checkout --track $branch
  else
    git checkout $branch
  fi
}


#----------------------------------------------------------------------------------------------------------------
# FZF - Checkout Tag
#----------------------------------------------------------------------------------------------------------------
alias gt="fzf-git-tag"
fzf-git-tag() {
  git rev-parse HEAD >/dev/null 2>&1 || return
  git --no-pager tag |
    grep -v HEAD |
    fzf --height 80% --reverse --ansi --no-multi --preview-window right:50% \
      --preview 'git log -n 50 --color=always --date=short --pretty="format:%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit $(sed "s/.* //" <<< {})' |
    sed "s/.* //"
}

alias gt="fzf-git-checkout-tag"
alias gct="fzf-git-checkout-tag"
fzf-git-checkout-tag() {
  git rev-parse HEAD >/dev/null 2>&1 || return
  local tag
  tag=$(fzf-git-tag)
  git checkout tags/$tag
}

alias fgd="fzf-git-diff"
fzf-git-diff() {
  # preview="git diff $@ --color=always -- {-1}"
  git diff $@ --name-only | fzf -m --ansi --preview 'bat --style numbers,changes,header,grid --color=always --diff {}'
}

#----------------------------------------------------------------------------------------------------------------
# Deleting branches
#----------------------------------------------------------------------------------------------------------------
# delete merged branches
function git-delete-branches() {
  echo "Are you sure? (y/n)"
  read REPLY
  if [ $REPLY = "y" ]; then
    git branch --merged | egrep -v "(^\*|master|main|dev|temp)" | xargs git branch -d
    git remote prune origin
  fi
}

# Fuzzy Branch Delete
alias gbd="fzf-git-delete-branches"
fzf-git-delete-branches() {
 local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" | fzf --multi --reverse  --preview-window right:50% \
      --preview 'git log -n 50 --color=always --date=short --pretty="%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit $(sed "s/.* //" <<< {})' |
    sed "s/.* //") &&
  git branch -D $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

#----------------------------------------------------------------------------------------------------------------
# Git revert and reset
#----------------------------------------------------------------------------------------------------------------
# diff current master with remote master -> what will be pushed
alias git-diff-origin="git diff master origin/master"
# diff staged changes with local master
alias git-diff-staged="git diff --cached"
# diff committed vs local master
alias git-diff-committed="git diff HEAD~ HEAD"
# undo staged files
alias git-unstage="git reset HEAD"
# git undo last commit (keeping changes)
alias git-uncommit="git reset HEAD~1"
# git reset to head removing changes
alias git-reset-hard="git reset --hard HEAD"
# git remove untracked files
alias git-clean="git clean -f -d"
# hard reset and clean bringin repo to sync to origin/master
function git-reset() {
  if [[ -z $(git status -s) ]]; then
    git-reset-hard
    git-clean
  else
    if [ "$1" = "-f" ]; then
      git-reset-hard
      git-clean
    else
      echo "⚠️  Uncommitted changes found.Reset aborted or use the -f flag"
      return 1
    fi
  fi
}
# git change last commit message
alias git-amend="git commit --amend"
# git unstage file (i.e. undo: git add wrongfile)
function git-unstage-file() {
  git reset HEAD $1
}
# untrack file / remove file from git. Add to gitignore probably?
function git-untrack-file() {
  git rm --cached $1
}
# untrack file / remove file from git. Add to gitignore probably?
function git-remove-file() {
  git rm --cached $1
}

#----------------------------------------------------------------------------------------------------------------
# Git utilities
#----------------------------------------------------------------------------------------------------------------
alias git-open-branches="git for-each-ref --format=' %(authorname) %09 %(refname)' --sort=authorname | grep 'origin'"

# Push to empty reomte repository
function git-init-remote() {
  git init
  git add .
  git commit -m "First commmit"
  git remote add origin $1
  git push -u origin master
}
# Check if there are changes
function git-has-changes() {
  if git diff-index --quiet HEAD --; then
    echo "$(tput setaf 7) $(tput setaf 7)"
  else
    echo "$(tput setaf 1)*$(tput setaf 7)"
  fi
}

# Get current branch
function getCurrentBranch() {
  git branch | grep \* | cut -d ' ' -f2
}

function getLastCommits(){
  git log --oneline -n $1
}

# Return repo branch and dirty state
function getGitStatus() {
  if [ -d "$1" ]; then
    curdir=$(pwd)
    cd $1
    dirname=${PWD##*/}
    line="                                     "
    printf "%s %s $(tput setaf 3)$(getCurrentBranch)$(tput setaf 7)($(git branch | wc -l | tr -d '[:space:]'))$(git-has-changes)$(tput setaf 7) $(getLastCommits 1) \n" $dirname "${line:${#dirname}}"
    if [ "$2" = "branches" ]; then
      gbls
    fi

    hr "-"
    cd $curdir
  fi
}

# Clear git locks
function git-clear-lock() {
  rm -f ./.git/index.lock
}

#----------------------------------------------------------------------------------------------------------------
# Locally ignore file tracking, but keep in repositorty. Usefull for WebAssets and Assets directory
#----------------------------------------------------------------------------------------------------------------
# ignore changes on tracked file
alias git-ignore-file="git update-index --assume-unchanged"
# ignore changes on tracked directory recursively
function git-ignore-folder() {
  git ls-files -z $1/ | xargs -0 git update-index --assume-unchanged
}
# undo ignore tracking file
alias git-unignore-file="git update-index --no-assume-unchanged"
# undo ignore tracking directory recursively
function git-unignore-folder() {
  git ls-files -z $1/ | xargs -0 git update-index --no-assume-unchanged
}
# list ignored files
alias git-list-ignored="git ls-files -v | grep '^[[:lower:]]'"


