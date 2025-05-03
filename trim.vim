let mapleader =","

set encoding=utf-8
let g:python_host_prog = expand('~/.venv/bin/python')
let g:python3_host_prog = expand('~/.venv/bin/python3')

" remember cursor position
if has("autocmd")
   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"nnoremap <leader>dd :lua require("duck").hatch("ඞ")<CR>
nnoremap <leader>dd :lua require("duck").hatch("🦆")<CR>

source $HOME/.config/nvim/conf/luasnip.vimrc
source $HOME/.config/nvim/conf/tex.vimrc
source $HOME/.config/nvim/conf/systemconf.vimrc

vmap y ygv<Esc>
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
nnoremap gb :ls<CR>:b<Space>$
 
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'
set t_Co=256
set background=dark
colorscheme neopywal
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
set hidden
set title
"set go=a
set mouse=a
set incsearch
set nohlsearch
set clipboard+=unnamedplus
set noshowmode
set noruler
set laststatus=0
set noshowcmd
set autoindent

set grepprg=grep\ -In\ --exclude=.pdf
set ve=all

runtime macros/matchit.vim
command! MakeTags !ctags -R .
nnoremap <CR> :w<CR>
nnoremap < V<<ESC>
nnoremap > V><ESC>
noremap t o<ESC>k
noremap T O<ESC>j
" Some basics:
	nnoremap c "_c
	set nocompatible
	syntax enable
	set number relativenumber
	set nuw=3
	"set path+=**
" Enable autocompletion:
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Perform dot commands over visual blocks:
	vnoremap . :normal .<CR>
" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>
" Splits open at the bottom and right, which is non-stupid, unlike vim defaults.
	set splitbelow splitright
	filetype plugin indent on

" " Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Compile document, be it groff/LaTeX/markdown/etc.
	map <leader>c :w! \| !compiler "<c-r>%"<CR>
	map <leader>C :w! \| silent !compiler "<c-r>%"<CR>

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout <c-r>%<CR><CR>

"command Clean :autocmd BufWritePre * let currPos = getpos(".") | :autocmd BufWritePre * %s/\s\+$//e | :autocmd BufWritePre * %s/\n\+\%$//e | :autocmd BufWritePre *.[ch] %s/\%$/\r/e | :autocmd BufWritePre * %s/\ \$\ /\$\ /eg | :autocmd BufWritePre * %s/\ \$\-/\$\-/eg | :autocmd BufWritePre * %s/\ \$\./\$\./eg

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif

" ignore pdfs
set wildignore+=*.pdf,*.o,*.obj,*.jpg,*.png,*.class

hi clear SpellBad
hi SpellBad cterm=underline
" Set style for gVim
hi SpellBad gui=undercurl

set undodir=~/.config/nvim/undodir
set undofile
set undolevels=1000
set undoreload=10000
