" Minimal vimrc settings for console systems

" Basic options

" Vim settings {{{1

set smartindent
set cindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
set expandtab
set ignorecase
set smartcase
set textwidth=80
set formatoptions+=r
set cinoptions=:0g0
set backspace=2
set mouse=a
set hidden
set nobackup
set nowritebackup
set noswapfile
set ruler
set showcmd
set clipboard=unnamed
set encoding=utf-8
set hlsearch
set incsearch
set grepprg=grep\ -nH\ $*
set completeopt-=preview

syntax on
filetype plugin on
filetype plugin indent on

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j
endif

let g:tex_flavor='latex'
let g:is_posix = 1
let g:load_doxygen_syntax=1

" }}}

" Keybinds {{{1

" Map redraw screen (C-L) to also turn of search highlighting. {{{2
nnoremap <C-l> :nohl<CR><C-l>

" Tweaks {{{1

" Show NFOs in correct codepage {{{2
au BufNewFile,BufRead *.nfo edit ++enc=cp437

" Delete trailing whitespace in code {{{2
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python,glsl,cmake autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
" }}}

" Color scheme {{{1
let g:force_greyComments=1
set background=dark
colo force
" }}}

" Plugins

" Load pathogen {{{1
call pathogen#infect()

" }}}

" vim: fdm=marker

