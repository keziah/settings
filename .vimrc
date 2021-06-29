
" set the runtime path to include Vundle and initialize
" Uncommment when Vulndle is installed
# set rtp+=~/.vim/bundle/Vundle.vim

colorscheme desert
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set tags=tags;
set mouse=a
:syntax on
set cindent
set autowrite
set hlsearch
set incsearch
set textwidth=80
set number
set backspace=indent,eol,start
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_browser='Google Chrome'
command Whitespace %s/\s\+$//e
command Main /def [^_]/
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
autocmd BufEnter *.md exe 'noremap <F5> :! /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome %:p<CR>'

# call vundle#begin()
# " alternatively, pass a path where Vundle should install plugins
# "call vundle#begin('~/some/path/here')
#
# " let Vundle manage Vundle, required
# Plugin 'VundleVim/Vundle.vim'
# Plugin 'zxqfl/tabnine-vim'
# Bundle 'christoomey/vim-tmux-navigator'
# Plugin 'JamshedVesuna/vim-markdown-preview'
#
# call vundle#end()
# filetype plugin indent on    " required
#
# map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
# map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
