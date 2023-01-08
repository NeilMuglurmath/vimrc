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
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'tpope/vim-commentary'
Plugin 'Townk/vim-autoclose'
Plugin 'vim-autoformat/vim-autoformat'
Plugin 'vim-airline/vim-airline'
Plugin 'frazrepo/vim-rainbow'
Plugin 'machakann/vim-highlightedyank'
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


let g:airline_powerline_fonts=1

" turn hybrid line numbers on
:set number relativenumber
:set nu rnu
:set ruler
:set wrap
:set encoding=utf-8
:inoremap jj <Esc>
:syntax on
:augroup numbertoggle
    :  autocmd!
    :  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    :  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END
" Use homebrew's clangd
let g:ycm_clangd_binary_path = trim(system('brew --prefix llvm')).'/bin/clangd'
" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
" " nerdtree
" nnoremap <leader>n :nerdtreefocus<cr>
" nnoremap <c-n> :nerdtree<cr>
" nnoremap <c-t> :nerdtreetoggle<cr>
" nnoremap <c-f> :nerdtreefind<cr>

" vim rainbow
let g:rainbow_active = 1
let g:indentguides_togglelistmode = 0

let g:deoplete#enable_at_startup = 1
" format on save
au BufWrite * :Autoformat

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
" insert semicolon at end of line with ;;
inoremap ;; <c-o>a;

" fix for issue with not being able to delete in insert mode
set backspace=indent,eol,start
vnoremap <c-c> :w !pbcopy<cr><cr>
noremap <c-v> :r !pbpaste<cr><cr>
" save on focus switch
autocmd bufleave,focuslost * silent! wall
" show search results as you type
set incsearch
" highlight all search results
set hlsearch
" enable mouse interaction
set mouse=a
" c-l to get out of parentheses in insert mode
inoremap <c-l> <c-o>a

:set tabstop=4
:set shiftwidth=4
:set expandtab

" change cursor on insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Keep cursor in middle of screen when scrolling
" :set so=999


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

" Unbind some useless/annoying default key bindings.
" 'Q' in normal mode enters Ex mode. You almost never want this.
nmap Q <Nop>

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

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

" Yank highlight
let g:highlightedyank_highlight_duration = 130
highlight HighlightedyankRegion ctermbg=500 guibg=#000000
