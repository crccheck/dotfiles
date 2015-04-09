" My Basic Config -----------------------------
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

" file completion
set wildmode=longest,list

" Keyboard Shortcuts
" use <Tab> and <S-Tab> to indent/unindent in visual mode
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" use Ctrl Up/Down to shift a line up/down
map <C-Down> :m+<CR>
map <C-Up> :m-2<CR>
