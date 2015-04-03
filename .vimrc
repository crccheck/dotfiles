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
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'tpope/vim-surround'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'davidhalter/jedi-vim'

" You can specify revision/branch/tag.

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------


" My Basic Config -----------------------------
set guifont=Monospace\ 8

set nowrap
set number
set relativenumber
set scrolloff=3

" added in Vim 7.3
if exists('+colorcolumn')
    set colorcolumn=79
endif

" highlight trailing whitespace
set list listchars=tab:▸-,trail:·,nbsp:·

" Don't make .swp files in the project
set backupdir=~/tmp,/var/tmp,/tmp

" Keyboard Shortcuts
" use <Tab> and <S-Tab> to indent/unindent in visual mode
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" use Ctrl Up/Down to shift a line up/down
map <C-Down> :m+<CR>
map <C-Up> :m-2<CR>


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
