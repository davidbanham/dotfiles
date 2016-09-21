" Vundle vimrc
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
let g:ycm_confirm_extra_conf = 0 

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'ternjs/tern_for_vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'digitaltoad/vim-jade'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'suan/vim-instant-markdown'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-obsession'
Plugin 'shime/vim-livedown'
Plugin 'Raimondi/vim-yaml'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'lambdatoast/elm.vim'
Plugin 'fatih/vim-go'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/syntastic'
" End configuration, makes the plugins available
call vundle#end()
filetype plugin indent on

let g:livedown_autorun = 1
let g:livedown_open = 1
let g:livedown_port = 1337

set number " show line numbers
hi LineNr term=bold cterm=NONE ctermfg=LightGrey ctermbg=NONE gui=NONE guifg=LightGrey guibg=NONE
nnoremap <F2> :set nonumber!<CR>
set showmode " always show the current mode
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
autocmd FileType coffee
	\ setlocal expandtab
set ttyfast
if has("syntax")
      syntax on
  endif
set pastetoggle=<F3>
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
if has('mac')
	set listchars=tab:▸\ ,eol:¬
	set list
endif

" Tell vim to remember certain things when we exit
" '10 : marks will be remembered for up to 10 previously edited files
" "100 : will save up to 100 lines for each register
" :20 : up to 20 lines of command-line history will be remembered
" % : saves and restores the buffer list
" n... : where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" when we reload, tell vim to restore the cursor to the saved position
augroup JumpCursorOnEdit
 au!
 autocmd BufReadPost *
 \ if expand("<afile>:p:h") !=? $TEMP |
 \ if line("'\"") > 1 && line("'\"") <= line("$") |
 \ let JumpCursorOnEdit_foo = line("'\"") |
 \ let b:doopenfold = 1 |
 \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
 \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
 \ let b:doopenfold = 2 |
 \ endif |
 \ exe JumpCursorOnEdit_foo |
 \ endif |
 \ endif
" Need to postpone using "zv" until after reading the modelines.
 autocmd BufWinEnter *
 \ if exists("b:doopenfold") |
 \ exe "normal zv" |
 \ if(b:doopenfold > 1) |
 \ exe "+".1 |
 \ endif |
 \ unlet b:doopenfold |
 \ endif
augroup END

" Resize splits when the window is resized
    au VimResized * exe "normal! \<c-w>="
command Prettyjson :%!python -m json.tool

syn sync minlines=200
syn sync fromstart

filetype off
filetype plugin indent off
set runtimepath+=/usr/local/go/misc/vim
filetype plugin indent on
map \ i
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

highlight clear SignColumn
cmap w!! %!sudo tee > /dev/null %

set exrc            " enable per-directory .vimrc files
set secure          " disable unsafe commands in local .vimrc files

set backspace=indent,eol,start

au BufNewFile,BufRead *.sls set filetype=yaml
au BufNewFile,BufRead *.tag set filetype=html
au BufNewFile,BufRead *.md set spell spelllang=en_au
set mouse=
hi Search ctermbg=Black

let g:rustfmt_autosave = 1
