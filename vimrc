colorscheme delek
set nocompatible
syntax enable
set path+=**
set wildmenu
set spell spelllang=en
filetype plugin indent on
command! MakeTags !ctags -R .

call plug#begin('~/.vim/plugged')

"Plug 'vim-syntastic/syntastic'
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"Plug 'dense-analysis/ale'
"let g:ale_linters = {
"\   'java': ['eslint'],
"\}
"let g:ale_linters_explicit = 1

Plug 'sirver/ultisnips'
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
    set runtimepath+=~/.vim/ultisnips

Plug 'honza/vim-snippets'

Plug 'lervag/vimtex'
let g:vimtex_view_method='zathura'
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0

set conceallevel=1
let g:tex_conceal='abd'                              
"hi Conceal ctermbg=NONE
"hi Conceal ctermfg=NONE
"hi Conceal guifg=NONE
"hi Conceal guibg=NONE
"let g:tex_superscripts= "[0-9a-zA-W.,:;+-<>/()=]"
"let g:tex_subscripts= "[0-9aehijklmnoprstuvx,+-/().]"
"let g:tex_conceal_frac=1
autocmd FileType tex hi Conceal ctermbg=NONE

Plug 'tpope/vim-surround'

"Plug 'KeitaNakamura/tex-conceal.vim'
"set conceallevel=1
"let g:tex_conceal='abdmg'                              
"hi Conceal ctermbg=NONE
"hi Conceal ctermfg=NONE
"hi Conceal guifg=NONE
"hi Conceal guibg=NONE
"let g:tex_superscripts="[0-9a-zA-W.,:;+-<>/()=]"
"let g:tex_subscripts="[0-9aehijklmnoprstuvx,+-/().]"
"let g:tex_conceal_frac=1
"autocmd FileType tex hi Conceal ctermbg=NONE

call plug#end()

noremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" `matchit.vim` is built-in so let's enable it!
" Hit `%` on `if` to jump to `else`.
runtime macros/matchit.vim

" various settings
set autoindent
set hidden
set incsearch
set ruler

:nnoremap <expr> y (v:register ==# '"' ? '"+' : '') . 'y'
:nnoremap <expr> yy (v:register ==# '"' ? '"+' : '') . 'yy'
:nnoremap <expr> Y (v:register ==# '"' ? '"+' : '') . 'Y'
:xnoremap <expr> y (v:register ==# '"' ? '"+' : '') . 'y'
:xnoremap <expr> Y (v:register ==# '"' ? '"+' : '') . 'Y'
nnoremap <CR> :wa<CR>:!!<CR>
:map t I<CR><ESC>ka

let g:tex_fold_enabled=1
"set fdm=syntax
au BufRead,BufNewFile *.tex   syntax match StrikeoutMatch /\~\~.*\~\~/
"hi def  StrikeoutColor   ctermbg=black ctermfg=black    guibg=darkblue guifg=blue
"hi link StrikeoutMatch StrikeoutColor
"hi SpellBad ctermbg=52
 
