call plug#begin('~/.config/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'digitaltoad/vim-jade'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'kchmck/vim-coffee-script'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-obsession'
Plug 'shime/vim-livedown'
Plug 'Raimondi/vim-yaml'
Plug 'editorconfig/editorconfig-vim'
Plug 'ElmCast/elm-vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/syntastic'
Plug 'jceb/vim-orgmode'
Plug 'vimwiki/vimwiki' , { 'branch': 'dev' }
Plug 'SirVer/ultisnips'
Plug 'tbabej/taskwiki'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'majutsushi/tagbar'
Plug 'farseer90718/vim-taskwarrior'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'majutsushi/tagbar'
call plug#end()
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

imap <C-f> <ESC>:r!google-contacts-lookup <cword><CR><ESC>

let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips']
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsExpandTrigger="<C-s>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
au BufReadPost *.hbs set syntax=html
au BufReadPost *.hbs filetype indent on
au BufReadPost *.hbs set filetype=html
au BufReadPost *.hbs set smartindent

let g:jsx_ext_required = 0

tnoremap <Esc> <C-\><C-n>

highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000

let g:deoplete#enable_at_startup = 1

call deoplete#custom#set('ultisnips', 'matchers', ['matcher_fuzzy'])

function! RangeSearch(direction)
  call inputsave()
  let g:srchstr = input(a:direction)
  call inputrestore()
  if strlen(g:srchstr) > 0
    let g:srchstr = g:srchstr.
          \ '\%>'.(line("'<")-1).'l'.
          \ '\%<'.(line("'>")+1).'l'
  else
    let g:srchstr = ''
  endif
endfunction
vnoremap <silent> / :<C-U>call RangeSearch('/')<CR>:if strlen(g:srchstr) > 0\|exec '/'.g:srchstr\|endif<CR>
vnoremap <silent> ? :<C-U>call RangeSearch('?')<CR>:if strlen(g:srchstr) > 0\|exec '?'.g:srchstr\|endif<CR>

let g:go_fmt_experimental = 1

set foldmethod=indent
