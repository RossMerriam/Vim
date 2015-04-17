" Vim Configuration File
" Author: Ross Merriam
" 2014


" Mapleader Customization
let mapleader=","
let maplocalleader=","

set nocompatible							" more or less a reset for vim
filetype off								" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'matchit.zip'
Plugin 'reedes/vim-colors-pencil'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'				" Adds repeat functionality to some plugins
Plugin 'tpope/vim-haml'					" runtime files for Haml, Sass, and SCSS
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'groenewege/vim-less'
Plugin 'gregsexton/MatchTag'			" Highlights matching HTML tag
Plugin 'hail2u/vim-css3-syntax'			" CSS3 syntax support
Plugin 'jelera/vim-javascript-syntax'	" Better Javascript Sytax
Plugin 'cakebaker/scss-syntax.vim'		" SCSS syntax
Plugin 'digitaltoad/vim-jade'

" Colorschemes
Plugin 'morhetz/gruvbox'
Plugin 'blerins/flattown'

" All of your Plugins must be added before the following line
call vundle#end()						" required

filetype plugin indent on				" required
syntax on								" syntax highlighting


" WildMenu Configs
set wildmenu							" visual autocomplete for command menu

" Ignore these files when completing:
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**

set wildmode=full				" <TAB> cycles between all matching choices

set showcmd						" show partial commands in the last line
set pumheight=6					" keep a small completion window

set hidden						" switch from an unsaved buffer w/o saving first
set lazyredraw					" redraw only when we need to


" Spaces and Tabs
set tabstop=4					" number of visual spaces per TAB
set softtabstop=4				" number of spaces in tab when editing
set shiftwidth=4				" use 4 spaces instead of tabs
set expandtab					" tabs are spaces not tabs
"
" Gui Options
set guifont=Monaco\ for\ Powerline:h12
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" UI Config
set number						" show line numbers
set showcmd						" show command in bottom bar
set cursorline					" highlight current line


" Search
set incsearch					" search as characters are entered
set hlsearch					" highlight matches
set showmatch					" show matching parenthesis-like character
set ignorecase					" ignore case when searching
set smartcase					" pay attention to case when uppercase is entered

" Settings that vim "Purists" would argue breaks the vimmyness of our config
set backspace=indent,eol,start	" allow backspacing over autoindent, line breaks
								" and start of insert action
set autoindent					" when no filetype detected keep same indent as
								" line you're currently on
set nostartofline				" don't always start at beginning of line
set virtualedit=onemore			" cursor is allowed to go one beyond last character

set linespace=0					" no extra spaces between rows
set title						" show title in console title bar
set showmode					" show current mode
set linebreak					" don't wrap text in the middle of a word
set visualbell					" don't beep that damned bell!
set mouse=a						" let's use the mouse everywhere!
set cmdheight=2					" avoids having to press <Enter> to continue
set clipboard+=unnamed			" use the OS clipboard
set esckeys						" allow cursor keys in insert mode
set ttyfast						" optimize for fast terminal connections
set confirm						" don't just fail a command for unsaved changes
								" be more helpful and raise a dialogue!
set binary
set noeol						" don't add empty newlines at the end of files
set scrolloff=3					" start scrolling 3 lines before horizonal border

set modeline					" respect modelines! if someone wanted something
set modelines=4					" formatted that way we'll see it that way!


" Status line
if has('statusline')
	set laststatus=2
	" Broken down into easily includeable segments
	set statusline=%<%f\ " Filename
	set statusline+=%w%h%m%r " Options
	"set statusline+=%{fugitive#statusline()} " Git Hotness
	set statusline+=\ [%{&ff}/%Y] " filetype
	set statusline+=\ [%{getcwd()}] " current dir
	set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info
endif


" AngularJs ignore ng- attribute in HTML linting
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

" Neocomplcache Settings 
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1


" OmniCompletion
autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


autocmd BufNewFile,BufRead *.scss             set ft=scss.css

" CtrlP mapping to <Leader>o
let g:ctrlp_map = '<leader>o'

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>


" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

set background=dark
if has("gui_running")
	colorscheme gruvbox
else
	colorscheme flattown
endif
