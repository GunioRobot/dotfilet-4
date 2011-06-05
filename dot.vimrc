" First, set up Vundle (see https://github.com/gmarik/vundle)

" === Vundle
set nocompatible " Use extended functions of Vim.
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Vim Scripts repos (http://vim-scripts.org/vim/scripts.html)
Bundle 'AutoComplPop'
Bundle 'rails.vim'
Bundle 'surround.vim'

" === File types
filetype indent on " Indent depends on file type.
filetype plugin on " Valid plugin.

" === Character codes
set encoding=utf-8                      " Default.
set fileencodings=utf-8,eucjp,iso2022jp " Select automatically.

" === Plugins
" RSense
let g:rsenseHome="/opt/rsense-0.3/"

" matchit
let b:match_words="<begin>:<end>"

" === Space Characters
set tabstop=2    " Tab width.
set shiftwidth=2 " Shift width.
set expandtab    " Insert half space instead of tab.

" === Statuses
set laststatus=2 " Display status line always.
set showcmd      " Show inputting command to status line.

" Display character code and break to status line.
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" === Searchings
set incsearch                  " Incremental search.
set ignorecase                 " Ignore case.

" Find project.
map fp :!grep -r --exclude-dir=log --exclude-dir=tmp --color=auto

" Ruby
map fd :RSenseJumpToDefinition " Find Definition.

" ===  Movings
map bf :e # " Back to previous File
map bc `'   " Back to previous jumped Cursor

" === Highlights
syntax on    " Enable highlights.
set hlsearch " Highlight searched strings.

" Highlight double-byte space.
highlight ZenkakuSpace ctermbg=white
match ZenkakuSpace /　/

" === Command Line
" Emacs-like movings
:cnoremap <C-A> <Home>
:cnoremap <C-B> <Left>
:cnoremap <C-D> <Delete>
:cnoremap <C-F> <Right>
:cnoremap <C-K> <Delete>

" === Others
set nu           " Display line numbers.
set showmatch    " Show bracket pair.
set hid          " Buffer switchable with not-saved buffers.
set scroll=1     " Set scroll number of ^u and ^d.
set noswapfile   " Make no swap file.

" * Attension: '^[' is inputtable as typing '^V ['.
map co 0i#j     " Comment Out and move to next line.
map hco 0i-#j   " Haml Comment Out and move to next line.

set ambiwidth=double

" Rename file
" Usage: On file you want to change, type :Rename [new_file_name]
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))|w
