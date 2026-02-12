return {
    -- {
    --    "github/copilot.vim",
    --     enabled = false,
    -- },
    -- {
    --     "zbirenbaum/copilot.lua",
    --     enabled = false,
    --     lazy = false,
    --     -- opts for use with copilot-cmp
    --     opts = {
    --         panel = { enabled = false },
    --         suggestion = { enabled = false },
    --         filetypes = { ["*"] = true },
    --         copilot_node_command = 'node', -- Node.js version must be > 16.x
    --         server_opts_overrides = {},
    --     }
    -- },
    -- {
    --     "zbirenbaum/copilot-cmp",
    --     dependencies = { "copilot.lua" },
    --     opts = {},
    -- },
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*",
        -- install jsregexp (optional!).
        -- build = "make install_jsregexp"
    },
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        ft = "norg",
        opts = {
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
                ["core.norg.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/notes",
                        },
                    },
                },
            },
        },
        -- dependencies = { { "nvim-lua/plenary.nvim" } },
    },
    {
        "nvim-lualine/lualine.nvim",
        -- dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
    },
    { "windwp/nvim-autopairs", opts = {} },
    -- { "nvim-mini/mini.nvim", version = false },
    { "folke/trouble.nvim", opts = {}, cmd = "Trouble" },
    {
        "folke/todo-comments.nvim",
        -- dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            highlight = {
                before = "", -- "fg" or "bg" or empty
                keyword = "bg", -- "wide" or "bg" or empty. (wide is the same as bg, but will also highlight surrounding characters)
                after = "", -- "fg" or "bg" or empty
                pattern = [[.*<(KEYWORDS).*:]], -- pattern used for highlightng (vim regex)
                comments_only = true, -- uses treesitter to match keywords in comments only
                max_line_len = 400, -- ignore lines longer than this
                exclude = {}, -- list of file types to exclude highlighting
            },
        },
    },
    { "lewis6991/spaceless.nvim", opts = {} },
    { "lewis6991/gitsigns.nvim", opts = {} },
    { 'TimUntersberger/neogit', opts = {} },
}
