execute pathogen#infect()
syntax on
filetype plugin indent on
set nocompatible      " We're running Vim, not Vi!

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set number
set cursorline

setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal autoindent

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Lighline plugin activation
if !has('gui_running')
  set t_Co=256
endif
set laststatus=2

" Python indentation
syntax on
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4
filetype plugin indent on
set autoindent

" Ruby indentation
syntax on
autocmd FileType ruby setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
filetype plugin indent on
set autoindent

" YAML indentation
syntax on
autocmd FileType yaml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
filetype plugin indent on
set autoindent

" Bash indentation
syntax on
autocmd FileType bash setlocal expandtab shiftwidth=2 tabstop=2
filetype plugin indent on
set autoindent


" auto indent by F7
map <F7> mzgg=G`z

" Paste mode on / off by F2
set pastetoggle=<F2>

" vimdiff coloring change
map <F6> :windo set syn=OFF<CR>

" Nerdtree open side menu by "ctrl-o"
map <C-o> :NERDTreeToggle<CR>

