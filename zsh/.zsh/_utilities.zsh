# ---------------------------------------------------------------
# General
# ---------------------------------------------------------------
alias cl="clear"
alias szsh='exec zsh'
alias rmd="rm -rf"
alias v="nvim"
alias vd="nvim ."
alias b="bat"
alias npr="npm run"

update-zinit(){
  echo "Updating and cleaning up zinit modules"
  zinit self-update
  zinit update
  zinit delete --clean yes
}

function countFiles(){
    find . -name "*.$1" | wc -l
}

# ---------------------------------------------------------------
# Dotenv inits
# ---------------------------------------------------------------
function pynit(){
  python3 -m venv .
  source bin/activate
}

function envinit(){
  echo dotenv > .envrc && touch .env  && direnv allow
}

function venvinit(){
  echo "layout_python3" > .envrc && direnv allow
}

# ---------------------------------------------------------------
# tmux & tmuxinator
# ---------------------------------------------------------------
alias stm="tmux source-file ~/.tmux.conf"
alias tma="tmux attach -t"
alias tmls="tmux list-sessions"
alias tmka="tmux kill-server"

function tmrn(){
    tmux select-pane -T $1
}

function tmk(){
  tmux kill-session -t $1
}

# ---------------------------------------------------------------
# NPM
# ---------------------------------------------------------------
function npmls() {
  npm list --depth=0
}

function npmlsg() {
  npm list -g --dept=0
}

# ---------------------------------------------------------------
# Archiving
# ---------------------------------------------------------------
# extract tar
alias tarx="tar -xzvf"
# compress tar
alias tarc="tar -czvf"

# ---------------------------------------------------------------
# Networking and remotes
# ---------------------------------------------------------------
# generate new rsa key
alias generateKey="ssh-keygen -t rsa -C"

function getIp() {
  temp=$(ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p' | head -n 1)
  echo "$temp"
}

# ---------------------------------------------------------------
# File & Searching
# ---------------------------------------------------------------
# grep --include=\*.{c,h} -rnw '/path/to/somewhere/' -e "pattern"
# grep --exclude=*.o -rnw '/path/to/somewhere/' -e "pattern"
# grep --exclude-dir={dir1,dir2,*.dst} -rnw '/path/to/somewhere/' -e "pattern"

# GREP search string in directory
function grepdir() {
  grep -rn '.' -e "$1"
}

# find recently modified files in directory - Expects 2 params: directory, days
function findModified() {
  find $1 -type f -mtime -$2
}

function findfile() {
  find . -print | grep -i $1
}

function findProcessByPort() {
  lsof -i tcp:$1
}

function killProcessByPort() {
  lsof -ti tcp:$1 | xargs kill
}

# ---------------------------------------------------------------
# Dates
# ---------------------------------------------------------------
alias curday="curDay"
alias currenntDay="curDay"

function curDay() {
  echo $(date +%j)
}
# ---------------------------------------------------------------
# Misc
# ---------------------------------------------------------------
# print octal permission for given file
function oct() {
  perl -e 'printf "%o\n", (stat shift)[2]&07777' $1
}

#random
function random1() {
  shuf -i 0-9 -n 1
}

function random2() {
  shuf -i 00-99 -n 1
}

function random3() {
  shuf -i 000-999 -n 1
}

function encodeBase64(){
  openssl base64 -in $1
}
