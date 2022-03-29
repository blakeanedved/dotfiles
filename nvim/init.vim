set nocompatible
" {{{ plugins 
	call plug#begin(expand('$NVIMDOTDIR/plugged'))
	
	" Completion
	Plug 'neoclide/coc.nvim', { 'branch': 'release' }

	" CTRL-P
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'tacahiroy/ctrlp-funky', { 'on': 'CtrlPFunky' }

	" Theme
	Plug 'rakr/vim-one'
	Plug 'itchyny/lightline.vim'
	Plug 'mhinz/vim-startify'
	Plug 'ryanoasis/vim-devicons'
	
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
	set belloff=all
	set laststatus=2
	set ttimeoutlen=0

	" Some CoC servers have issues when backup files are enabled
	set nobackup
	set nowritebackup

	" Enable to merge sign and number column
	" set signcolumn=number

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
	let g:gitgutter_enabled = 0
" }}}
" {{{ emmet-vim 
	let g:user_emmet_leader_key = '<Space>'
	let g:user_emmet_mode='n'
" }}}
" {{{ CoC 
	" MUST RUN
	" CocInstall coc-json coc-tsserver coc-calc coc-css coc-cssmodules coc-docker coc-eslint coc-html coc-prettier coc-rust-analyzer coc-svelte coc-tailwindcss coc-toml coc-vimlsp coc-yaml coc-texlab coc-sumneko-lua coc-jedi
	" sudo pacman -S ccls lua python-pip
	
	function! s:check_back_space() abort
	  let col = col('.') - 1
	  return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

	function! s:show_documentation()
	  if (index(['vim','help'], &filetype) >= 0)
			execute 'h '.expand('<cword>')
	  else
			call CocAction('doHover')
	  endif
	endfunction

	" Use tab for trigger completion with characters ahead and navigate.
	" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
	" other plugin before putting this into your config.V
	inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

	" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
	" position. Coc only does snippet and additional edit on confirm.
	" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
	inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

	" Use `[g` and `]g` to navigate diagnostics
	" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
	nmap <silent> [g <Plug>(coc-diagnostic-prev)
	nmap <silent> ]g <Plug>(coc-diagnostic-next)

	" GoTo code navigation.
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)

	" Use K to show documentation in preview window.
	nnoremap <silent> K :call <SID>show_documentation()<CR>

	" Symbol renaming.
	nmap <leader>rn <Plug>(coc-rename)

	" Formatting selected code.
	xmap fs <Plug>(coc-format-selected)
	nmap fs <Plug>(coc-format-selected)

	" Applying codeAction to the selected region.
	" Example: `<leader>aap` for current paragraph
	xmap <leader>a  <Plug>(coc-codeaction-selected)
	nmap <leader>a  <Plug>(coc-codeaction-selected)

	" Remap keys for applying codeAction to the current buffer.
	nmap <leader>ac  <Plug>(coc-codeaction)

	" Apply AutoFix to problem on the current line.
	nmap <leader>qf  <Plug>(coc-fix-current)

	" Run the Code Lens action on the current line.
	nmap <leader>cl  <Plug>(coc-codelens-action)

	" Map function and class text objects
	" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
	xmap if <Plug>(coc-funcobj-i)
	omap if <Plug>(coc-funcobj-i)
	xmap af <Plug>(coc-funcobj-a)
	omap af <Plug>(coc-funcobj-a)
	xmap ic <Plug>(coc-classobj-i)
	omap ic <Plug>(coc-classobj-i)
	xmap ac <Plug>(coc-classobj-a)
	omap ac <Plug>(coc-classobj-a)

	" Remap <C-f> and <C-b> for scroll float windows/popups.
	nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

	augroup mygroup
		autocmd!
		" Setup formatexpr specified filetype(s).
		autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
		" Update signature help on jump placeholder.
		autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
	augroup end

	" Use <c-space> to trigger completion.
	inoremap <silent><expr> <c-space> coc#refresh()

	" Use CTRL-S for selections ranges.
	" Requires 'textDocument/selectionRange' support of language server.
	nmap <silent> <C-s> <Plug>(coc-range-select)
	xmap <silent> <C-s> <Plug>(coc-range-select)

	" Add `:Format` command to format current buffer.
	command! -nargs=0 Format :call CocActionAsync('format')

	" Add `:Fold` command to fold current buffer.
	command! -nargs=? Fold :call     CocAction('fold', <f-args>)

	" Add `:OR` command for organize imports of the current buffer.
	command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

	" Mappings for CoCList
	" Show all diagnostics.
	nnoremap <silent><nowait> <leader><space>a  :<C-u>CocList diagnostics<cr>
	" Manage extensions.
	nnoremap <silent><nowait> <leader><space>e  :<C-u>CocList extensions<cr>
	" Show commands.
	nnoremap <silent><nowait> <leader><space>c  :<C-u>CocList commands<cr>
	" Find symbol of current document.
	nnoremap <silent><nowait> <leader><space>o  :<C-u>CocList outline<cr>
	" Search workspace symbols.
	nnoremap <silent><nowait> <leader><space>s  :<C-u>CocList -I symbols<cr>
	" Do default action for next item.
	nnoremap <silent><nowait> <leader><space>j  :<C-u>CocNext<CR>
	" Do default action for previous item.
	nnoremap <silent><nowait> <leader><space>k  :<C-u>CocPrev<CR>
	" Resume latest coc list.
	nnoremap <silent><nowait> <leader><space>p  :<C-u>CocListResume<CR>
" }}}
" {{{ vim-devicons 
	let g:webdevicons_enable_ctrlp = 1
	let g:webdevicons_enable_startify = 1
" }}}
