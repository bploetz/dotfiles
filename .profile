export GIT_PS1_SHOWDIRTYSTATE=1

if [ -f $(brew --prefix)/etc/bash_completion ]; then
 . $(brew --prefix)/etc/bash_completion
fi

# PROMPT
export PS1="\n\[\e[1;32m\][\u:\w\$(__git_ps1 ' \[\033[35m\](%s)\[\033[0m\]\[\e[1;32m\]')] \`echo -e '\xF0\x9f\x8d\xba'\` \[\e[m\] "

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

# Find and grep for a string in a directory (all files)
function fs() {
  if [ $# != 2 ]; then
    echo "Usage: fs <dir> <string>"
  else
    grep -r --color -n "$2" $1
  fi
}
