"pathogen
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags() "call this when installing new plugins
filetype plugin on
filetype plugin indent on
set nocompatible " sets to vim not vi
set number " show line numbers
hi LineNr term=bold cterm=NONE ctermfg=LightGrey ctermbg=NONE gui=NONE guifg=LightGrey guibg=NONE
nnoremap <F2> :set nonumber!<CR>
set showmode " always show the current mode
set softtabstop=4
set shiftwidth=4
set expandtab
set ttyfast
if has("syntax")
      syntax on
  endif
