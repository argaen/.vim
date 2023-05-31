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


" list of plugins
" let Vundle manage Vundle (this is required)
Plugin 'gmarik/Vundle.vim'

" to install a plugin add it here and run :PluginInstall.
" to update the plugins run :PluginInstall! or :PluginUpdate
" to delete a plugin remove it here and run :PluginClean
"

Plugin 'bling/vim-airline'
Plugin 'pangloss/vim-javascript'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'mxw/vim-jsx'
Plugin 'majutsushi/tagbar'
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/gitignore'
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'nvie/vim-flake8'
Plugin 'mileszs/ack.vim'
Plugin 'shumphrey/fugitive-gitlab.vim'
Plugin 'tpope/vim-rhubarb'

let mapleader = "\<Space>"
map q: :q

set tags=./tags
set tags+=tags;/
map <Leader>C :!ctags -R --exclude=build --fields=+l .<cr>

" add plugins before this
call vundle#end()

" now (after vundle finished) it is safe to turn filetype plugins on
syntax on
filetype plugin indent on


set updatetime=250
set autoread        " autoreload files when changed in disk
set hidden
set ignorecase
set smartcase
set incsearch       " incremental search
set number          " show line numbers
set showmatch
set showcmd
set nofoldenable

set hls
set clipboard=unnamedplus
set directory-=.    " Don't store swapfiles
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
set listchars=tab:▸\ ,trail:▫
set scrolloff=5     " Show above/below lines while scrolling

" Breakpoints for python
au FileType python map <silent> <leader>b oimport ipdb; ipdb.set_trace()<esc>
au FileType python map <silent> <leader>B Oimport ipdb; ipdb.set_trace()<esc>

nnoremap j gj
nnoremap k gk

map <silent> ñ :nohlsearch<CR>

cmap w!! w !sudo tee % >/dev/null

set foldmethod=indent
set foldlevel=99

"airline
set laststatus=2
let g:airline#theme='powerlineish'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#branch#enabled=1

nmap <tab> :bnext<CR>
nmap <S-tab> :bprevious<CR>
nmap <C-c> :bp <BAR> bd #<CR>
imap <C-c> <Esc>:bp <BAR> bd #<CR>

map <Leader>j <Plug>(GitGutterNextHunk)
map <Leader>k <Plug>(GitGutterPrevHunk)

colorscheme desert
set cursorline
hi CursorLine term=none cterm=none ctermbg=235
hi CursorLineNr ctermbg=235

au BufRead,BufNewFile * setlocal tabstop=2 shiftwidth=2 expandtab softtabstop=2
au BufRead,BufNewFile *.php,*.py setlocal tabstop=4 shiftwidth=4 expandtab softtabstop=4
au BufRead,BufNewFile *.less setfiletype css

nmap <Leader>t :TagbarToggle<CR>

let g:syntastic_python_python_exec = '/usr/local/bin/python3'
let g:syntastic_python_checkers = ['pep8', 'flake8']
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_javascript_checkers = ['eslint',]
let g:syntastic_check_on_open = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 0

set backspace=2 "
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
nnoremap <Leader>w :w<CR>

function! g:FzfFilesSource()
  let l:base = fnamemodify(expand('%'), ':h:.:S')
  let l:proximity_sort_path = $HOME . '/.cargo/bin/proximity-sort'

  if base == '.'
    return 'rg --files'
  else
    return printf('rg --files | %s %s', l:proximity_sort_path, expand('%'))
  endif
endfunction

" ctrl p brings up the file finder
noremap <C-p> :call fzf#vim#files('', fzf#vim#with_preview({
      \ 'source': g:FzfFilesSource(),
      \ 'options': '--tiebreak=index'}))<CR>
let g:fzf_preview_window = ['right,50%', 'ctrl-/']

let g:ycm_auto_trigger=1
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <Leader>[ :YcmCompleter GoToReferences<CR>
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_tags_files = 1

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

cnoreabbrev Ack Ack!
nnoremap <C-v> :Ack!<Space>
let g:ackprg = 'ag --vimgrep --smart-case'
let g:ack_autoclose = 1
let g:ackhighlight = 1
let g:ack_use_cword_for_empty_search = 1
let g:ackhighlight = 1
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack
"Dynamic quickfix list size
au FileType qf call AdjustWindowHeight(3, 72)
function! AdjustWindowHeight(minheight, maxheight)
  let l = 1
  let n_lines = 0
  let w_width = winwidth(0)
  while l <= line('$')
    " number to float for division
    let l_len = strlen(getline(l)) + 0.0
    let line_width = l_len/w_width
    let n_lines += float2nr(ceil(line_width))
    let l += 1
  endw
  exe max([min([n_lines, a:maxheight]), a:minheight]) . "wincmd _"
endfunction

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

inoremap jk <Esc> :w<CR>
set synmaxcol=300

nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-l> :wincmd l<CR>
nmap <silent> <C-h> :wincmd h<CR>

let g:fugitive_gitlab_domains = ['https://gitlab.skyscannertools.net', 'https://git@git.prod.skyscanner.local']
nmap <leader>gh :Gbrowse<CR>
nmap <leader>gb :Gblame<CR>
let g:ycm_python_binary_path = 'python'
