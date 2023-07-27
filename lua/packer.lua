local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'tpope/vim-sensible'

  use {
   'nvim-tree/nvim-tree.lua',
   requires = {
    'nvim-tree/nvim-web-devicons', -- optional
    },
  } 

  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- hlocal vim_plug_path = fn.stdpath('data')..'site/autoload/plug.vim'
-- if fn.empty(fn.glob(vim_plug_path)) > 0 then
--  vim_plug_bootstrap = fn.system({'sh', '-c', 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://ghproxy.com/https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'})
-- end


-- require('vim-plug').startup(function()
--	Plug 'junegunn/vim-easy-align'	
-- end)
