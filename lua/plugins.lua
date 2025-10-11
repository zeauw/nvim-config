local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

    {
        "lewis6991/gitsigns.nvim",
        config = function() require('lualine').setup() end
    },

    "neovim/nvim-lspconfig",

    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp", -- auto completion

    {
        "L3MON4D3/LuaSnip",
        version = "v2.*"
    },

    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function() require("nvim-tree").setup {} end
    },

    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons'
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = {'nvim-tree/nvim-web-devicons'}
    },

    {
        "williamboman/mason.nvim",
        config = function() require("mason").setup() end
    },

    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({automatic_enable = true})
        end
    },

    "mhartington/formatter.nvim",

    {
        'nvim-telescope/telescope-project.nvim',
        dependencies = {'nvim-telescope/telescope.nvim'}
    },

    {
        'shaunsingh/nord.nvim',
        lazy = false,
        priority = 1000
    },

    "github/copilot.vim",

    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {'nvim-lua/plenary.nvim'},
        config = function()
            require('telescope').load_extension('project')
            require("telescope").load_extension('file_browser')
        end
    },


    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim"
        }
    },

    {
        'nvim-orgmode/orgmode',
        event = 'VeryLazy',
        ft = {'org'}
    },

    "dhruvasagar/vim-table-mode",

    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim", -- required
            "sindrets/diffview.nvim", -- optional - Diff integration
            "nvim-telescope/telescope.nvim" -- optional
        },
        config = true
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                auto_install = true,
                ignore_install = {'org'},
                highlight = {enable = true}
            })
        end
    },

    {
        "iurimateus/luasnip-latex-snippets.nvim",
        config = function()
            require('luasnip-latex-snippets').setup({
                use_treesitter = true,
                allow_on_markdown = true,
            })
            require("luasnip").config.setup({enable_autosnippets = true})
        end
    },

    'Vigemus/iron.nvim',

    {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({global = false})
                end,
                desc = "Buffer Local Keymaps (which-key)"
            }
        }
    },

    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "main",
        dependencies = {
            {"github/copilot.vim"}, -- or github/copilot.vim
            {"nvim-lua/plenary.nvim"} -- for curl, log wrapper
        },
        build = "make tiktoken", -- Only on MacOS or Linux
        opts = {
            debug = true, -- Enable debugging
            -- See Configuration section for rest
            window = {layout = 'vertical'}
        }
        -- See Commands section for default commands if you want to lazy load on them
    },

    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)"
            }, {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)"
            }, {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)"
            }, {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)"
            }, {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)"
            }, {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)"
            }
        }
    },

    "mfussenegger/nvim-dap",
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio"
        }
    },

    {
        "keaising/im-select.nvim",
        config = function()
            require("im_select").setup({})
        end,
    },

    {
        'MeanderingProgrammer/render-markdown.nvim',
        ft = { 'markdown' },
    },

    {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            { "<leader>pi", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
        },
    },

    {
        "3rd/image.nvim",
        build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
        opts = {
            backend = "kitty",
            processor = "magick_cli",
        }
    },

    {
        "zk-org/zk-nvim",
        config = function()
            require("zk").setup({
                picker = "telescope"
            })
        end
    }

})
