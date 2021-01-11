#!/bin/bash - 
#===============================================================================
#
#          FILE: install.sh
# 
#         USAGE: ./install.sh 
# 
#   DESCRIPTION: Creates ~/.vim directory and install plugins with pathogen
# 
#       OPTIONS: N/A
#  REQUIREMENTS: N/A
#          BUGS: N/A
#         NOTES: N/A
#        AUTHOR: Onur Yasarlar 
#  ORGANIZATION: N/A
#       CREATED: 11/01/21 13:17
#      REVISION: 11/01/21 14:00
#===============================================================================

set -o nounset                              # Treat unset variables as an error
DATE=$(date +%Y%m%d%H%M)

function message {
  if [ $# -eq 2 ]; then
    case "$1" in
      INFO | WARNING) MESSAGE="\033[1;33m$1: \033[0m$2";;
      FAIL | ERROR)   MESSAGE="\033[0;31m$1: \033[0m$2";;
      SUCCESS)        MESSAGE="\033[0;32m$1: \033[0m$2";;
      *)              MESSAGE="$1: $2";;
    esac
    echo -en "${MESSAGE}"
  else
    echo "\033[0;31mError: Invalid number of arguments.\033[0m"
    exit 1
  fi
}

function wait_for_process {
  while [ -d /proc/$1 ]
  do
    printf "."
    sleep 1
  done
  echo ""
}

# Install prereq packages
message INFO "Installing prereq packages"
if [ -f /etc/redhat-release ]; then
  sudo yum install vim curl git -y %> /dev/null &
elif [ -f /etc/lsb-release ]; then
  sudo apt install vim curl git -y %> /dev/null &
else
  message ERROR "Not supported operating system!"
  message ERROR "Exiting!"
  exit 1
fi
PID=$!
wait_for_process ${PID}


# Initialize submodules
message INFO "Initializing vim plugins"
git submodule update --init --recursive &> /dev/null &
PID=$!
wait_for_process ${PID}

# Copy existing .vim and .vimrc file
if [ -f ~/.vimrc ]; then
  mv ~/.vimrc ~/.vimrc_${DATE}
fi

if [ -d ~/.vim ]; then
  mv ~/.vim ~/.vim_${DATE}
fi

# Move files
mkdir ~/.vim
cp -r .vim/* ~/.vim/
cp .vimrc ~/.vimrc

# Get latest pathogen file
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim &> /dev/null

message SUCCESS "Installation completed."