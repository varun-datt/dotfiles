" .vimrc

syntax enable

" Spaces & Tabs {{{
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent      " copy indent from the previous line
" }}} Spaces & Tabs

" Clipboard {{{
" set clipboard+=unnamedplus
let g:clipboard = {'copy': {'+': 'pbcopy', '*': 'pbcopy'}, 'paste': {'+': 'pbpaste', '*': 'pbpaste'}, 'name': 'pbcopy', 'cache_ena
bled': 0}
set clipboard+=unnamedplus
nnoremap yy y$
" }}} Clipboard

" UI Config {{{
set hidden
"set showcmd                  " show command in bottom bar
set cursorline               " highlight current line
set wildmenu                 " visual autocomplete for command menu
set showmatch                " highlight matching brace
set laststatus=2             " window will always have a status line
set laststatus=2
" set nobackup
" set noswapfile
" }}} UI Config

" Airline {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='simple'
" }}}

" set Ag as the grep command
:set ignorecase
:set smartcase
"if executable('ag')
    " Note we extract the column as well as the file and line number
"    set grepprg=ag\ --nogroup\ --nocolor\ --column
"    set grepformat=%f:%l:%c%m
"endif
" }}} Search

let g:rg_command = 'rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "al
ways" -g "*.{ts,js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf,scss}" -g "!*.{min.js,swp,o,zip}" -g "!{.git,node_modu
les,vendor,dist,dll}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)
set grepprg=rg\ --vimgrep\ $*
set gfm=%f:%l:%c:%m,%f:%l%m,%f\ \ %l%m

nnoremap <C-p> :FuzzyOpen<CR>
nnoremap <C-g> :<Cr>

" Plugins {{{
call plug#begin('~/.local/share/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'cloudhead/neovim-fuzzy'
Plug '/usr/local/opt/fzf'
call plug#end()
" }}} Plugins

" History {{{
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif<Paste>
" }}} History
