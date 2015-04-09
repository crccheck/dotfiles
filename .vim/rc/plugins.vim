" CtrlP ---------------------------------------
" TODO g:ctrlp_user_command to filter files
" http://superuser.com/questions/649714/can-i-get-the-vim-ctrlp-plugin-to-ignore-a-specific-folder-in-one-project
let g:ctrlp_map = '<c-t>'


" NERDTree ------------------------------------
let NERDChristmasTree=1
let NERDTreeMinimalUI=1
" single click opens directories
let NERDTreeMouseMode=2
let NERDTreeQuitOnOpen=1
if has("gui_running")
    let NERDTreeDirArrows=1
endif
map <silent> <C-Tab> :NERDTreeToggle %:p:h<CR>
nnoremap <silent> <C-Tab> :NERDTreeToggle %:p:h<CR>
inoremap <silent> <C-Tab> :NERDTreeToggle %:p:h<CR>
onoremap <silent> <C-Tab> :NERDTreeToggle %:p:h<CR>
vnoremap <silent> <C-Tab> :NERDTreeToggle %:p:h<CR>
autocmd BufEnter NERD_tree_* NERDTreeFind
" auto start NERDTree
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p

