
function! Copy()
  set listchars=
  set nonumber
endfunction

function! Paste()
  set paste
endfunction

command! Copy call Copy()
command! Paste call Paste()

highlight ColorColumn ctermbg=gray

noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>

if system('uname -s') == "Darwin\n"
  set clipboard=unnamed
else
  set clipboard=unnamedplus
endif
set colorcolumn=80
set expandtab
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:․
set list
set number
set shiftwidth=4
set tabstop=4
set wrap

syntax on
set background=light
" colorscheme solarized
filetype plugin indent on
