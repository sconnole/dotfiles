local fn = vim.fn

return require("packer").startup(function(use)
	-- Plugin manager, to make sure you don't try to delete it.
	use("wbthomason/packer.nvim")
	
  -- LUA formatter
  use({ "mhartington/formatter.nvim", config = require("plugins.configs.formatter") })
	-- Additional vim targets, for smoother text-object motions
	use("wellle/targets.vim")

	-- motions, press `s` then any character, then look where you want to go to hit THAT character.
	use("easymotion/vim-easymotion")

	-- Scrolling is less annoying with this, for people following your code
	use("yuttie/comfortable-motion.vim")

	-- a good git plugin.
	use("tpope/vim-fugitive")

	-- file explorer.
	use({
		"kyazdani42/nvim-tree.lua",
		config = require("plugins.configs.nvimtree"), -- notice this is a config from our docs
	})

  	-- TreeSitter 
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = require("plugins.configs.treesitter"),
	})

	-- Utility for all the things
	use "nvim-lua/plenary.nvim"

	-- Color Scheme
	use({
		'folke/tokyonight.nvim', 
		config = require("plugins.configs.tokyonight")
	})

	-- TS LSP
	use("jose-elias-alvarez/typescript.nvim")

	-- Prettier
	use('neovim/nvim-lspconfig')
	use('jose-elias-alvarez/null-ls.nvim')
	use({'MunifTanjim/prettier.nvim', config = require("plugins.configs.prettier")})
end)
