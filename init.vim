"PLUGIN MANAGEMENT
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround' 
Plug 'Raimondi/delimitMate'
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'changyuheng/color-scheme-holokai-for-vim'
Plug 'vim-scripts/vis'
Plug 'vim-scripts/VisIncr'
Plug 'https://github.com/vim-scripts/DoxygenToolkit.vim'
Plug 'PProvost/vim-ps1'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'https://github.com/mkitt/tabline.vim'
Plug 'natebosch/vim-lsc'
Plug 'https://github.com/junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'SirVer/ultisnips'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

"NVIM SETTINGS
colo holokai
hi Function         ctermfg=1
let mapleader=" "
let &makeprg='(cd ./$* && make)'
set nu
set tabstop=4
set shiftwidth=4
set expandtab
set nowrap
set noshowmode
set diffopt+=vertical
set completeopt-=preview
set efm+=ctc\ %t%n:\ [\"%f\"\ %l\/%c]%m
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <Leader>c :%s///ng <CR> 
nnoremap <Leader>n :noh<CR>
nnoremap <Leader>x :%!xxd<CR>
nnoremap <Leader>2 :diffget //2<CR> :diffupdate<CR>
nnoremap <Leader>3 :diffget //3<CR> :diffupdate<CR>
noremap <F12> :%!clang-format -style="{BasedOnStyle: microsoft, ColumnLimit: 150, ReflowComments: true}"<CR>
inoremap <C-l> <C-o>a
tnoremap <Esc> <C-\><C-n>

"PLUGIN SETTINGS
nnoremap <F8> :NERDTreeToggle<CR>
nnoremap <F9> :NERDTreeFind<CR>
noremap <Leader>t :Tabularize /
nnoremap <Leader>p :Ag<CR>
nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <C-b> :GBranches<CR>
let delimitMate_expand_cr = 1
let g:airline#extensions#whitespace#enabled = 0
let g:DoxygenToolkit_authorName="Akshay Shedbalkar"
let NERDTreeIgnore = ['^RP_SRC*','^Review','^doc','^test', 'build$', '^tags', 'compile_commands.json']
let g:termdebug_wide = 1
let g:lsc_auto_map = {'defaults': v:true, 'GoToDefinition': 'gd', 'PreviousReference': ''}
let g:fzf_layout = { 'down': '~40%' }
let g:lsc_server_commands = {
    \ 'cpp': {
        \ 'command': 'clangd --background-index',
        \ 'suppress_stderr': v:true
    \},
    \ 'c': {
        \ 'command': 'clangd --background-index',
        \ 'suppress_stderr': v:true
    \},
    \ 'python': 'pyls',
\}
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF

"PROJECT SETTINGS
nnoremap <Leader>s :grep -r --exclude-dir={cmake-build-debug,build,config,.git,tasking_build,delivery_build,tools,doc,cmocka,test,scripts,.vscode} --exclude={tags,*.swp,*.sqlite,*.obj,*.a,*.html,*.exe,*.rdump} <cword> .<CR>
command -nargs=1 Search :grep -r --exclude-dir={cmake-build-debug,build,config,.git,tasking_build,delivery_build,tools,doc,cmocka,test,scripts,.vscode} --exclude={tags,*.swp,*.sqlite,*.obj,*.a,*.html,*.exe,*.rdump} <args> .
command -nargs=+ Refactor :cfdo %s/<args>/g|update
