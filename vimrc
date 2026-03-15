set nocompatible                        " Vim mode, not vi mode
filetype off                            " required

set rtp+=~/.vim/bundle/Vundle.vim       " set the runtime path to include 
call vundle#begin()                     " Vundle and initialize

Plugin 'gmarik/Vundle.vim'              " let Vundle manage Vundle, required

" Plugins
"Plugin 'nanotech/jellybeans.vim'        " Color scheme
Plugin 'vim-airline/vim-airline'        " Status bar & tabs
Plugin 'scrooloose/nerdtree'            " Tree explorer
Plugin 'kien/ctrlp.vim'                 " Fuzzy file, buffer, mru, ... finder
Plugin 'tmhedberg/SimpylFold'           " Simple, correct folding for Python
Plugin 'vim-scripts/indentpython.vim'   " Indentation script for python
"Bundle 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'        " Syntax checking
Plugin 'nvie/vim-flake8'                " Runs open file through Flake8
Plugin 'qpkorr/vim-bufkill'             " Delete buffer without closing window
Plugin 'ghifarit53/tokyonight-vim'      " Tokyonight colorscheme

call vundle#end()                       " required

filetype plugin indent on               " Enable automatic settings based on 
                                        " file type

syntax on                               " Enable color syntax highlighting
set laststatus=2                        " Display status bar at the bottom
set ruler                               " Display line and column number in 
                                        " status bar 
                                        
set number                              " Display the line numbers
set visualbell                          " Turn sounds off

set cursorline                          " Shows a horizontal highlight on the 
                                        " line with the cursor
                                
set hlsearch                            " Activate highlighting search pattern 
set incsearch                           " Activate incremental search 
set ignorecase                          " Activate case-insensitive search
set smartcase                           " Activate smart case search

set wildmenu                            " Set wildchar visual completion 
                                        " awesomeness

set wildmode=full                       " This is enhanced command line 
                                        " completion and it rocks

set encoding=utf-8

let mapleader = ","                     " Set a more convenient leader key on 
                                        " an AZERTY layout than the default \

set noerrorbells visualbell t_vb=       " Disable beep and flash 
autocmd GUIEnter * set visualbell t_vb=

set foldmethod=indent                   " Enable folding
set foldlevel=99

nnoremap <space> za                     " Enable folding with the spacebar

" Mappings
no <Up> <NOP>
no <Down> <NOP>
no <Left> <NOP>
no <Right> <NOP>

ino <Up> <NOP>
ino <Down> <NOP>
ino <Left> <NOP>
ino <Right> <NOP>

nnoremap <C-N> :NERDTreeToggle<CR>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
noremap <leader>l :ls<CR>:b<SPACE>
nnoremap <silent> <C-l> :nohl<CR><C-l>

" F5
imap <Esc>[15~ <Esc>:w<CR>:!clear;python %<CR>
noremap <Esc>[15~ <Esc>:w<CR>:!clear;python %<CR>

noremap <Esc>[1;3C :bn<CR>              " Alt-Left
noremap <Esc>[1;3D :bp<CR>              " Alt-Right

set termguicolors
colors tokyonight
highlight Comment guifg=#7a8a9a

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

" Airline options
let g:airline_powerline_fonts = 1
let g:Powerline_symbols="fancy"
let g:airline#extensions#tabline#enabled = 1

" NERDTree options
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1

" SymplyFold options
let g:SimpylFold_docstring_preview=1

" YouCompleteMe eoptions
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let python_highlight_all=1
