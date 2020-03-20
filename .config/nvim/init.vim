call plug#begin('~/.local/share/nvim/plugged')

Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-signify'
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'taohexxx/lightline-buffer'
Plug 'itchyny/vim-gitbranch'
Plug 'Yggdroot/indentLine'
"Plug 'kaicataldo/material.vim'
"Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug '~/.config/fzf' " Load the fzf.vim plugin
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'edkolev/tmuxline.vim'

call plug#end()

if executable('tmux') && filereadable(expand('~/.zshrc')) && $TMUX !=# ''
  let g:vimIsInTmux = 1
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
else
  let g:vimIsInTmux = 0
endif

set encoding=UTF-8
set mouse=a

syntax enable

" Set the colour scheme
let g:material_theme_style = 'palenight'
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_material_background = 'soft'

set background=dark
colorscheme gruvbox-material

" Transparent background
highlight Normal guibg=none
highlight NonText guibg=none

" Turn on line numbering by default
set number 

" Turn on current line highlight
set cursorline

" Set some vars
let g:signify_vcs_list = [ 'git' ]
let g:signify_realtime = 1

" Setup airline
"       \ 'colorscheme': 'material_vim',
let g:lightline = {
      \ 'colorscheme' : 'gruvbox_material', 
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
      \              [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ [ 'bufferinfo' ],
      \		    [ 'separator' ],
      \	            [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
      \   'right': [ [ 'close' ], ],
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
      \     'buffercurrent': 'tabsel',
      \     'bufferbefore': 'raw',
      \     'bufferafter': 'raw',
      \ },
      \ 'component_expand': {
      \     'linter_checking': 'lightline#ale#checking',
      \     'linter_warnings': 'lightline#ale#warnings',
      \     'linter_errors': 'lightline#ale#errors',
      \     'linter_ok': 'lightline#ale#ok',
      \     'buffercurrent': 'lightline#buffer#buffercurrent',
      \	    'bufferbefore': 'lightline#buffer#bufferbefore',
      \     'bufferafter': 'lightline#buffer#bufferafter',
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
nnoremap <S-C-Left> :bprev<CR>
nnoremap <S-C-Right> :bnext<CR>

" Map :Files (fzf) to double space
let mapleader = " "
nnoremap <silent> <leader><Space> :Files<CR>
" :Files in the current open buffers folder
nnoremap <silent> <leader>- :Files <C-r>=expand("%:h")<CR>/<CR>
" List recently opened files
nnoremap <silent> <leader>m :FZFMru<CR>

if g:vimIsInTmux == 1
  let g:tmuxline_preset = {
        \'a'    : '#S',
        \'b'    : '%R',
        \'c'    : [ '#{sysstat_mem} #[fg=blue]\ufa51#{upload_speed}' ],
        \'win'  : [ '#I', '#W' ],
        \'cwin' : [ '#I', '#W', '#F' ],
        \'x'    : [ "#[fg=blue]#{download_speed} \uf6d9 #{sysstat_cpu}" ],
        \'y'    : [ '%a' ],
        \'z'    : '#H #{prefix_highlight}'
        \}
  let g:tmuxline_separators = {
        \ 'left' : "\ue0bc",
        \ 'left_alt': "\ue0bd",
        \ 'right' : "\ue0ba",
        \ 'right_alt' : "\ue0bd",
        \ 'space' : ' '}
endif
