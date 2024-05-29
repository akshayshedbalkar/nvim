"

"PLUGIN MANAGEMENT
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround' 
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'vim-scripts/vis'
Plug 'vim-scripts/VisIncr'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'preservim/nerdtree', { 'on' : 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'mkitt/tabline.vim'
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'natebosch/vim-lsc'
Plug 'nvim-treesitter/nvim-treesitter', { 'do' : 'TSUpdate'}
Plug 'kassio/neoterm'
Plug 'akshayshedbalkar/atm.vim'
Plug 'changyuheng/color-scheme-holokai-for-vim'
Plug 'joshdick/onedark.vim'
Plug 'PProvost/vim-ps1'
Plug 'unblevable/quick-scope'
call plug#end()

"AUTO COMMANDS
autocmd ColorScheme holokai hi Function guifg=208 ctermfg=208
autocmd ColorScheme * hi Normal guibg=none ctermbg=none
autocmd FileType python setlocal equalprg=yapf
autocmd FileType python setlocal makeprg=python\ %
autocmd FileType markdown setlocal makeprg=mmdc\ -i\ %
autocmd Filetype c,cpp,rust,python,xml setlocal foldmethod=expr
autocmd Filetype c,cpp,rust,python,xml setlocal foldexpr=nvim_treesitter#foldexpr()
" autocmd FileType c,cpp setlocal makeprg=make\ -s\ -C\ $*

"NVIM SETTINGS
let mapleader = " "
colo onedark
set makeprg=make\ -s\ -C\ build
set nu
set tabstop=4
set shiftwidth=2
set expandtab
set nowrap
set noshowmode
set diffopt+=vertical,iwhite
set completeopt-=preview
set efm+=ctc\ %t%n:\ [\"%f\"\ %l\/%c]%m
set fdm=syntax
set fdls=99
set clipboard+=unnamedplus
set mouse=
nmap gd <C-]>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <Leader>c :%s///ng <CR> 
nnoremap <Leader>n :noh<CR>
nnoremap <Leader>x :%!xxd<CR>
nnoremap <Leader>r :%!xxd -r<CR>
nnoremap <Leader>2 :diffget //2<CR> :diffupdate<CR>
nnoremap <Leader>3 :diffget //3<CR> :diffupdate<CR>
nnoremap <Leader>d A  /*!<  */<ESC>hhi
inoremap <C-l> <C-o>a
tnoremap <Esc> <C-\><C-n>

"PLUGIN SETTINGS
nnoremap <F8> :NERDTreeToggle<CR>
nnoremap <F9> :NERDTreeFind<CR>
noremap <Leader>t :Tabularize /
nnoremap <Leader>p :Rg<CR>
nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>w :Windows<CR>
nnoremap <Leader>z :Ttoggle<CR>
command -nargs=1 Gdy :G difftool -y <args>
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:airline#extensions#whitespace#enabled = 0
let g:airline_section_z = '%l/%L : %c'
let g:DoxygenToolkit_authorName = "Akshay Shedbalkar"
let g:termdebug_wide = 1
let g:fzf_layout = { 'down': '~40%' }
let g:neoterm_default_mod = 'botright'
let g:neoterm_autoinsert = 1
let g:neoterm_size = 15
let g:lsc_auto_map = {'defaults': v:true, 'PreviousReference': ''}
let g:lsc_server_commands = {
      \ 'cpp': {
      \ 'command': 'clangd --background-index',
      \ 'suppress_stderr': v:true
      \},
      \ 'c': {
      \ 'command': 'clangd --background-index',
      \ 'suppress_stderr': v:true
      \},
      \ 'python': {
      \ 'command': 'pylsp',
      \ 'suppress_stderr': v:true
      \},
      \ 'rust': {
      \ 'command': 'rust-analyzer',
      \ 'suppress_stderr': v:true
      \}
\}
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}
EOF

"PROJECT SETTINGS
nnoremap <Leader>s :grep -r --exclude-dir={cmake-build-debug,build,config,.git,tasking_build,delivery_build,tools,doc,cmocka,test,scripts,.vscode} --exclude={tags,*.swp,*.sqlite,*.obj,*.a,*.html,*.exe,*.rdump} <cword> .<CR>
command -nargs=1 Search :grep -r --exclude-dir={cmake-build-debug,build,config,.git,tasking_build,delivery_build,tools,doc,cmocka,test,scripts,.vscode} --exclude={tags,*.swp,*.sqlite,*.obj,*.a,*.html,*.exe,*.rdump} <args> .
command -nargs=+ Refactor cfdo :%s/<args>/g|update
