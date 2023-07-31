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

Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

-- 高亮语法插件
Plug ('nvim-treesitter/nvim-treesitter', {['do']= vim.fn[':TSUpdate']})

-- surround 
Plug 'tpope/vim-surround'

-- 对齐工具
Plug 'junegunn/vim-easy-align'


-- golang语法工具
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/go.nvim'
Plug 'ray-x/guihua.lua' -- recommended if need floating window support

-- TMux
Plug 'christoomey/vim-tmux-navigator'

-- GO Dap
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'

-- GO代码提示
-- nvim-cmp and its plugins.
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
-- Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-emoji'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug ('tzachar/cmp-tabnine', { ['do']=  vim.fn['./install.sh'] })
-- dictionary cmp plugin
Plug 'octaltree/cmp-look'

Plug 'gfanto/fzf-lsp.nvim'
Plug 'nvim-lua/plenary.nvim'


vim.call('plug#end')

-- plugin config 
require("nvim-treesitter.install").prefer_git = true
require("plugin-config.nvim-tree")
require("plugin-config.nvim-treesitter")
require("plugin-config.go")
require("plugin-config.mason-lsconfig")
require("plugin-config.cmp")


