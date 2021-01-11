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

# Install prereq packages
if [ -f /etc/redhat-release ]; then
  sudo yum install vim curl git -y
elif [ -f /etc/lsb-release ]; then
  sudo apt install vim curl git -y
else
  echo "ERROR: Not supported operating system!"
  echo "Exiting..."
  exit 1
fi

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

