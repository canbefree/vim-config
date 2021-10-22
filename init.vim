let mapleader=","

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'



" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"



" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'

" Unmanaged plugin (manually installed and updated)



if exists('g:vscode')
else
	" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
	Plug 'fatih/vim-go', { 'tag': '*' }

	" Plugin options
	Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }


	" On-demand loading
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
	autocmd VimEnter * NERDTree | wincmd p

	nnoremap <C-n> :NERDTreeMirror<CR>:NERDTreeFocus<CR>
	" Plugin outside ~/.vim/plugged with post-update hook
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	nmap <C-p> :Files<CR>
	nmap <C-e> :Buffers<CR>
	let g:fzf_action = { 'ctrl-e': 'edit' }

	" Multiple Plug commands can be written in a single line using | separators
	Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

	Plug '~/my-prototype-plugin'

	if has('nvim')
  		Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	else
  		Plug 'Shougo/deoplete.nvim'
  		Plug 'roxma/nvim-yarp'
  		Plug 'roxma/vim-hug-neovim-rpc'
	endif
let g:deoplete#enable_at_startup = 1
endif

" Initialize plugin system
call plug#end()
