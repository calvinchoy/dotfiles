# ---------------------------------------------------------------
# Exa settings
# ---------------------------------------------------------------
export LS_COLORS="*.ts=34:*.vue=38;5;42:*.md=38;5;253:*.js=38;5;221:di=38;5;209"
export EXA_COLORS="ur=38;5;3;1:uw=38;5;5;1:ux=38;5;1;1:gr=38;5;249:gw=38;5;249:gx=38;5;249:tr=38;5;249:tw=38;5;249:tx=38;5;249:da=38;5;250:uu=38;5;109:gu=38;5;109:sn=38;5;250:sb=38;5;250"
export EXA_ICON_SPACING="1"
# ---------------------------------------------------------------
# EXA LS
# ---------------------------------------------------------------
alias lsg="exa-lsg"
function exa-lsg() {
  TREE_LEVEL=1
  if [ -n "$1" ]; then
    TREE_LEVEL=$1
  fi
  exa --icons --group-directories-first -b
}

alias ls="exa-lsl"
alias lsl="exa-lsl"
function exa-lsl() {
  TREE_LEVEL=1
  if [ -n "$1" ]; then
    TREE_LEVEL=$1
  fi
  exa --long --icons --tree -L $TREE_LEVEL --group-directories-first -b -g
}

alias lsd="exa-lsd"
function exa-lsd() {
  TREE_LEVEL=1
  if [ -n "$1" ]; then
    TREE_LEVEL=$1
  fi
  exa --long --icons --tree -L $TREE_LEVEL --group-directories-first -D -b -g
}

alias la="exa-lsa"
alias lsa="exa-lsa"
function exa-lsa() {
  TREE_LEVEL=1
  if [ -n "$1" ]; then
    TREE_LEVEL=$1
  fi
  exa --long --icons --tree -L $TREE_LEVEL --group-directories-first -a -b -g
}
