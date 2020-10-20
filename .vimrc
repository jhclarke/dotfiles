"&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
"&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
"&&&&&&&&&&&& Setup Plugins &&&&&&&&&&&&&
"&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
"&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

" Vundle Configuration
"**********************
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" PLUGINS
"*********
Plugin 'gmarik/Vundle.vim' " vundle package manager, required
Plugin 'tmhedberg/SimpylFold' " For folding lines of code  
Plugin 'vim-scripts/indentpython.vim' " auto-indenting in python
Plugin 'Valloric/YouCompleteMe' " auto-completion in python
Plugin 'vim-syntastic/syntastic' " syntax highlighting
Plugin 'nvie/vim-flake8' " PEP 8 support
Plugin 'scrooloose/nerdtree' " File Tree Support
Plugin 'jistr/vim-nerdtree-tabs' " Tabs Support 
Plugin 'kien/ctrlp.vim' " SUPER SEARCHING!!
Plugin 'tpope/vim-fugitive' " git integration
Plugin 'donRaphaco/neotex', { 'for': 'tex' } " LaTeX live docs
Plugin 'LaTeX-Box-Team/LaTeX-Box' " Latex syntax
" Plugin 'bfredl/nvim-ipy' " iPython
Plugin 'vim-pandoc/vim-pandoc' " Pandoc
Plugin 'vim-pandoc/vim-pandoc-syntax' " Pandoc syntax
Plugin 'lervag/vimtex'
Plugin 'Konfekt/FastFold'
Plugin 'matze/vim-tex-fold'
Plugin 'JuliaEditorSupport/julia-vim'
if !has('nvim')
	Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'} " powerline status bar
endif
Plugin 'jupyter-vim/jupyter-vim' " jupyter plugin for python
Plugin 'jalvesaq/Nvim-R', {'branch': 'stable'} " R-studio integration
Plugin 'rust-lang/rust.vim' " Rust language support
Plugin 'neomake/neomake', { 'for': ['rust', 'haskell', 'typescript'] }
Plugin 'autozimu/LanguageClient-neovim', {'branch': 'next','do': 'bash install.sh'} " Fortran autocomplete

" Plugins for Custom operators
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'


"***************
" Color Schemes
"***************
Plugin 'jnurmine/Zenburn' 
Plugin 'altercation/vim-colors-solarized'
Plugin 'jcherven/jummidark.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
"&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
"&&&&&&&&&&&& Customization &&&&&&&&&&&&&
"&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
"&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

"*********************
" Style Configuration
"*********************
if has('gui_running')
  set background=dark
  colo solarized
else
  set background=light
"  colo zenburn
"  colo evening
"  colo elflord 
  colo jummidark
endif

" Toggle Dark/Light Mode
call togglebg#map("<F5>")

" Display relative line numbers, with absolute line number for current line
set number
set numberwidth=5
set relativenumber

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

"********************
" Formatting Code
"********************

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Coloration for bad white space
highlight BadWhitespace ctermbg=red guibg=red

let python_highlight_all=1
syntax on

" Indentation for python files.
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix 

" Indentation for other files
au BufNewFile,BufRead *.js, *.html, *.css, *.jl, *.tex, *.rs
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 

" Flag unecessary white-space
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.jl,*.tex,*.rs match BadWhitespace /\s\+$/

" Set encoding UTF-8
set encoding=utf-8

" Set line numbering
set nu

" Set access to system clipboard
set clipboard=unnamed

set textwidth=0 
set wrapmargin=0

" Show <leader> in vim window
set showcmd

" Commentary Configuration (For commenting lines & other objects)
autocmd FileType c,cpp,java,scala,rust setlocal commentstring=/\/\ %s
autocmd FileType sh,ruby,python setlocal commentstring=#\ %s
autocmd FileType conf,fstab setlocal commentstring=#\ %s
autocmd FileType tex setlocal commentstring=%\ %s
autocmd FileType mail setlocal commentstring=>\ %s
autocmd FileType vim setlocal commentstring=\"\ %s
autocmd FileType fortran setlocal commentstring=!\ %s

" Commenting blocks of code. (OLD METHOD)
" augroup commenting_blocks_of_code
"   autocmd!
"   autocmd FileType c,cpp,java,scala,rust let b:comment_leader = '// '
"   autocmd FileType sh,ruby,python   let b:comment_leader = '# '
"   autocmd FileType conf,fstab       let b:comment_leader = '# '
"   autocmd FileType tex              let b:comment_leader = '% '
"   autocmd FileType mail             let b:comment_leader = '> '
"   autocmd FileType vim              let b:comment_leader = '" '
"   autocmd FileType fortran 	    let b:comment_leader = '! '
"   augroup END
"   noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
"   noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
 
