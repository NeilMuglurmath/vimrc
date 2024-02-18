" ~/.vimrc
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
Plugin 'VundleVim/Vundle.vim'
Plugin 'wincent/terminus'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-commentary'
Plugin 'Raimondi/delimitMate'
Plugin 'vim-autoformat/vim-autoformat'
Plugin 'vim-airline/vim-airline'
Plugin 'machakann/vim-highlightedyank'
Plugin 'easymotion/vim-easymotion'
Plugin 'rhysd/vim-clang-format'
Plugin 'kana/vim-operator-user'
Plugin 'mhinz/vim-startify'
Plugin 'embark-theme/vim'
Plugin 'rickharris/vim-railscasts'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ----- Colorshceme Settings -----
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

colorscheme embark
" ----- Plugin Settings -----
" Airline
" let g:airline_extensions = []
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts=1
" let g:airline#extensions#tabline#formatter = 'default'

" Yank highlight
let g:highlightedyank_highlight_duration = 130
highlight HighlightedyankRegion ctermbg=100 guibg=#c6e2ff

" cpp highlighting
" let g:cpp_class_scope_highlight = 1
" let g:cpp_member_variable_highlight = 1
" let g:cpp_class_decl_highlight = 1
" let g:cpp_posix_standard = 1
" let g:cpp_concepts_highlight = 1

" vim rainbow
let g:rainbow_active = 1

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" f to hop to any word
nmap f <Plug>(easymotion-bd-w)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1
" ----- Vim Options -----
set timeoutlen=200
set ttimeoutlen=0

set showcmd

nnoremap <SPACE> <Nop>
map <Space> <Leader>

" No need for  -- INSERT -- any more
set noshowmode
" turn hybrid line numbers on
set number rnu

set ruler

set wrap

set encoding=utf-8

set cursorline

" syntax highlighting
syntax on
" fix for issue with not being able to delete in insert mode
set backspace=indent,eol,start
" show search results as you type
set incsearch
" highlight all search results
set hlsearch
" enable mouse interaction
set mouse=a

" highlight color
hi Visual term=reverse cterm=reverse guibg=Grey

set tabstop=4
set shiftwidth=4

set ai "Auto indent
set si "Smart indent

" convert tab to spaces
set expandtab

set cursorline

" Be smart when using tabs ;)
set smarttab

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Keep cursor in middle of screen when scrolling
set so=999

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" set sensible highlight matches that don't obscure the text
highlight MatchParen cterm=underline ctermbg=NONE ctermfg=NONE

" ----- Key Mappings -----
" insert semicolon at end of line with ;;
inoremap ;; <c-o>A;<CR>

" set up parens with jk
inoremap jk <Esc>A}<Left>{<Cr><Up><Esc>o
" map jj to <Esc>
inoremap jj <Esc>

" making wq case insensitive
command W w
command WQ wq
command Q q

vnoremap <c-c> :w !pbcopy<cr><cr>
noremap <c-v> :r !pbpaste<cr><cr>

noremap ; A;<Esc>

" Unbind some useless/annoying default key bindings.
" 'Q' in normal mode enters Ex mode. You almost never want this.
nmap Q <Nop>

"This unsets the last search pattern register by hitting return
nnoremap <CR> :noh<CR>

" Tab out of things
inoremap <expr> <Tab> TriggerTab()

function! TriggerTab()
    let c = getline('.')[col('.') - 1]
    if (c == ')' || c == ']' || c == '}' || c == '"' || c == "'" || c == '>')
        return "\<Right>"
    else
        return "\<Tab>"
    endif
endfunction

" ----- Autocommands -----
" Toggle line numbering between insert and normal mode
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

" Automatically run ClangFormat on save for C family files
autocmd BufWritePre *.c,*.h,*.cpp,*.hpp,*.cu :ClangFormat

" save on focus switch
autocmd bufleave,focuslost * silent! wall

" Automatically run clang-format on save for C++ files
augroup cpp_format
    autocmd!
    autocmd BufWritePre *.cpp,*.h :ClangFormat
augroup END

