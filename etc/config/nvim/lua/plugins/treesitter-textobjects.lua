---@module "lazy"
---@type LazySpec
return {
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
}
