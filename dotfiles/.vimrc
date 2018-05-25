set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

set encoding=utf-8
set t_Co=256
syntax on
set background=dark

set ignorecase
syntax on
"color molokai
set hlsearch

set ts=4
"set expandtab
set shiftwidth=4
set autoindent
set number
"This unsets the "last search pattern" register by hitting return
" nnoremap <CR> :noh<CR><CR>
"nnoremap <esc> :noh<return><esc>

vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
nnoremap <bs> :bprev<CR>
nnoremap <Tab> :bnext<CR>

noremap H ^
noremap L $
noremap 0 <NOP>
noremap $ <NOP>

noremap <UP> <NOP>
noremap <DOWN> <NOP>
noremap <LEFT> <NOP>
noremap <RIGHT> <NOP>
inoremap <UP> <NOP>
inoremap <DOWN> <NOP>
inoremap <LEFT> <NOP>
inoremap <RIGHT> <NOP>
noremap <C-B> <NOP>

nnoremap gb <C-o>

Plugin 'Valloric/YouCompleteMe'
Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd guibg=red ctermbg=3
hi IndentGuidesEven guibg=green ctermbg=4
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3
let g:indent_guides_enable_on_vim_startup = 1
"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'
Plugin 'tomtom/tcomment_vim'
Plugin 'bling/vim-airline'
"Plugin 'sjl/badwolf'

" Syntax checking hacks for vim
Plugin 'scrooloose/syntastic'
"let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_c_checkers = ['gcc']
let g:syntastic_cpp_checkers = ['g++']
let g:syntastic_python_checkers = ['python']
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_auto_jump=1
" nnoremap <leader>js :w<CR>:make<CR>:cw<CR>
" This does what it says on the tin. It will check your file on open too, not
" just on save.
" " You might not want this, so just leave it out if you don't.
"let g:syntastic_check_on_open=1
" http://oli.me.uk/2013/06/29/equipping-vim-for-javascript/
"

call vundle#end()
filetype plugin indent on

" Vim plugin, provides insert mode auto-completion for quotes, parens,
"brackets, etc.
"Bundle 'Raimondi/delimitMate'

" sublime text like control p
"Bundle 'kien/ctrlp.vim'
"let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|venv’'

" git diff marks in gutter
"Bundle 'airblade/vim-gitgutter'

" Vim Markdown runtime files
"Bundle 'tpope/vim-markdown'

" repeat.vim: enable repeating supported plugin maps with .
"Bundle 'tpope/vim-repeat'

" fugitive.vim: a Git wrapper so awesome, it should be illegal
"Bundle 'tpope/vim-fugitive'

" https://github.com/Lokaltog/powerline-fonts
" Install these modified fonts before switching this to 1
"let g:airline_powerline_fonts = 0

"let g:airline_theme='powerlineish'
"set laststatus=2

" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif
" let g:airline_symbols.space = "\ua0"

"let g:bufferline_echo = 0
"set noshowmode
"set ttimeoutlen=25
"let g:airline#extensions#tabline#enabled = 1

" Simple tmux statusline generator with support for powerline symbols and
" airline integration"
"Bundle 'edkolev/tmuxline.vim'

" The ultimate statusline/prompt utility.
"Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"Bundle 'bling/vim-airline'
" let g:Powerline_symbols = 'fancy'
"set laststatus=2
"set noshowmode

" code autocompletion
" NOTE: Requires extra compilation setup
" Bundle 'Valloric/YouCompleteMe'

" Syntax checking hacks for vim
"Bundle 'scrooloose/syntastic'
"let g:syntastic_javascript_checkers = ['jshint']
"let g:syntastic_error_symbol = '✗'
"let g:syntastic_warning_symbol='⚠'
"let g:syntastic_auto_jump=1
" nnoremap <leader>js :w<CR>:make<CR>:cw<CR>
" This does what it says on the tin. It will check your file on open too, not
" just on save.
" " You might not want this, so just leave it out if you don't.
"let g:syntastic_check_on_open=1
" http://oli.me.uk/2013/06/29/equipping-vim-for-javascript/
"

"A tree explorer plugin for vim.
"Bundle 'scrooloose/nerdtree'

"Vim local themes for powerline
"Bundle 'zhaocai/linepower.vim'
       
