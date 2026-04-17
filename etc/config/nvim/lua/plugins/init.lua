-- which-key v3 spec
-- default mode is "n" (normal).
local keymaps = {

	{ "gR", "<cmd>TroubleToggle lsp_references<cr>", desc = "LSP References" },
	{ "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "LSP Definition" },
	{ "<leader>w", proxy = "<c-w>", group = "windows" }, -- proxy to window mappings
	-- files
	{ "<leader>f", group = "Files" },
	{ "<leader>fe", "<cmd>NvimTreeToggle<cr>", desc = "File Explorer" },
	{ "<leader>fe", "<cmd>NvimTreeToggle<cr>", desc = "File Explorer" },
	{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
	{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "grep" },
	{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags (Telescope)" },
	{ "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Marks (Telescope)" },
	{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
	{ "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "todos" },
	{ "<leader>fw", "<cmd>Telescope file_browser<cr>", desc = "File Browser" },
	-- buffer
	{
		"<leader>b",
		group = "buffers",
		expand = function()
			return require("which-key.extras").expand.buf()
		end,
	},
	{ "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
	{ "<leader>bd", "<cmd>bd<cr>", desc = "Delete Buffer" },
	{ "<leader>bn", "<cmd>enew<cr>", desc = "New" },
	{ "<leader>bj", "<cmd>bn<cr>", desc = "Next Buffer" },
	{ "<leader>bk", "<cmd>bp<cr>", desc = "Previous Buffer" },
	{ "<leader>bs", "<cmd>split<cr>", desc = "Split" },
	{ "<leader>bvs", "<cmd>vsplit<cr>", desc = "Vertical Split" },
	-- help
	{ "<leader>hk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
	-- lsp
	{ "<leader>l", group = "LSP" },
	{ "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
	{ "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Definition" },
	{ "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "Declaration" },
	{ "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>", desc = "Format" },
	{ "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover" },
	{ "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "Implementation" },
	{ "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
	{ "<leader>lR", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "References" },
	{ "<leader>ls", "<cmd>lua vim.lsp.buf.document_symbol()<cr>", desc = "Symbols: Document" },
	{ "<leader>lS", "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>", desc = "Symbols: Workspace" },
	{ "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", desc = "Type Definition" },
	-- diagnostics
	{ "<leader>x", group = "Diagnostics" },
	{ "<leader>xX", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics: Workspace (Trouble)" },
	{ "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Diagnostics: Buffer (Trouble)" },
	{ "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Location List" },
	{ "<leader>xq", "<cmd>Trouble quickfix toggle<cr>", desc = "Quickfix" },
	{ "<leader>xr", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP (Trouble)" },
	{ "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
	{ "<leader>xt", "<cmd>Trouble todo toggle filter.buf=0<cr>", desc = "Todo:  Buffer (Trouble)" },
	{ "<leader>xT", "<cmd>Trouble todo toggle<cr>", desc = "Todo: Workspacde (Trouble)" },
	-- { "<leader>xf", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Open Float", },
	-- l = { "<leader>xl",  "<cmd>lua vim.diagnostic.setloclist()<CR>"},
	-- { "<leader>xj", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Next", },
	-- { "<leader>xk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "Previous", },
	-- q = {"<cmd>lua vim.diagnostic.setqflist()<CR>"}
	-- end diagnostics
	-- {
	--     -- Nested mappings are allowed and can be added in any order
	--     -- Most attributes can be inherited or overridden on any level
	--     -- There's no limit to the depth of nesting
	--     mode = { "n", "v" }, -- NORMAL and VISUAL mode
	--     { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
	--     { "<leader>w", "<cmd>w<cr>", desc = "Write" },
	-- },
}

return {
    -- colors
    { "hadalized/hadalized.nvim" },
	{
		"eero-lehtinen/oklch-color-picker.nvim",
		event = "VeryLazy",
		version = "*",
		keys = {
			-- One handed keymap recommended, you will be using the mouse
			{
				"<leader>v",
				function()
					require("oklch-color-picker").pick_under_cursor({})
				end,
				desc = "Color pick under cursor",
			},
		},
		opts = {
			highlight = {
				style = "foreground",
			},
		},
	},
    -- dependencies
	{ "nvim-lua/popup.nvim", lazy = true },
	{ "nvim-lua/plenary.nvim", lazy = true },
    { "nvim-tree/nvim-web-devicons" },
    -- basic functionality
	{ "windwp/nvim-autopairs", opts = {} },
	{ "lewis6991/spaceless.nvim", opts = {} },
	{ "folke/trouble.nvim", opts = {}, cmd = "Trouble" },
    -- UI
	{ "lewis6991/gitsigns.nvim", },
    { "nvim-lualine/lualine.nvim" },
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
	{
	       "nvim-tree/nvim-tree.lua",
           lazy = false,
	       config = function()
	           require("nvim-tree").setup()
	       end,
	 },
    -- LSP
	{ "mason-org/mason.nvim", opts = {} },
    { "neovim/nvim-lspconfig" },
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"biome", -- js, json
				"bashls",
				-- "fennel_language_server",
				"html",
				"lua_ls",
				"pyright",
				"ruff",
				"marksman",
				"prosemd_lsp",
				-- "nil_ls",    -- nix, TODO: cannot compile in some cases?
				-- "teal_ls",   -- TODO: luarocks issue
				"taplo", -- toml
				"terraformls",
				"tflint",
				"lemminx", -- xml
				"yamlls",
				-- "yaml-language-server",
				-- "yamllint",
				-- "pyright",
				-- "pylint",
			},
		},
	},

    -- keymaps
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            preset = "", -- in ("class", "modern", "helix")
            -- delay = 100,
            spec = keymaps,
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

    -- DAP
	-- {
	--     "rcarriga/nvim-dap-ui",
	--     dependencies = {
	--            "mfussenegger/nvim-dap",
	--            "nvim-neotest/nvim-nio",
	--     },
	--    },
	-- {
    -- Plugin development
	-- 	"folke/lazydev.nvim",
	-- 	ft = "lua", -- only load on lua files
	-- 	opts = {
	-- 		library = {
	-- 			-- See the configuration section for more details
	-- 			-- Load luvit types when the `vim.uv` word is found
	-- 			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
	-- 			"nvim-dap-ui",
	-- 		},
	-- 	},

    -- Treesitter
    -- NOTE: neovim 0.12 might obviate nvim-treesitter to some extent
    -- Moreover, nvim-treesitter/nvim-treesitter was archived 2026-04-03 (drama).
    -- There is a forked neovim-treesitter/nvim-treesitter plugin.
    -- https://samuellawrentz.com/blog/nvim-treesitter-archived-neovim-0-12-migration/
    -- https://www.qu8n.com/posts/treesitter-migration-guide-for-nvim-0-12
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        dependencies = {
            {
                "nvim-treesitter/nvim-treesitter-context",
                opts = {
                    max_lines = 4,
                    multiline_threshold = 2,
                },
            },
        },
        config = function()
            local ts = require("nvim-treesitter")
            -- https://github.com/tree-sitter/tree-sitter/wiki/List-of-parsers
            local parsers = {
                "bash",
                "bibtex",
                "comment",
                "css",
                "csv",
                "diff",
                "dockerfile",
                "elixir",
                "git_config",
                "gitcommit",
                "gitignore",
                "graphql",
                "groovy",
                "go",
                "heex",
                "hcl",
                "html",
                "http",
                "ini",
                "java",
                "javascript",
                "jq",
                "jinja",
                "jinja_inline",
                "jsdoc",
                "json",
                "json5",
                "just",
                "latex",
                -- "lean",
                "lua",
                "make",
                "markdown",
                "markdown_inline",
                "nix",
                "nu",
                -- "org",
                "perl",
                -- "plantuml",
                "pymanifest",
                "python",
                "regex",
                "robot",
                "robots_txt",
                "rst",
                "rust",
                "scala",
                "scss",
                "ssh_config",
                "sql",
                "terraform",
                "typst",
                "toml",
                "tsv",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
                "yaml",
            }
            for _, parser in ipairs(parsers) do
                ts.install(parser)
            end

            -- Not every tree-sitter parser is the same as the file type detected
            -- So the patterns need to be registered more cleverly
            local patterns = {}
            for _, parser in ipairs(parsers) do
                local parser_patterns = vim.treesitter.language.get_filetypes(parser)
                for _, pp in pairs(parser_patterns) do
                    table.insert(patterns, pp)
                end
            end

            vim.treesitter.language.register("groovy", "Jenkinsfile")
            vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
            vim.wo[0][0].foldmethod = "expr"

            vim.api.nvim_create_autocmd("FileType", {
                pattern = patterns,
                callback = function()
                    vim.treesitter.start()
                end,
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        dependencies = { "nvim-treesitter/nvim-treesitter", branch = "main" },
        init = function()
            vim.g.no_plugin_maps = true
        end,
        config = function()
            require("nvim-treesitter-textobjects").setup({
                select = {
                    -- Automatically jump forward to textobj, similar to targets.vim
                    lookahead = true,
                    -- You can choose the select mode (default is charwise 'v')

                    selection_modes = {
                        ["@parameter.outer"] = "v", -- charwise
                        ["@function.outer"] = "V", -- linewise
                        ["@class.outer"] = "<c-v>", -- blockwise
                    },
                    include_surrounding_whitespace = false,
                },
                move = {
                    -- whether to set jumps in the jumplist
                    set_jumps = true,
                },
            })

            -- Selects
            --     local select = require "nvim-treesitter-textobjects.select"
            --     vim.keymap.set({ "x", "o" }, "am", function()
            --         select.select_textobject("@function.outer", "textobjects")
            --     end)
            --     vim.keymap.set({ "x", "o" }, "im", function()
            --         select.select_textobject("@function.inner", "textobjects")
            --     end)
            --     vim.keymap.set({ "x", "o" }, "ac", function()
            --         select.select_textobject("@class.outer", "textobjects")
            --     end)
            --     vim.keymap.set({ "x", "o" }, "ic", function()
            --         select.select_textobject("@class.inner", "textobjects")
            --     end)
            --     -- You can also use captures from other query groups like `locals.scm`
            --     vim.keymap.set({ "x", "o" }, "as", function()
            --         select.select_textobject("@local.scope", "locals")
            --     end)
            --
            --     -- Swaps
            --     local swap = require("nvim-treesitter-textobjects.swap")
            --     vim.keymap.set("n", "<leader>a", function()
            --         swap.swap_next "@parameter.inner"
            --     end)
            --     vim.keymap.set("n", "<leader>A", function()
            --         swap.swap_previous "@parameter.outer"
            --     end)
            --
            --
            --     local move = require("nvim-treesitter-textobjects.move")
            --     vim.keymap.set({ "n", "x", "o" }, "]m", function()
            --         move.goto_next_start("@function.outer", "textobjects")
            --     end)
            --     vim.keymap.set({ "n", "x", "o" }, "]]", function()
            --         move.goto_next_start("@class.outer", "textobjects")
            --     end)
            --     -- You can also pass a list to group multiple queries.
            --     vim.keymap.set({ "n", "x", "o" }, "]o", function()
            --         move.goto_next_start({ "@loop.inner", "@loop.outer" }, "textobjects")
            --     end)
            --     -- You can also use captures from other query groups like `locals.scm` or `folds.scm`
            --     vim.keymap.set({ "n", "x", "o" }, "]s", function()
            --         move.goto_next_start("@local.scope", "locals")
            --     end)
            --     vim.keymap.set({ "n", "x", "o" }, "]z", function()
            --         move.goto_next_start("@fold", "folds")
            --     end)
            --
            --     vim.keymap.set({ "n", "x", "o" }, "]M", function()
            --         move.goto_next_end("@function.outer", "textobjects")
            --     end)
            --     vim.keymap.set({ "n", "x", "o" }, "][", function()
            --         move.goto_next_end("@class.outer", "textobjects")
            --     end)
            --
            --     vim.keymap.set({ "n", "x", "o" }, "[m", function()
            --         move.goto_previous_start("@function.outer", "textobjects")
            --     end)
            --     vim.keymap.set({ "n", "x", "o" }, "[[", function()
            --         move.goto_previous_start("@class.outer", "textobjects")
            --     end)
            --
            --     vim.keymap.set({ "n", "x", "o" }, "[M", function()
            --         move.goto_previous_end("@function.outer", "textobjects")
            --     end)
            --     vim.keymap.set({ "n", "x", "o" }, "[]", function()
            --         move.goto_previous_end("@class.outer", "textobjects")
            --     end)
            --
            --     -- Go to either the start or the end, whichever is closer.
            --     -- Use if you want more granular movements
            --     vim.keymap.set({ "n", "x", "o" }, "]d", function()
            --         move.goto_next("@conditional.outer", "textobjects")
            --     end)
            --     vim.keymap.set({ "n", "x", "o" }, "[d", function()
            --         move.goto_previous("@conditional.outer", "textobjects")
            --     end)
            --
            --     local ts_repeat_move = require "nvim-treesitter-textobjects.repeatable_move"
            --
            --     -- Repeat movement with ; and ,
            --     -- ensure ; goes forward and , goes backward regardless of the last direction
            --     vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
            --     vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
            --
            --
            --     -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
            --     vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
            --     vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
            --     vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
            --     vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
        end,
    },

    -- Completion
	{ "L3MON4D3/LuaSnip", version = "v2.*" },
    {   -- vim.o.autocomplete = true might mitigate all of this?
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            "petertriho/cmp-git",
            "onsails/lspkind-nvim",
        },
        config = function()
            local cmp = require("cmp")
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            local lspkind = require("lspkind")

            cmp.setup({
                formatting = {
                    format = lspkind.cmp_format({
                        mode = "symbol_text",
                        show_labelDetails = true,
                        -- mode = "symbol",
                        -- preset = 'codicons'
                        -- Can add more control.
                        before = function(entry, vim_item)
                            return vim_item
                        end,
                    }),
                },
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },

                mapping = cmp.mapping.preset.insert({
                    -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = false,
                    }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = "copilot", group_index = 2 },
                    { name = "nvim_lsp" },
                    { name = "nvim_lua" },
                    { name = "luasnip" }, -- For luasnip users.
                }, {
                    { name = "buffer" },
                }),
            })

            -- Set configuration for specific filetype.
            cmp.setup.filetype("gitcommit", {
                sources = cmp.config.sources({
                    { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
                }, {
                    { name = "buffer" },
                }),
            })

            -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline("/", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                }, {
                    { name = "cmdline" },
                }),
            })

            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
    },

    -- Infrequently used
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-telescope/telescope.nvim" },
	{ "TimUntersberger/neogit", opts = {} },
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
}
