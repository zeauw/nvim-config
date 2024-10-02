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

	{"lewis6991/gitsigns.nvim",
	config=function()
		require('lualine').setup()
	end},
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
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config=function()
		require('lualine').setup()
	end},

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

	{"wakatime/vim-wakatime", lazy = false},

	{'Vigemus/iron.nvim'},

	{'numToStr/Comment.nvim',
	config=function()
		require('Comment').setup()
	end
	},

	{
	"amitds1997/remote-nvim.nvim",
	version = "*", -- Pin to GitHub releases
	dependencies = {
		"nvim-lua/plenary.nvim", -- For standard functions
		"MunifTanjim/nui.nvim", -- To build the plugin UI
		"nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
		},
	config = true,
	},

	{
	"CopilotC-Nvim/CopilotChat.nvim",
	branch = "canary",
	dependencies = {
		{ "github/copilot.vim" }, -- or github/copilot.vim
		{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
	},
	build = "make tiktoken", -- Only on MacOS or Linux
	opts = {
	debug = true, -- Enable debugging
	-- See Configuration section for rest
	window = {
		layout = 'vertical',
	}
	},
	-- See Commands section for default commands if you want to lazy load on them
	},
})
