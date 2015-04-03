" colorscheme inkpot-crc
set lines=60
set columns=110
" Remove the toolbar
set guioptions-=T

" Ctrl-S saves
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>
