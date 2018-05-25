set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

colorscheme default
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

" FILE COMMANDS
" go to next/prev file with Tab/Backspace
noremap <bs> :bprev<CR>
noremap <Tab> :bnext<CR>

" PAGE COMMANDS
" full page up
noremap zh <C-b>
noremap zh <C-b>
" half page down
noremap zj <C-d>
noremap zj <C-d>
" half page up
noremap zk <C-u>
noremap zk <C-u>
" full page down
noremap zl <C-f>
noremap zl <C-f>

" CURSOR COMMANDS
" prev cursor position
noremap zb <C-o>
" next cursor position
noremap zf <C-i>

" MODE COMMANDS
inoremap ;; <Esc>
vnoremap ;; <Esc>

" SEARCH COMMANDS
" clear search pattern
nnoremap cs :noh<CR>

" MOVEMENT COMMANDS
" H and L jump to beginning/end of line
noremap H ^
noremap L $
"noremap 0 <NOP>
"noremap $ <NOP>

" OTHER
" disable arrow keys (bad habit)
noremap <UP> <NOP>
noremap <DOWN> <NOP>
noremap <LEFT> <NOP>
noremap <RIGHT> <NOP>
inoremap <LEFT> <NOP>
inoremap <RIGHT> <NOP>
inoremap <UP> <NOP>
inoremap <DOWN> <NOP>
" I think is is because of tmux
noremap <C-B> <NOP>

" PLUGINS
Plugin 'Valloric/YouCompleteMe'
Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd guibg=red ctermbg=3
hi IndentGuidesEven guibg=green ctermbg=4
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3
let g:indent_guides_enable_on_vim_startup = 1
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
