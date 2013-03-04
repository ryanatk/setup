" plugins
source ~/.vim/plugins/NERD_tree.vim

" turn off compatibility with the old vi
set nocompatible

" turn on the "visual bell" - which is much quieter than the "audio blink"
set vb

" File types
filetype on
au BufNewFile,BufRead *.ftl set filetype=html
au BufNewFile,BufRead *.zml set filetype=html

" turn on auto indent
autocmd FileType php,js,html,ftl,zml :set cindent
set ai

" set to soft tabs at two spaces
set softtabstop=2
set shiftwidth=2
set ts=2
set expandtab

" look and feel
set t_co=<t_co>
set bg=dark

" turn syntax highlighting on by default
syntax on

" show line numbers
set number

" allows full line wrap
set wrap

" automatically show matching brackets
set showmatch

" start searching while you type, and highlight all
set incsearch
set hlsearch

" ignore case on search
set ignorecase

map <C-h> B
map <C-l> W
map <C-j> }
map <C-k> {
map <C-p> :tabprevious<CR>
map <C-n> :tabnext<CR>
map <C-t> :tabnew<CR>:e ./<CR>
map <C-t> :tabnew<CR>:NERDTreeToggle<CR>
map <C-f> :NERDTreeToggle<CR>
nmap <Tab> >>
nmap <S-Tab> <<
nmap <Space> o<Esc>
nmap <CR> :w<CR>
imap <Tab> <Esc>

abbr <form> <form action="" method="" id=""><CR></form>
abbr for() for (var i = 0; i < len; i++) {<CR>}<Esc><S-o><Space>
abbr <html> <!doctype html><CR><html><CR><head><CR><title></title><CR></head><CR><body><CR></body><CR></html>
