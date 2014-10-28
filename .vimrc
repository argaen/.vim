syntax on
" set spell spelllang=en_us
let python_highlight_all = 1

set autoread        " autoreload files when changed in disk
set hidden          
set incsearch       " incremental search
set number          " show line numbers
set showmatch


set hls
set background=dark
set clipboard=unnamedplus
set directory-=.    " Don't store swapfiles
set list            " Show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set scrolloff=5     " Show above/below lines while scrolling
set mouse=a

map <C-p> :set paste<CR>
map <C-n> :set nopaste<CR>

nnoremap j gj
nnoremap k gk

map <silent> ñ :nohlsearch<CR>

cmap w!! w !sudo tee % >/dev/null


set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
set omnifunc=pythoncomplete#Complete
inoremap <Nul> <C-x><C-o>

let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
set foldmethod=indent
set foldlevel=99

filetype on
filetype plugin indent on

autocmd BufRead,BufNewFile * setlocal tabstop=4 shiftwidth=4 expandtab softtabstop=4
autocmd BufRead,BufNewFile *.js,*.php,*.css,*.html setlocal tabstop=2 shiftwidth=2 expandtab softtabstop=2

colorscheme delek
