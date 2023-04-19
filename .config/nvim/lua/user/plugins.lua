local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer, close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end


-- Autocommand that reloads neovim everytime you save plugins.lua
vim.cmd [[
    augroup packer_user_config
	autocmd!
	autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't have error
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end


-- Have packer use a popup window instead of the sidebar
packer.init {
    display = {
	open_fn = function()
	    return require("packer.util").float { border = "rounded" }
	end,
    },
}


return packer.startup(function(use)
	-- Plugins here
	use 'wbthomason/packer.nvim'
	use 'nvim-lua/popup.nvim'
	use	'nvim-lua/plenary.nvim'
	use 'windwp/nvim-autopairs'
	use	'kyazdani42/nvim-tree.lua'
	use	'kyazdani42/nvim-web-devicons'
	use	'numToStr/Comment.nvim'
	use	'JopjeKnopje/42header_codam'

	-- color themes
   	use	'morhetz/gruvbox'
	use 	'sainnhe/gruvbox-material'
	use 	'LunarVim/darkplus.nvim'

	use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
	use {
		  'nvim-lualine/lualine.nvim',
		    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	    }
	use "lewis6991/gitsigns.nvim"

	-- nvim surround
	use "kylechui/nvim-surround"
	use "tpope/vim-fugitive"
	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}
	use "folke/neodev.nvim"
	use "RRethy/vim-illuminate"
	use "sbulav/nredir.nvim"
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	}
	use "nvim-telescope/telescope.nvim"


 	use 'karb94/neoscroll.nvim'
	use 'nvim-telescope/telescope-symbols.nvim'


	-- Automatically setup your config after cloning packer.nvim
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
