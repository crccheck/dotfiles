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

" Easier includes
"
" https://raw.githubusercontent.com/Shougo/shougo-s-github/master/vim/vimrc
function! s:source_rc(path)
  execute 'source' fnameescape(expand('~/.vim/rc/' . a:path))
endfunction


" Don't make .swp files in the project
set backupdir=~/tmp,/var/tmp,/tmp


call s:source_rc('mine.vim')
call s:source_rc('plugins.vim')

if has('gui_running')
  call s:source_rc('gui.vim')
endif
