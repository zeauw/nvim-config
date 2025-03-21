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

    {"williamboman/mason.nvim",
    config = function()
	    require("mason").setup()
    end},
    {"williamboman/mason-lspconfig.nvim",
    config = function()
	    require("mason-lspconfig").setup()
	    require("mason-lspconfig").setup_handlers{
                function (server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {}
                end,
	    }
    end},

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

    {"iurimateus/luasnip-latex-snippets.nvim",
    config = function()
            require('luasnip-latex-snippets').setup({ use_treesitter = true, allow_on_markdown = true, })
            require("luasnip").config.setup({ enable_autosnippets = true })
        end,
    },

    {'Vigemus/iron.nvim'},

    {'numToStr/Comment.nvim',
    config=function()
        require('Comment').setup()
    end
    },

    {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
      },
    },

    {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
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
