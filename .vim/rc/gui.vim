set guifont=Monospace\ 8

colorscheme inkpot-crc

set lines=60
set columns=110
" Remove the toolbar
set guioptions-=T

" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>
