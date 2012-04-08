export GIT_PS1_SHOWDIRTYSTATE=1

# PROMPT
export PS1="\n\[\e[1;32m\][\u:\w\$(__git_ps1 ' \[\033[35m\](%s)\[\033[0m\]\[\e[1;32m\]')]>\[\e[m\] "

# Terminal Window Title
echo -n -e "\033]0;\m/\007"

# ls colors
export LSCOLORS=gxfxcxdxbxegedabagacad

# aliases
alias ll="ls -alhFG"

# functions

# Find and grep for a string in a directory.
# $1: directory
# $2: string to find
# $3: file name match string (find -name parameter, i.e. "*.txt")
function ff() {
  if [ $# != 3 ]; then
    echo "Usage:  ff <dir> <filename pattern> <string>"
  else
    find $1 -name "$2" -print0 | xargs -0 grep --color -n "$3"
  fi
}
