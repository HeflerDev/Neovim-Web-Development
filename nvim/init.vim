syntax on

set guicursor=
set noshowmatch
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
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
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" For lightline.vim
set laststatus=2

call plug#begin('~/.vim/plugged')
  " Utils
  Plug 'mattn/emmet-vim'
  Plug 'preservim/nerdcommenter'
  Plug 'dense-analysis/ale'
  Plug 'rafi/awesome-vim-colorschemes'
  Plug 'tpope/vim-fugitive'

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
  Plug 'junegunn/fzf.vim'

  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'hail2u/vim-css3-syntax'

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
  " ColorSchemes
  Plug 'dracula/vim'
  Plug 'altercation/vim-colors-solarized'
  Plug 'ParamagicDev/vim-medic_chalk'
  " Styling
  Plug 'yuezk/vim-js'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'ap/vim-css-color'
  Plug 'itchyny/lightline.vim'
  Plug 'frazrepo/vim-rainbow'
call plug#end()

source ./cocConfig.vim

" Key Mappings

  :let mapleader = "\<space>"
  " <CR> execute the command
  " Easy Switch Between Tabs
  nnoremap <Leader>h :wincmd h<CR>
  nnoremap <Leader>j :wincmd j<CR>
  nnoremap <Leader>k :wincmd k<CR>
  nnoremap <Leader>l :wincmd l<CR>
  " Easy Create new Tabs
  nnoremap <Leader>V :wincmd v<CR> :Ex<CR>
  nnoremap <Leader>H :wincmd s<CR> :Ex<CR>
  " Searching 
  nnoremap <Leader>S :%s/\<<C-r><C-w>\>/
  " Resizing
  nnoremap <Leader>+ :vertical resize +25<CR>
  nnoremap <Leader>- :vertical resize -25<CR>
  nnoremap <Leader>* :vertical resize +150<CR>
  nnoremap <Leader>/ :vertical resize -150<CR>
  " File 
  nnoremap <Leader>W :w<CR>
  nnoremap <Leader>E :Ex<CR>
  nnoremap <Leader>Q :q<CR>
  nnoremap <Leader>QQ :q!
  nnoremap <Leader>WE :w<CR> :Ex<CR>
  nnoremap <Leader>WQ :w<CR> :q<CR>

  nnoremap <Leader>F :vsp %/

  " Tab
  nnoremap <Leader>T :tabedit %<CR> :w<CR>:Ex<CR>
  nnoremap <C-\> :tabclose<CR>

  vnoremap K :m '<-2<CR>gv=gv
  vnoremap J :m '>+1<CR>gv=gv

  " Git Shortcuts
  nnoremap <Leader>gg :Git add .<CR>:Git commit -a<CR>
  nnoremap <Leader>ga :Git add .<CR>
  nnoremap <Leader>gc :Git commit<CR>
  nnoremap <Leader>gs :Git status<CR>
  nnoremap <Leader>gl :Git log --oneline<CR>
  nnoremap <Leader>GG :!git push origin 

" netrw config
  let g:netrw_banner = 0
"  let g:netrw_liststyle = 3
  let g:netrw_browse_split = 0
  let g:netrw_altv = 1
  let g:netrw_winsize = 50
  " augroup ProjectDrawer
  "  autocmd!
  "  autocmd VimEnter * :Vexplore
  " augroup END

  " fzv
  nnoremap <Leader>ff :Files<CR> 
  nnoremap <Leader>fc :Commands<CR>
  nnoremap <Leader>fm :Maps<CR>

syntax enable
colorscheme medic_chalk

" Emmet Config
let g:user_emmet_leader_key=','
" Rainbow Config
let g:rainbow_active = 1

" NVIM Terminal
  " open new split panes to right and below
  set splitright
  set splitbelow
  " turn terminal to normal mode with escape
  tnoremap <Esc> <C-\><C-n>
  " start terminal in insert mode
  au BufEnter * if &buftype == 'terminal' | :startinsert | endif
  " open terminal on ctrl+n
  function! OpenTerminal()
    split term://bash
    resize 10
  endfunction
  nnoremap <c-n> :call OpenTerminal()<CR>
