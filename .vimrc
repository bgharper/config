" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"Vundle setup
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
let g:vundle_default_git_proto = 'git'

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"" Make sure plugin is installed w/ vundle 
Plugin 'nvie/vim-flake8'
Plugin 'tmhedberg/SimpylFold'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" YCM needs manual installation, see website
Plugin 'Valloric/YouCompleteMe'

" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Plugin descriptions: SimpyFold - python code folding. 
" Syntastic: lint support, flake8 - pep8 highlighitng
" Ctrlp - search, vim-fug - git, 

" syntax, numbering
syntax on
set nu

" solarized install: cp
" ~/.vim/bundle/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/
" Note: need colors = 16 for iterm in mac when already using solarized
" try 256 on linux
let g:solarized_termcolors=16
syntax enable
set background=light
colorscheme solarized

set splitright               " split L/R by default
set clipboard=unnamed        " clipboard
set cursorline	             " highlight current line

" Split Modications (ctrl-jklh is redundant)
" split navigations
" C-J down, C-K up, C-L right, C-H left
nnoremap <C-J> <C-W><C-J> 	
nnoremap <C-K> <C-W><C-K>       
nnoremap <C-L> <C-W><C-L>       
nnoremap <C-H> <C-W><C-H>       

" Enable folding
set foldmethod=indent
set foldlevel=99
" za to unfold
" Enable folding with the spacebar
nnoremap <space> za

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" disable syntastic on the statusline
let g:statline_syntastic = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" YCM settings
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

set exrc
set secure
