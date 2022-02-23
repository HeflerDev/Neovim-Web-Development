syntax on

set guicursor=
set noshowmatch
" set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set linebreak
set ruler
set foldmethod=indent
set foldnestmax=1
set cursorline
set nu
set number
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8

" Install vim-plug if not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim autocmd!
    autocmd VimEnter * PlugInstall
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" For lightline.vim
set laststatus=2

call plug#begin('~/.vim/plugged')
  " Emmet for HTML & CSS
  Plug 'mattn/emmet-vim'
  " Comment Code
  Plug 'preservim/nerdcommenter'
  " Auto Linting
  Plug 'dense-analysis/ale'
  " Git Control
  Plug 'tpope/vim-fugitive'
  " File Finder
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
  Plug 'junegunn/fzf.vim'
  Plug 'ggreer/the_silver_searcher'
  Plug 'BurntSushi/ripgrep'

  " Php
  Plug 'SirVer/ultisnips' | Plug 'phux/vim-snippets'

  " Code Completion
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-java']
  " Styling
  Plug 'yuezk/vim-js'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'ap/vim-css-color'
  Plug 'itchyny/lightline.vim'
  Plug 'frazrepo/vim-rainbow'
  Plug 'ParamagicDev/vim-medic_chalk'
  " Color Library
  Plug 'rafi/awesome-vim-colorschemes'
call plug#end()

let g:nvim_config_root = stdpath('config')
let g:config_file_list = [
  \   'CocConfig.vim',
  \   'key-mappings.vim',
  \   'php_config.vim',
  \   'netrw_config.vim',
  \   'ui_color_and_theme_config.vim',
  \   'emmet_config.vim',
  \   'nvim_terminal_config.vim',
  \   'strftime_config.vim',
  \   'rainbow_config.vim'
  \ ]

for f in g:config_file_list
    execute 'source ' . g:nvim_config_root . '/' . f
endfor
