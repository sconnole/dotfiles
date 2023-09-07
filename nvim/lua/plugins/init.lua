local fn = vim.fn

return require("packer").startup(function(use)
	-- Plugin manager, to make sure you don't try to delete it.
	use("wbthomason/packer.nvim")

	-- Searching
	use("junegunn/fzf")
	use({
		"junegunn/fzf.vim",
		config = require("plugins.configs.fzf"),
		run = function()
			fn["fz#install()"](0)
		end,
	})
    
    use("towolf/vim-helm")

	--Icons
	use("nvim-tree/nvim-web-devicons")
	-- LUA formatter
	use("mhartington/formatter.nvim")

	-- Additional vim targets, for smoother text-object motions
	use("wellle/targets.vim")

	-- Scrolling is less annoying with this, for people following your code
	use("yuttie/comfortable-motion.vim")

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
	use("nvim-lua/plenary.nvim")

	-- Color Scheme
	use({
		"folke/tokyonight.nvim",
		config = require("plugins.configs.tokyonight"),
	})

	-- TS LSP
	use("jose-elias-alvarez/typescript.nvim")

    -- Show function definintions
    use({
        "ray-x/lsp_signature.nvim",
        config = function()
            require "lsp_signature".on_attach()
        end
    })

	-- Prettier
	use("neovim/nvim-lspconfig")
	use("jose-elias-alvarez/null-ls.nvim")
	use({ "MunifTanjim/prettier.nvim" })

	-- GIT settings
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = require("plugins.configs.gitsigns"),
	})
	use("tpope/vim-fugitive")
    use("zivyangll/git-blame.vim") -- Git blame

	-- Allow easy commenting
	use({
		"numToStr/Comment.nvim",
		config = require("Comment").setup(),
	})

    -- Async Lint Engine
    use({
        "dense-analysis/ale",
        config = require("plugins.configs.ale"),
    })

    -- Autocomplete
    use({
		"hrsh7th/nvim-cmp",
		config = require("plugins.configs.cmp"),
		requires = {
			"hrsh7th/cmp-buffer", --
			"ray-x/cmp-treesitter", --
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-emoji",
			"onsails/lspkind-nvim",
			"hrsh7th/cmp-nvim-lsp-signature-help",
		},
	}) 

    -- snippets
	use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")

    --languages
    use("fatih/vim-go")
	use("pangloss/vim-javascript")
	use("leafgarland/typescript-vim")
	use("peitalin/vim-jsx-typescript")
	use("styled-components/vim-styled-components")
	use("ellisonleao/glow.nvim") -- README

end)
