" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set tags=tags
set mouse=a
let python_highlight_all=1
:syntax on
set cindent
set autowrite
set hlsearch
set incsearch
set textwidth=88
set number
set backspace=indent,eol,start
set colorcolumn=89
set belloff=all
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_browser='Google Chrome'
command Whitespace %s/\s\+$//e
command Main /def [^_]/
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
autocmd BufEnter *.md exe 'noremap <F5> :! /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome %:p<CR>'
command REF YcmCompleter GoToReferences
command YCMR YcmRestartServer
command DEF rightbelow vertical YcmCompleter GoTo

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Bundle 'christoomey/vim-tmux-navigator'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'tabnine/YouCompleteMe'
Plugin 'arcticicestudio/nord-vim'
Plugin 'zxqfl/tabnine-vim'
Plugin 'fatih/vim-go'
Plugin 'preservim/nerdtree'
" Plugin 'scrooloose/syntastic'
" Plugin 'integralist/vim-mypy'

call vundle#end()
filetype plugin indent on    " required

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" Map Ctrl-D to hover definition
nmap <C-D> <plug>(YCMHover)

" Open definition in new vertical split
map <leader>ds :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" " Open definition in new tab
map <leader>dt :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

colorscheme nord

let g:ycm_goto_buffer_command = 'split'
let g:ycm_collect_identifiers_from_tags_files = 1
" Auto generate tags file on file write of *.c and *.h files
autocmd BufWritePost *.py silent! !ctags . &
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" So nerdtree doesn't resize
set noequalalways

" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_python_checkers = ['pylint', 'mypy']
"
function Save()
  %s/\s\+$//e
  write
endfunction

command W call Save()
