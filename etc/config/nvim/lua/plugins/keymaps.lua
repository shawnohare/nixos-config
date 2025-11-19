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
    { "<leader>b", group = "buffers", expand = function()
            return require("which-key.extras").expand.buf()
        end
    },
    { "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
    { "<leader>bd", "<cmd>bd<cr>", desc = "Delete Buffer" },
    { "<leader>bn", "<cmd>enew<cr>", desc = "New" },
    { "<leader>bj", "<cmd>bn<cr>", desc = "Next Buffer"},
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
    { "<leader>xX", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics: Workspace (Trouble)", },
    { "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Diagnostics: Buffer (Trouble)" },
    { "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Location List" },
    { "<leader>xq", "<cmd>Trouble quickfix toggle<cr>", desc = "Quickfix" },
    { "<leader>xr", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP (Trouble)", },
    { "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)", },
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
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "",  -- in ("class", "modern", "helix")
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
    -- config = function()
    --     local wk = require("which-key")
    --     wk.add({
    --       { "<leader>f", group = "Files" },
    --     })
    -- end


    -- begin original config
    -- config = function()
    --     local wk = require("which-key")
    --     wk.setup()
    --     -- FIXME (2025-11-18): Below is old version of spec
    --     wk.register({
    --         ["g"] = {
    --             R = { "<cmd>TroubleToggle lsp_references<cr>", "lsp references" },
    --             d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "definition" },
    --         },
    --         ["<leader>"] = {
    --             b = {
    --                 name = "+buffer",
    --                 b = { "<cmd>Telescope buffers<cr>", "buffers" },
    --                 d = { "<cmd>bd<cr>", "delete" },
    --                 e = { "<cmd>enew<cr>", "new" },
    --                 h = { "<cmd>bp<cr>", "previous" },
    --                 l = { "<cmd>bn<cr>", "next" },
    --                 n = { "<cmd>enew<cr>", "new" },
    --                 p = { "<cmd>bp<cr>", "previous" },
    --                 s = { "<cmd>split<cr>", "split" },
    --                 v = { "<cmd>vsplit<cr>", "vert split" },
    --             },
    --             d = {
    --                 name = "+debug",
    --                 b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "toggle breakpoint" },
    --                 c = { "<cmd>lua require'dap'.continue()<cr>", "continue" },
    --                 i = { "<cmd>lua require'dap'.step_into()<cr>", "step into" },
    --                 o = { "<cmd>lua require'dap'.step_over()<cr>", "step over" },
    --                 u = { "<cmd>lua require'dap'.step_out()<cr>", "step out" },
    --                 r = { "<cmd>lua require'dap'.repl.open()<cr>", "repl" },
    --                 s = { "<cmd>lua require'dap'.continue()<cr>", "start" },
    --             },
    --             f = {
    --                 name = "+find",
    --                 b = { "<cmd>Telescope buffers<cr>", "buffers" },
    --                 e = { "<cmd>NvimTreeToggle<cr>", "explorer" },
    --                 f = { "<cmd>Telescope find_files<cr>", "files" },
    --                 g = { "<cmd>Telescope live_grep<cr>", "grep" },
    --                 h = { "<cmd>Telescope help_tags<cr>", "help" },
    --                 m = { "<cmd>Telescope marks<cr>", "marks" },
    --                 r = { "<cmd>Telescope oldfiles<cr>", "recent files" },
    --                 t = { "<cmd>TodoTelescope<cr>", "todos" },
    --                 w = { "<cmd>Telescope file_browser<cr>", "file browser" },
    --             },
    --             g = {
    --                 name = "+git",
    --                 b = { "<cmd>Neogit branch<cr>", "branch" },
    --                 c = { "<cmd>Neogit commit<cr>", "commit" },
    --                 s = { "<cmd>Neogit<cr>", "status" },
    --                 -- b = {"<cmd>Telescope git_branches<cr>", "branch"},
    --                 -- c = {"<cmd>Telescope git_commits<cr>", "commit"},
    --                 -- s = {"<cmd>Telescope git_status<cr>", "status"},
    --             },
    --             h = {
    --                 name = "+help",
    --                 h = { "<cmd>Telescope help_tags<cr>", "help" },
    --                 t = { "<cmd>TodoTelescope<cr>", "todos" },
    --                 k = { "<cmd>Telescope keymaps<cr>", "keymaps" },
    --             },
    --             l = {
    --                 name = "+lsp",
    --                 D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "declaration" },
    --                 R = { "<cmd>lua vim.lsp.buf.references()<cr>", "references" },
    --                 S = { "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>", "workspace symbols" },
    --                 a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "code action" },
    --                 d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "definition" },
    --                 f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "format" },
    --                 h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "hover" },
    --                 i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "implementation" },
    --                 r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "rename" },
    --                 s = { "<cmd>lua vim.lsp.buf.document_symbol()<cr>", "document symbols" },
    --                 t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "type definition" },
    --             },
    --             x = {
    --                 name = "+trouble (diagnostics)",
    --                 x = { "<cmd>TroubleToggle<cr>", "toggle" },
    --                 w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace diagnostics" },
    --                 d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document diagnostics" },
    --                 l = { "<cmd>TroubleToggle loclist<cr>", "location list" },
    --                 q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
    --                 r = { "<cmd>TroubleToggle lsp_references<cr>", "lsp references" },
    --                 f = { "<cmd>lua vim.diagnostic.open_float()<CR>" },
    --                 -- l = {"<cmd>lua vim.diagnostic.setloclist()<CR>"},
    --                 n = { "<cmd>lua vim.diagnostic.goto_next()<CR>" },
    --                 p = { "<cmd>lua vim.diagnostic.goto_prev()<CR>" },
    --                 -- q = {"<cmd>lua vim.diagnostic.setqflist()<CR>"}
    --             },
    --         },
    --     })
    -- end
}
