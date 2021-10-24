" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-signify'
Plug 'itchyny/vim-gitbranch'
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf.vim'
Plug 'edkolev/tmuxline.vim'

Plug 'sainnhe/gruvbox-material'
Plug 'Lilja/vim-chezmoi'

Plug 'https://github.com/ap/vim-css-color'

Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'taohexxx/lightline-buffer'

"Plug 'leafgarland/typescript-vim'
"Plug 'pbogut/fzf-mru.vim'

" LSP
if has("nvim-0.5")
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim'
    Plug 'nvim-telescope/telescope.nvim'
else
    " LSP
    Plug 'dense-analysis/ale'
endif

call plug#end()