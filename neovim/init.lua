-- Package Management via Packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function(use)
   use 'folke/tokyonight.nvim'
   use 'norcalli/nvim-colorizer.lua'
   use 'lambdalisue/suda.vim'
   use {
      'nvim-lualine/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
   }
   use 'goolord/alpha-nvim'
   if packer_bootstrap then
	   require('packer').sync()
   end
end)

-- Modules
require('theme')
require('statusline')
require('rgb')

-- Settings
local options = {
	backup = false,
	smartindent = true,
	swapfile = false,
	expandtab = true,
	shiftwidth = 3,
	tabstop = 3,
	cursorline = true,
	number = true,
	relativenumber = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- Minor Package Settings
vim.g.suda_smart_edit = 1

-- Auto-Commands
require('autocommands')
