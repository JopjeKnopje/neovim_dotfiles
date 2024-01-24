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
-- vim.cmd [[
--     augroup packer_user_config
-- 	autocmd!
-- 	autocmd BufWritePost plugins.lua source <afile> | PackerSync
--     augroup end
-- ]]

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
	use {
		'wbthomason/packer.nvim'
	}
	use {
		'nvim-lua/popup.nvim',
		commit ='0b97b9051e5d14101ac7207c32663d195354f581'
	}
	use {
		'nvim-lua/plenary.nvim',
		commit = 'd40f5ce0023221b825ecfeb43d0d75e97713c966'
	}
	use {
		'windwp/nvim-autopairs',
		commit = '4b478a73b18967d9f9e756a71100d0e63a08690a'
	}
	use	{
		'kyazdani42/nvim-tree.lua',
		commit = '89816ace70642e9d3db0dab3dc68918f8979ec31'
	}
	-- use	{
	-- 	'kyazdani42/nvim-web-devicons',
	-- 	commit = 'b34362b20a4942b3245f958e73ebe1b09b020ad1'
	-- }
	use	 {
		'numToStr/Comment.nvim',
		commit = 'e297ef8fae0a40de55170900fa4721dcceee3530'
	}
	use	{
		'JopjeKnopje/42header_codam'
	}
	use {
		'sainnhe/gruvbox-material',
		commit = '3b24747b6d1b297232c51b35e1e6a19c8befc33e'
	}
	use {
		'akinsho/bufferline.nvim',
		commit = 'f3c531b36cb0e345c167366d2608103baf93c1aa',
		tag = "v2.*",
		requires = 'kyazdani42/nvim-web-devicons',
	}
	use {
		'nvim-lualine/lualine.nvim',
		commit = '8912bea65de93a56b1f70cdb7c3c26f9cce30394',
		requires = {
			'kyazdani42/nvim-web-devicons',
			opt = true,
			commit = 'b34362b20a4942b3245f958e73ebe1b09b020ad1',
		}
	}
	use {
		'lewis6991/gitsigns.nvim',
		commit = 'e5edefd9976039f5352e0c900f35206770b33a2d',
	}

	-- nvim surround
	use {
		'kylechui/nvim-surround',
		commit = '2fca63c88a6b827019ad9d01f20e30b6499e1d45',
	}
	use {
		'tpope/vim-fugitive',
		commit = 'ef99f1d90cdb33a52931aed5868785b51fb9411d',
	}
	use {
		'VonHeikemen/lsp-zero.nvim',
		commit = '8f7436b5df998515d9e15073b16f1bd142c406f9',
		requires = {
			-- LSP Support
			{
				'neovim/nvim-lspconfig',
				commit = '8dc45a5c142f0b5a5dd34e5cdba33217d5dc6a86',
			},
			{
				'williamboman/mason.nvim',
				commit = 'e634134312bb936f472468a401c9cae6485ab54b',
			},
			{
				'williamboman/mason-lspconfig.nvim',
				commit = 'cec0e6dd534ade486b5eeb59ebcfa8d51c3e8c5e',
			},
			-- Autocompletion
			{
				'hrsh7th/nvim-cmp',
				commit = '768548bf4980fd6d635193a9320545bb46fcb6d8',
			},
			{
				'hrsh7th/cmp-buffer',
				commit = '12463cfcd9b14052f9effccbf1d84caa7a2d57f0',
			},
			{
				'hrsh7th/cmp-path',
				commit = 'bee12940fd4b3ec6238f43ba2c5515fa3e018e96',
			},
			{
				'saadparwaiz1/cmp_luasnip',
				commit = 'b10829736542e7cc9291e60bab134df1273165c9',
			},
			{
				'hrsh7th/cmp-nvim-lsp',
				commit = '91050df7b3eeb91844bd80cde2ec5993fe91adcc',
			},
			{
				'hrsh7th/cmp-nvim-lua',
				commit = 'd276254e7198ab7d00f117e88e223b4bd8c02d21',
			},
			{
				'L3MON4D3/LuaSnip',
				commit = 'a46ab6f8bce6bbddd8ce3e287e1a517c1f5e348e',
			},
			{
				'rafamadriz/friendly-snippets',
				commit = 'aec79d4dade18936588405d53a020b0c9bb9c5f6',
			},
		}
	}
	use {
		'folke/neodev.nvim',
		commit = '7c6999ba7d8fdf36991b0aeed034b0cb299ce1eb',
	}
	use {
		'RRethy/vim-illuminate',
		commit = '49062ab1dd8fec91833a69f0a1344223dd59d643',
	}
	use {
		'sbulav/nredir.nvim',
		commit = '68226e06a583f1fac43b19283d255f18e7016b0b',
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ":TSUpdate",
	}
	use {
		'nvim-telescope/telescope.nvim',
		commit = 'f48a7178edf74f99c908e04c21f5e714d0b77ecd',
	}

 	use {
		'karb94/neoscroll.nvim',
		commit = 'd38b613f9177f3ca40dc8958314fce1d77939fc2',
	}
	use {
		'nvim-telescope/telescope-symbols.nvim',
		commit = '1b00054cad9b68a329e4aee7dc114d2e7c0a8bda'
	}


	-- Automatically setup your config after cloning packer.nvim
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
