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
  nnoremap <C-Left> :tabprevious<CR>
  nnoremap <C-Right> :tabnext<CR>

  vnoremap K :m '<-2<CR>gv=gv
  vnoremap J :m '>+1<CR>gv=gv

  " Git Shortcuts
  nnoremap <Leader>gg :Git add .<CR>:Git commit -a<CR>
  nnoremap <Leader>ga :Git add .<CR>
  nnoremap <Leader>gc :Git commit<CR>
  nnoremap <Leader>gs :Git status<CR>
  nnoremap <Leader>gl :Git log --oneline<CR>
  nnoremap <Leader>GG :!git push origin 

  vmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  " fzv
  nnoremap <Leader>ff :Files<CR> 
  nnoremap <Leader>fc :Commands<CR>
  nnoremap <Leader>fm :Maps<CR>
