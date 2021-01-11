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

