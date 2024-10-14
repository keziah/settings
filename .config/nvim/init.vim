" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

set directory=~/.vim/swapfiles//
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

call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'preservim/nerdtree'
Plug 'wincent/command-t'
Plug 'christoomey/vim-tmux-navigator'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'arcticicestudio/nord-vim'
Plug 'github/copilot.vim'

call plug#end()

filetype plugin indent on    " required

colorscheme nord

let g:go_highlight_diagnostic_errors = 1
let g:go_highlight_diagnostic_warnings = 1

let g:ycm_goto_buffer_command = 'split'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_autoclose_preview_window_after_completion = 1
" Auto generate tags file on file write of *.c and *.h files
autocmd BufWritePost *.py silent! !ctags . &
autocmd BufWinEnter * if &buftype != "quickfix" && getcmdwintype() == '' | silent NERDTreeMirror | endif
autocmd vimenter * NERDTree
nmap <silent> dr :NERDTreeFind<CR>


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

" Copilot
"" copilot_assume_mapped
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" For CoC

" Highlight the symbol and it's references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Show function def
nnoremap <silent> <C-D> :call CocAction('doHover')<cr>

" Use K to show documentation in preview window
nnoremap <silent> K :call CocAction('doHover')<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
   call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation
" coc-definition
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> go :call CocAction('jumpDefinition', 'open')<CR>
nmap <silent> gsp :call CocAction('jumpDefinition', 'split')<CR>
nmap <silent> gn :call CocAction('jumpDefinition', 'tabe')<CR>
"command DEFO :call CocAction('jumpDefinition', 'open')<CR>

nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Command-T
let g:CommandTPreferredImplementation='lua'
command CT CommandT
command CTB CommandTBuffer
command CTW CommandTWatchman
" Command-T End
