" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"Vundle setup
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
let g:vundle_default_git_proto = 'git'

"
 " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" " Add all your plugins here (note older versions of Vundle used Bundle
" instead of Plugin)
"" Make sure plugin is installed w/ vundle 
Plugin 'tmhedberg/SimpylFold'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'jmcantrell/vim-virtualenv'
Bundle 'Valloric/YouCompleteMe'

" " All of your Plugins must be added before the following line

" Plugin descriptions: SimpyFold - python code folding. 
" Syntastic: lint support, flake8 - pep8 highlighitng
" Ctrlp - search, vim-fug - git, 
" Python highlighting, line numbering

let python_highlight_all=1
syntax on
set nu

" Note: need colors = 16 for iterm in mac when already using solarized
let g:solarized_termcolors=16
syntax enable
set background=light
colorscheme solarized

call vundle#end()            " required
filetype plugin indent on    " required
set splitright               " split L/R by default
set clipboard=unnamed        " clipboard

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

" Show folded code docstrings
let g:SimpylFold_docstring_preview=1
" PEP8 indent
au BufNewFile,BufRead *.py;
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
filetype indent on
" Python whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" YCM settings
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
