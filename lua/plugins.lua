local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	"lewis6991/gitsigns.nvim",
	"neovim/nvim-lspconfig",

	{"ahmedkhalf/project.nvim",
	config = function()
		require("project_nvim").setup {}
	end
	},

	-- auto completion
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	{"L3MON4D3/LuaSnip",
	version = "v2.*"},
	
	{"nvim-tree/nvim-tree.lua",
  	version = "*",
  	lazy = false,
  	dependencies = {
    	"nvim-tree/nvim-web-devicons",
  	},
  	config = function()
	require("nvim-tree").setup {}
	end
	},

	{'akinsho/bufferline.nvim',
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons'},

	{'nvim-lualine/lualine.nvim',
    	dependencies = { 'nvim-tree/nvim-web-devicons' }},

	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",

	"EdenEast/nightfox.nvim",

	"github/copilot.vim",

	{'nvim-telescope/telescope.nvim',
	tag = '0.1.6',
      	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		require('telescope').load_extension('projects')
	end
	},

	{'nvim-orgmode/orgmode',
  	event = 'VeryLazy',
  	ft = { 'org' },
  	},

	"dhruvasagar/vim-table-mode",

	{"NeogitOrg/neogit",
  	dependencies = {
    	"nvim-lua/plenary.nvim",         -- required
    	"sindrets/diffview.nvim",        -- optional - Diff integration

    	-- Only one of these is needed, not both.
    	"nvim-telescope/telescope.nvim", -- optional
    	-- "ibhagwan/fzf-lua",              -- optional
  	},
  	config = true},
	
	{"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function () 
	local configs = require("nvim-treesitter.configs")
	configs.setup({
		ensure_installed = 'all',
		ignore_install = { 'org' },
		highlight = { enable = true },
        })
	end},

	{"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	build = function() vim.fn["mkdp#util#install"]() end,},
})

require('lualine').setup()
require('gitsigns').setup()
