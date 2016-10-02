set encoding=utf-8
" needed to run vundle (but i want this anyways)
set nocompatible

" vundle needs filtype plugins off
" i turn it on later
filetype plugin indent off
syntax off

" set the runtime path for vundle
set rtp+=~/.vim/bundle/Vundle.vim

" start vundle environment
call vundle#begin()


" list of plugins {{{2
" let Vundle manage Vundle (this is required)
Plugin 'gmarik/Vundle.vim'

" to install a plugin add it here and run :PluginInstall.
" to update the plugins run :PluginInstall! or :PluginUpdate
" to delete a plugin remove it here and run :PluginClean
"

Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/gitignore'
Plugin 'airblade/vim-gitgutter'
Plugin 'nvie/vim-flake8'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'

set updatetime=250
let mapleader = "\<Space>"

" add plugins before this
call vundle#end()

" now (after vundle finished) it is safe to turn filetype plugins on
syntax on
filetype plugin indent on
let python_highlight_all = 1


set autoread        " autoreload files when changed in disk
set hidden
set ignorecase
set smartcase
set incsearch       " incremental search
set number          " show line numbers
set showmatch
set showcmd

set tags=./tags,tags
set tags+=tags;/
map <f12> :!ctags -R --exclude=build .<cr>
map <Leader>C :!ctags -R --exclude=build .<cr>
map <f11> :!pysmell .<cr>

set wildmenu

set hls
set clipboard=unnamedplus
set directory-=.    " Don't store swapfiles
set list            " Show trailing whitespace
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
set listchars=tab:▸\ ,trail:▫
set scrolloff=5     " Show above/below lines while scrolling


" Breakpoints for python
au FileType python map <silent> <leader>b oimport ipdb; ipdb.set_trace()<esc>
au FileType python map <silent> <leader>B Oimport ipdb; ipdb.set_trace()<esc>
au FileType python map <silent> <leader>s :SyntasticToggleMode<esc>

nnoremap j gj
nnoremap k gk

map <silent> ñ :nohlsearch<CR>

cmap w!! w !sudo tee % >/dev/null


set omnifunc=pythoncomplete#Complete
" If you prefer the Omni-Completion tip window to close when a selection is
" " made, these lines close it on movement in insert mode or when leaving
" " insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
inoremap <Nul> <C-x><C-o>

let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
set foldmethod=indent
set foldlevel=99
set laststatus=2
set t_Co=256


"airline
let g:airline#theme             = 'powerlineish'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

nmap <C-t> :enew<cr>
imap <C-t> <Esc>:enew<cr>
nmap <tab> :bnext<CR>
nmap <S-tab> :bprevious<CR>
nmap <C-c> :bp <BAR> bd #<CR>
imap <C-c> <Esc>:bp <BAR> bd #<CR>

nmap <C-e> :lne<CR>

colorscheme desert
set cursorline
hi CursorLine term=none cterm=none ctermbg=235
hi CursorLineNr ctermbg=235

au BufRead,BufNewFile * setlocal tabstop=2 shiftwidth=2 expandtab softtabstop=2
au BufRead,BufNewFile *.py setlocal tabstop=4 shiftwidth=4 expandtab softtabstop=4
au BufRead,BufNewFile *.less setfiletype css

nmap <F8> :TagbarToggle<CR>

let g:syntastic_python_python_exec = '/usr/local/bin/python3'
let g:syntastic_python_checkers = ['pep8', 'flake8', 'pylint']
let g:syntastic_check_on_open = 0
let g:syntastic_python_pep8_args='--ignore=E501,E226'
let g:syntastic_python_flake8_args='--ignore=E501,E226'
let g:syntastic_always_populate_loc_list = 1
nmap <C-e> :lne<CR>

set mouse=a
set backspace=2 "
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
au FileType python match OverLength /\%121v.\+/
nnoremap <Leader>w :w<CR>

nnoremap <Leader>p :CtrlP<CR>
let g:ctrlp_use_caching = 0
set grepprg=ag\ --nogroup\ --nocolor

nnoremap <C-f> :YcmCompleter GoToReferences ""

let g:ctrlp_user_command = 'ag %s -l -g ""'

autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

nnoremap <Leader>] :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <Leader>[ :YcmCompleter GoToReferences<CR>

map q: :q

cnoreabbrev Ack Ack!
nnoremap <C-q> :Ack!<Space>
let g:ackprg = 'ag --vimgrep --smart-case'
let g:ack_autoclose = 1
let g:ackhighlight = 1
let g:ackpreview = 1
let g:ack_use_cword_for_empty_search = 1
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack
