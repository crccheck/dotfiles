" My Basic Config -----------------------------
scriptencoding utf-8
set encoding=utf-8
set nowrap
set number
set scrolloff=3

" added in Vim 7.3
if exists('+colorcolumn')
  set relativenumber
  set colorcolumn=79
endif

" highlight trailing whitespace
set list listchars=tab:▸-,trail:·,nbsp:·

" file completion
set wildmode=longest,list

" Keyboard Shortcuts
" use <Tab> and <S-Tab> to indent/unindent in visual mode
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" use Ctrl Up/Down to shift a line up/down
map <C-Down> :m+<CR>
map <C-Up> :m-2<CR>
