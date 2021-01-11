# dotfiles

Installs `pathogen` and below vim plugins as git submodules:

```ini
[submodule ".vim/bundle/nerdtree"]
	path = .vim/bundle/nerdtree
	url = https://github.com/preservim/nerdtree.git
[submodule ".vim/bundle/syntastic"]
	path = .vim/bundle/syntastic
	url = https://github.com/vim-syntastic/syntastic.git
[submodule ".vim/bundle/lightline.vim"]
	path = .vim/bundle/lightline.vim
	url = https://github.com/itchyny/lightline.vim
[submodule ".vim/bundle/bash-support.vim"]
	path = .vim/bundle/bash-support.vim
	url = https://github.com/vim-scripts/bash-support.vim.git
```

# Requirements

Repository expects you are running on RHEL family or Debian family OS.

# Installation

```bash
git clone https://github.com/yasarlaro/dotfiles.git
cd dotfiles
chmod +x install.sh && ./install.sh
```

# License
MIT

# Author
Onur Yasarlar
