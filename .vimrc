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
Plugin 'tpope/vim-commentary'
Plugin 'Townk/vim-autoclose'
Plugin 'vim-autoformat/vim-autoformat'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'frazrepo/vim-rainbow'
Plugin 'machakann/vim-highlightedyank'
Plugin 'octol/vim-cpp-enhanced-highlight'
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

colorscheme slate

" ----- Plugin Settings -----
" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme = 'jellybeans'

" Yank highlight
let g:highlightedyank_highlight_duration = 130
highlight HighlightedyankRegion ctermbg=2 guibg=#401294

" cpp highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_concepts_highlight = 1

" vim rainbow
let g:rainbow_active = 1
" ----- Vim Options -----

" No need for  -- INSERT -- any more
set noshowmode
" turn hybrid line numbers on
set number relativenumber

set ruler

set wrap

set encoding=utf-8

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
" c-l to get out of parentheses in insert mode

set tabstop=2
set shiftwidth=4
" convert tab to spaces
set expandtab

" change cursor on insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
"set smartcase

" Keep cursor in middle of screen when scrolling
set so=10
" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" ----- Key Mappings -----
" insert semicolon at end of line with ;;
inoremap ;; <c-o>A;
" set up parens with jk
inoremap jk <Esc>A{<CR>}<C-o>O<Tab>
" map jj to <Esc>
inoremap jj <Esc>
" Ctrl+l to get to next line in insert mode
inoremap <c-l> <c-o>a
" kj to move to next char in insert mode
inoremap kj <c-o>a
" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>

vnoremap <c-c> :w !pbcopy<cr><cr>
noremap <c-v> :r !pbpaste<cr><cr>

" Unbind some useless/annoying default key bindings.
" 'Q' in normal mode enters Ex mode. You almost never want this.
nmap Q <Nop>

"This unsets the last search pattern register by hitting return
nnoremap <CR> :noh<CR><CR>

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

" format on save
au BufWrite * :Autoformat

" save on focus switch
autocmd bufleave,focuslost * silent! wall
