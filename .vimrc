"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'

" You can specify revision/branch/tag.

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------


" NERDTree
let NERDChristmasTree=1
let NERDTreeMinimalUI=1
" single click opens directories
let NERDTreeMouseMode=2
let NERDTreeQuitOnOpen=1
if has("gui_running")
    let NERDTreeDirArrows=1
endif
map <silent> <C-Tab> :NERDTreeToggle %:p:h<CR>
autocmd BufEnter NERD_tree_* NERDTreeFind

" auto start NERDTree
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
