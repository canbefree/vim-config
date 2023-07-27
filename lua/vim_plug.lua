local vim_plug_path = vim.fn.stdpath('data')..'site/autoload/plug.vim'
-- if vim.fn.empty(vim.fn.glob(vim_plug_path)) > 0 then
if not vim.loop.fs_stat(vim_plug_path) then
--      注释，每次启动nvim会有卡顿，暂时去掉 
-- 	vim_plug_bootstrap = vim.fn.system({'sh', '-c', 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://ghproxy.com/https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'})
end

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- Plug 'tpope/vim-sensible'

-- https://dev.to/vonheikemen/neovim-using-vim-plug-in-lua-3oom
--
-- Plug 'scrooloose/nerdtree', {'on':  'NERDTreeToggle'}
-- Plug('scrooloose/nerdtree', {on = 'NERDTreeToggle'})
--
-- Plug ('junegunn/fzf', { 'do': { -> fzf#install() } })
Plug('junegunn/fzf', {['do'] = vim.fn['fzf#install']})
Plug 'junegunn/fzf.vim'

vim.call('plug#end')

