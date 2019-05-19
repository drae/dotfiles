call plug#begin('~/.local/share/nvim/plugged')

Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-signify'
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'itchyny/vim-gitbranch'
Plug 'arcticicestudio/nord-vim'
Plug 'Yggdroot/indentLine'


call plug#end()

set termguicolors
set encoding=UTF-8

syntax enable

" Set the colour scheme
set background=dark
colorscheme nord

" Turn on line numbering by default
set number 

" Turn on current line highlight
set cursorline

" Set some vars
let g:signify_vcs_list = [ 'git' ]
let g:signify_realtime = 1

" Setup airline
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
      \              [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ [ 'buffers' ] ],
      \   'right': [ [ 'close' ] ],
      \ },
      \ 'component': {
      \   'separator': '',
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name',
      \   'bufferinfo': 'lightline#buffer#bufferinfo',
      \ },
      \ 'component_type': {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \     'buffers': 'tabsel',
      \ },
      \ 'component_expand': {
      \     'linter_checking': 'lightline#ale#checking',
      \     'linter_warnings': 'lightline#ale#warnings',
      \     'linter_errors': 'lightline#ale#errors',
      \     'linter_ok': 'lightline#ale#ok',
      \     'buffers': 'lightline#bufferline#buffers',
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
\ }

let g:lightline#ale#indicator_checking = "\uf110 "
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_ok = "\uf00c "

set hidden  " allow buffer switching without saving
set showtabline=2  " always show tabline

" remap arrow keys
nnoremap <Left> :bprev<CR>
nnoremap <Right> :bnext<CR>

" Nord config

let g:nord_cursor_line_number_background = 1

