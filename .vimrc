syntax on
let python_highlight_all = 1

set autoread        " autoreload files when changed in disk
set hidden
set incsearch       " incremental search
set number          " show line numbers
set showmatch
set showcmd

set hls
set clipboard=unnamedplus
set directory-=.    " Don't store swapfiles
set list            " Show trailing whitespace
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
set listchars=tab:▸\ ,trail:▫
set scrolloff=5     " Show above/below lines while scrolling

map <C-p> :set paste<CR>
map <C-n> :set nopaste<CR>

nnoremap j gj
nnoremap k gk

map <silent> ñ :nohlsearch<CR>

cmap w!! w !sudo tee % >/dev/null


set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
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
nmap <C-t> :enew<cr>
nmap <tab> :bnext<CR>
nmap <S-tab> :bprevious<CR>
nmap <C-c> :bp <BAR> bd #<CR>

filetype on
filetype plugin indent on

au BufRead,BufNewFile * setlocal tabstop=4 shiftwidth=4 expandtab softtabstop=4
au BufRead,BufNewFile *.js,*.php,*.css,*.html setlocal tabstop=2 shiftwidth=2 expandtab softtabstop=2
au BufRead,BufNewFile *.less setfiletype css


execute pathogen#infect()
let g:syntastic_python_checkers = ['pep8', 'flake8']
let g:syntastic_check_on_open = 1
let g:syntastic_python_pep8_args='--ignore=E501'
let g:syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_always_populate_loc_list = 1
nmap <C-e> :lne<CR>

colorscheme desert
set cursorline
hi CursorLine term=bold cterm=bold ctermbg=8
hi CursorLineNr ctermbg=8
