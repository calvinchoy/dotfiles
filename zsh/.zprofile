# Default Editors
export VISUAL=nvim
export EDITOR=$VISUAL
export PAGER=less

# Locale setup
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

# BAT settings - https://github.com/sharkdp/bat
export BAT_THEME="base16"

# Less settings
# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