"*********************
" Python Configuration
"*********************

" Support for virtual environments
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  with open(activate_this) as f:
   code = compile(f.read(), activate_this,'exec')
   exec(code, dict(__file__=activate_this))
EOF

" Auto-activate python virtual environment when opening VIM
" environment is loaded in the shell from which vim is launched
let g:vim_virtualenv_path = '/usr/pyenvs/main'
if exists('g:vim_virtualenv_path')
    python3 import os; import vim
    python3 activate_this = os.path.join(vim.eval('g:vim_virtualenv_path'),'bin/activate_this.py')
    python3 with open(activate_this) as f: exec(f.read(), {'__file__': activate_this})
endif

" Run python script with Ctrl-i
autocmd FileType python map <buffer> <C-r> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <C-r> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

"*************************
" (Neo)Mutt Configuration
"*************************
autocmd BufNewFile,BufRead /tmp/mutt* set noautoindent filetype=mail wm=0 tw=78 nonumber digraph nolist
autocmd BufNewFile,BufRead ~/tmp/mutt* set noautoindent filetype=mail wm=0 tw=78 nonumber digraph nolist
" set up syntax highlighting for my e-mail
au BufRead,BufNewFile .followup,.article,.letter,/tmp/pico*,nn.*,snd.*,/tmp/mutt* :set ft=mail 

" YouCompleteMe Settings
"use omnicomplete whenever there's no completion engine in youcompleteme (for
"example, in the case of PHP)
set omnifunc=syntaxcomplete#Complete

"*********************
" LaTeX Configuration
"*********************
let g:tex_flavor = 'latex'
let g:tex_flavor  = 'latex'
let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
" let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_progname = 'nvr'
let g:neotex_flavor = 'latex'
let g:neotex_enabled = 1
let g:neotex_delay = 100

"********************
" Rust Configuration
"********************
let g:ycm_rust_src_path = '/home/agathos/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/std/src'

" Racer
set hidden
let g:racer_cmd = "/home/agathos/.cargo/bin/racer"
let g:racer_experimental_completer = 1
au FileType rust nmap <leader>rx <Plug>(rust-doc)
au FileType rust nmap <leader>rd <Plug>(rust-def)
au FileType rust nmap <leader>rs <Plug>(rust-def-split)

" Neomake
" Gross hack to stop Neomake running when exitting because it creates a zombie cargo check process
" which holds the lock and never exits. But then, if you only have QuitPre, closing one pane will
" disable neomake, so BufEnter reenables when you enter another buffer.
let s:quitting = 0
au QuitPre *.rs let s:quitting = 1
au BufEnter *.rs let s:quitting = 0
au BufWritePost *.rs if ! s:quitting | Neomake | else | echom "Neomake disabled"| endif
au QuitPre *.ts let s:quitting = 1
au BufEnter *.ts let s:quitting = 0
au BufWritePost *.ts if ! s:quitting | Neomake | else | echom "Neomake disabled"| endif
let g:neomake_warning_sign = {'text': '?'}

"***********************
" Fortran Configuration
"***********************
let fortran_free_source=1
let fortran_have_tabs=1
let fortran_more_precise=1
let fortran_do_enddo=1
let fortran_fold=1
let fortran_fold_multilinecomments=1
let fortran_fold_conditionals=1

" OMP directives
syn region fortranDirective start=/!$omp.\{-}/ end=/[^\&]$/
syn match fortranDirective "\v!\$\s"


" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \   'fortran': ['fortls', '--symbol_skip_mem', '--incrmental_sync', '--autocomplete_no_prefix']
    \ }

"LanguageComplete settings (fortran)
set completefunc=LanguageClient#complete
set formatexpr=LanguageClient_textDocument_rangeFormatting()
nnoremap <leader> gh :call LanguageClient_textDocument_hover()<CR>
nnoremap <leader> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <leader> gr :call LanguageClient_textDocument_references()<CR>
nnoremap <leader> gs :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <leader> R :call LanguageClient_textDocument_rename()<CR>

"************************
" Extras
"************************

" Setting backups
set backup
set backupdir=$HOME/.vim/backup/

" Display docstrings when folded
let g:SimpylFold_docstring_preview=1

" Ensure autocomplete window closes
let g:ycm_autoclose_preview_window_after_completion=1

" Add a go-to definition shortcut
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Toggle nerdtree
map <C-n> :NERDTreeToggle<CR>


"&&&&&&&&&&&&&&&&&&&&&&
"&&&&&& CREDITS &&&&&&&
"&&&&&&&&&&&&&&&&&&&&&&
" Inspiration was taken from the following:
" https://github.com/christoomey
