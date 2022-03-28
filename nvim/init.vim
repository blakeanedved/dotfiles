set nocompatible
" {{{ plugins 
	call plug#begin(expand('$NVIMDOTDIR/plugged'))
	
	" Completion
	Plug 'neoclide/coc.nvim', { 'branch': 'release' }
	" CocInstall coc-json coc-tsserver

	" Theme
	Plug 'rakr/vim-one'
	Plug 'itchyny/lightline.vim'
	
	" Highlighting
	Plug 'sheerun/vim-polyglot'
	Plug 'jackguo380/vim-lsp-cxx-highlight', { 'for': ['cpp', 'c', 'h', 'hpp', 'tpp'] }
	Plug 'junegunn/rainbow_parentheses.vim'

	" Automatic Window Resizing
	" Plug 'camspiers/animate.vim'
	" Plug 'camspiers/lens.vim'
	
	" extend % operator
	Plug 'andymass/vim-matchup'

	" AndrewRadev QoL Plugins
	Plug 'AndrewRadev/sideways.vim'
	" Plug 'AndrewRadev/splitjoin.vim'
	Plug 'AndrewRadev/tagalong.vim', { 'for': ['html', 'xml', 'jsx', 'php', 'javascriptreact', 'typescriptreact', 'tsx'] }

	" tpope QoL Plugins
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-fugitive', { 'on': 'Git' }

	" Commenting
	Plug 'scrooloose/nerdcommenter'

	" Multiple Cursors
	Plug 'mg979/vim-visual-multi', {'branch': 'master'}

	" CTRL-P
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'tacahiroy/ctrlp-funky', { 'on': 'CtrlPFunky' }

	" Git Gutter
	Plug 'airblade/vim-gitgutter', { 'on': ['GitGutterToggle', 'GitGutterEnable'] }

	" Better Find and Replace
	Plug 'markonm/traces.vim'

	" Better HTML
	Plug 'mattn/emmet-vim', { 'for': ['html', 'xml', 'jsx', 'php', 'javascriptreact', 'typescriptreact', 'tsx'] }

	call plug#end()
" }}}
" {{{ builtins 
	" Turn on line numbers
	set number
	" Turn on relative line numbers
	" set relativenumber

	" Turn on syntax highlighting
	syntax on

	" Fix backspace default
	set backspace=indent,eol,start

	" Tab size
	set tabstop=2
	set softtabstop=2
	set shiftwidth=2

	" Leader key for keyboard shortcuts
	let mapleader = "\<Space>"
	let maplocalleader = "\<Space>"

	" Enable wildmenu
	set wildmenu

	" Incremental highlight when searching
	set incsearch

	" Folding
	set foldenable
	" set foldlevelstart=0
	set foldmethod=marker

	set splitbelow
	set splitright
	set hidden
	set updatetime=100

	" Disable ins-completion-menu messages
	set shortmess+=c

	set mouse=a
	set encoding=UTF-8
	set fileencoding=UTF-8
	set nobackup
	set belloff=all
	set laststatus=2
	set ttimeoutlen=0

	if (has("termguicolors"))
		set termguicolors
	endif

	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" }}}
" {{{ remaps 
	" toggle folding
	nnoremap <leader>f za

	" unbind Shift + arrows
	nmap <S-Up> <Nop>
	nmap <S-Down> <Nop>
	nmap <S-Left> <Nop>
	nmap <S-Right> <Nop>
	vmap <S-Up> <Nop>
	vmap <S-Down> <Nop>
	vmap <S-Left> <Nop>
	vmap <S-Right> <Nop>
	imap <S-Up> <Nop>
	imap <S-Down> <Nop>
	imap <S-Left> <Nop>
	imap <S-Right> <Nop>
" }}}
" {{{ vim-one 
	set background=dark
	colorscheme one

	call one#highlight('MatchParen', '282c34', 'fef937', 'none')
	call one#highlight('MatchWord', 'dfdfe0', '1266ca', 'none')
	call one#highlight('Pmenu', 'dfdfe0', '393b44', 'none')
	call one#highlight('PmenuSbar', '393b44', '393b44', 'none')
	call one#highlight('PmenuSel', 'dfdfe0', '1266ca', 'none')
	call one#highlight('PmenuThumb', '414453', '414453', 'none')
	call one#highlight('QuickFixLine', 'dfdfe0', '1266ca', 'none')
	call one#highlight('WildMenu', 'dfdfe0', '1266ca', 'none')
	call one#highlight('IncSearch', '282c34', 'fef937', 'none')
	call one#highlight('Folded', '4b5263', '282c34', 'none')
" }}}
" {{{ lightline 
	let g:lightline = {
      \ 'colorscheme': 'one',
			\ 'active': {
			\		'right': [
			\			[ 'lineinfo' ],
			\			[ 'cocstatus' ],
			\			[ 'filetype' ]
			\		]
			\ },
			\ 'separator': { 'left': '', 'right': '' },
			\ 'component_function': {
			\		'cocstatus': 'coc#status',
			\ }
	\ }
" }}}
" {{{ rainbow_parentheses 
	let g:rainbow#max_level = 16

	augroup rainbow_parentheses
		autocmd!
		autocmd FileType * RainbowParentheses
	augroup END
" }}}
" {{{ sideways  
	" nnoremap <c-h> :SidewaysLeft<cr>
	" nnoremap <c-l> :SidewaysRight<cr>
	" nnoremap <c-h> :SidewaysLeft<cr>
	" nnoremap <c-l> :SidewaysRight<cr>
" }}}
" {{{ ctrlp-funky 
	let g:ctrlp_funky_syntax_highlight = 1
" }}}
" {{{ vim-gitgutter 
	let g:gitgutter_enabled = 1
" }}}
