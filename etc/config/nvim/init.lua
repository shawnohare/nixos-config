-- An example config that explore the neovim builtin package manager
-- https://echasnovski.com/blog/2026-03-13-a-guide-to-vim-pack#migrate
-- is a useful reference.
--
-- For some good option listings https://tduyng.com/blog/neovim-basic-setup/
vim.loader.enable()

-- ==========================================================================
-- Helpers
-- ==========================================================================
---@param path string The group/repo string.
local gh = function(path)
    return "https://github.com/" .. path
end

-- Issue a lua command string for use in keymaps.
---@param command string The `:lua ` command to run
local lua = function(command)
    return "<cmd>lua " .. command .. "<CR>"
end

local map = vim.keymap.set

-- ==========================================================================
-- Options
-- ==========================================================================
require('vim._core.ui2').enable()
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded_netrw = 1  -- disable netrw when using other file explorers
vim.g.loaded_netrwPlugin = 1
vim.o.autochdir = true
-- o.autocomplete = true  -- to use builtin, set to true
vim.o.autowrite = false -- :wqa write when moving to other buffers/windows
vim.o.background = "dark"
vim.o.cmdheight = 0
vim.o.colorcolumn = "+1"
vim.o.confirm = true
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.foldcolumn = "0"
vim.o.foldenable = true
vim.o.foldlevelstart = 99
vim.o.foldmethod = "indent"
vim.o.foldnestmax = 8
vim.o.termguicolors = true
vim.opt.clipboard:append("unnamedplus")
vim.opt.complete:append("o")
vim.opt.completeopt = { "noinsert", "menu", "menuone", "noselect" }
-- o.formatoptions:remove('tc')
vim.o.formatoptions = "roql"
vim.o.guifont = "JetBrainsMono Nerd Font"
vim.o.hidden = true
vim.opt.iskeyword:append("-") -- Treat dash as part of word
vim.o.ignorecase = true
vim.o.inccommand = "nosplit"
vim.o.linebreak = true
vim.opt.listchars = {
    tab = "=>",
    trail = "·",
    lead = "·",
    extends = "◣",
    precedes = "◢",
    nbsp = "○",
    eol = "↵",
}
vim.o.modeline = false -- security risk?
vim.o.mouse = "a"
vim.o.number = true
vim.o.numberwidth = 4
vim.o.pumblend = 0 -- how opaque popup menu is
vim.o.pumborder = "rounded"
-- vim.o.pummaxwidth = 40
vim.o.pumwidth = 40 -- min width
-- vim.o.pumheight = 100  -- max height
vim.o.scrolljump = 1
vim.o.scrolloff = 5
vim.o.shiftwidth = 4
vim.opt.shortmess:append("A")
vim.o.showcmd = true
vim.o.showmatch = true
vim.o.showmode = false
vim.o.signcolumn = "yes"
vim.o.smartcase = true
vim.o.softtabstop = 4
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.tabstop = 4
vim.o.textwidth = 79
vim.o.title = true
vim.o.undofile = true
vim.o.undolevels = 1000
vim.o.wildmenu = true
vim.o.wildoptions = "pum"
vim.o.wrap = false

-- Some servers generate excessive logs. Disable to debug logs.
vim.lsp.log.set_level("off")

-- # plugins ==>
-- NOTE: Arborist. Indent seems to not respect when one is in a func in python.
-- ## treesitter

-- file managers / tree view
-- We do not often use these, but some candidates are
-- - oil (vim-vinegar like, the tree view is a regular buffer so easy to use)
-- - nvim-tree (good for basic viewing)
-- - neo-tree (can hook into lsp renames, which could be useful)
-- - yazi (cli app)
-- - triptych (floating windows?)

vim.pack.add({
    { src = gh("neovim-treesitter/treesitter-parser-registry") }, -- dep
    { src = gh("neovim-treesitter/nvim-treesitter") },
    -- gh("arborist-ts/arborist.nvim"),
    { src = gh("hadalized/hadalized.nvim") },        -- colorscheme
    { src = gh("mason-org/mason.nvim") },            -- handles installation of lsp tools
    { src = gh("neovim/nvim-lspconfig") },           -- contains lsp server configs
    { src = gh("mason-org/mason-lspconfig.nvim") },  --  allows auto attach
    { src = gh("nvim-tree/nvim-web-devicons") },
    -- gh("nvim-tree/nvim-tree.lua"),  -- can use snacks.explorer
    -- gh("nvim-lua/plenary.nvim"),  -- dep: neo-tree
    -- gh("MunifTanjim/nui.nvim"),   -- dep: neo-tree
    -- {
    --     src = gh("nvim-neo-tree/neo-tree.nvim"),
    --     version = vim.version.range('3')
    -- },
    { src = gh("rafamadriz/friendly-snippets") }, -- dep for autocomplete snippets
    { src = gh("saghen/blink.cmp"), version = vim.version.range("1.x") },  -- rewrite happening
    { src = gh("folke/snacks.nvim") },
    { src = gh("nvim-mini/mini.nvim") },
    { src = gh("nvim-lualine/lualine.nvim") },
    { src = gh("lewis6991/gitsigns.nvim") },
    { src = gh("lewis6991/spaceless.nvim") },
    { src = gh("folke/trouble.nvim") },
    { src = gh("folke/which-key.nvim") },
    { src = gh("folke/todo-comments.nvim") },
    { src = gh("windwp/nvim-autopairs.git") },
    { src = gh("eero-lehtinen/oklch-color-picker.nvim") },
})

vim.cmd.colorscheme("hadalized")


-- Arborist is a new (2026-04) package that autoinstalls parsers. It handles all the
-- boilerplate treesitter, which is quite nice.
-- require("arborist").setup()

-- require("nvim-tree").setup()
-- require("neo-tree")

-- treesitter config
-- NOTE: The original `nvim-treesitter` was archived on 2026-04
-- neovim-treesitter/nvim-treesitter is a fork of nvim-treesitter
-- To use, one can include the following code and install parsers with
-- :TSInstall <language>
--
-- -- autostart treesitter if the language is installed.
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("tree-sitter-enable", { clear = true }),
    callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match)
        if not lang or not vim.treesitter.language.add(lang) then
            return
        end

        if vim.treesitter.query.get(lang, "highlights") then
            vim.treesitter.start(args.buf)
        end
        if vim.treesitter.query.get(lang, "indents") then
            vim.opt_local.indentexpr = 'v:lua.require("nvim-treesitter").indentexpr()'
        end
        if vim.treesitter.query.get(lang, "folds") then
            vim.opt_local.foldmethod = "expr"
            vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        end
    end,
})

-- Lsp setup
-- NOTE: mason-tool-installer can handle automatically installing tools, to
-- have more consistent cross environment setups, but we prefer to be a bit
-- more systematic.
require("mason").setup()
require("mason-lspconfig").setup({
    automatic_enable = true,
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = {
                    "vim",
                    "require",
                },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

-- If using the builtin autocompletion
-- check out h: lspattach and search for autocomplete
-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	callback = function(ev)
-- 		local client = vim.lsp.get_client_by_id(ev.data.client_id)
-- 		if client ~= nil and client:supports_method("textDocument/completion") then
-- 			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
-- 		end
-- 	end,G
--
-- })

-- blink config
-- signature can be a bit busy
require("blink.cmp").setup({
    keymap = { preset = "enter" },
    -- signature = { enabled = true },
    completion = {
        accept = {
            auto_brackets = { enabled = true },
        },
        documentation = { auto_show = true, auto_show_delay_ms = 750 },
        ghost_text = { enabled = true },
        list = {
            selection = { preselect = false }, -- for `enter` keymap preset.
        },
        menu = {
            max_height = 30, -- max number of items to show
            auto_show = true,
            auto_show_delay_ms = 500,
            draw = {
                treesitter = { "lsp" },
                columns = {
                    { "kind_icon", "label", "label_description", gap = 1 },
                    { "kind" },
                },
            },
        },
    },
})

require("oklch-color-picker").setup({
    highlight = { style = "foreground" },
})

local Snacks = require("snacks")
Snacks.setup({
    indent = { enabled = true },
    -- input = { enabled = true },
    -- git = { enabled = true },
    quickfile = { enabled = true },
    -- scroll = { enabled = true },  -- scrolls to jumps
    statuscolumn = { enabled = true },
    -- scope = { enabled = true },
    picker = { enabled = true },
    explorer = { enabled = true },
})

-- statusline config
-- require("mini.statusline").setup()  -- like lualine a bit more, no git?
-- require("mini.git").setup()  -- didn't seem to add signs
-- require("mini.align").setup()
-- require("mini.pairs").setup()
require("mini.surround").setup()
require("lualine").setup({})
require("gitsigns").setup()
require("trouble").setup()
require("nvim-autopairs").setup()
require("todo-comments").setup({
    highlight = {
        before = "",
        keyword = "bg",
        after = "",
	    pattern = [[.*<(KEYWORDS).*:]],
    },
}
)


-- == Post Plugin Configuration ==

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.INFO] = " ",
            [vim.diagnostic.severity.HINT] = " ",
        },
    },
    virtual_text = true, -- show inline diagnostics
})

--- NOTE: Since neovim 0.11, many of the keymaps we define below are
--- provided by default, e.g., crn is
require("which-key").setup({
    preset = "modern", -- in ("classic", "modern", "helix")
    spec = {
        {
            "<leader>?",
            function()
                require("which-key").show()
            end,
            desc = "Keymaps (all)",
        },
        { "<leader>w",  proxy = "<c-w>", group = "windows" },
        {
            "<leader>b",
            group = "buffers",
            expand = function()
                return require("which-key.extras").expand.buf()
            end,
        },
        {
            "<leader>b?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
        { "<leader>d", group = "Diagnostics" },
        { "<leader>f", group = "Files" },
        { "<leader>g", group = "Git" },
        { "<leader>s", group = "Search" },
        -- { "<leader>l", group = "LSP" },
    },
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local bufmap = function(mode, rhs, lhs, desc)
            vim.keymap.set(mode, rhs, lhs, { buffer = event.buf, desc = desc })
        end

        -- These keymaps are the defaults in Neovim v0.12
        -- bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
        -- bufmap('n', 'grt', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
        -- bufmap('n', 'grr', '<cmd>lua vim.lsp.buf.references()<cr>')
        -- bufmap('n', 'gri', '<cmd>lua vim.lsp.buf.implementation()<cr>')
        -- bufmap('n', 'grn', '<cmd>lua vim.lsp.buf.rename()<cr>')
        -- bufmap('n', 'gra', '<cmd>lua vim.lsp.buf.code_action()<cr>')
        -- bufmap('n', 'grx', '<cmd>lua vim.lsp.codelens.run()<cr>')
        -- bufmap('n', 'gO', '<cmd>lua vim.lsp.buf.document_symbol()<cr>')
        -- bufmap({'i', 's'}, '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

        -- These are custom keymaps
        bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', "Goto Definition")
        bufmap('n', 'grd', '<cmd>lua vim.lsp.buf.declaration()<cr>', "Goto Declaration")
        bufmap({ 'n', 'x' }, 'grf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', "Format")
        bufmap("n", "grw", ("vim.lsp.buf.workspace_symbol())"), "Symbols: Workspace")
    end,
})


-- builtin
vim.cmd.packadd("nvim.difftool")
-- NOTE: can use snacks.picker for undo
-- vim.cmd.packadd("nvim.undotree")
-- map("n", "<leader>u", require("undotree").open, { desc = "Undotree" })


-- finder / picker keymaps
local picker = require("snacks.picker")
-- buffer keymaps <leader>b
map("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Delete Buffer" })
map("n", "<leader>bn", "<cmd>enew<cr>", { desc = "New Buffer" })
map("n", "<leader>bj", "<cmd>bn<cr>", { desc = "Next Buffer" })
map("n", "<leader>bk", "<cmd>bp<cr>", { desc = "Previous Buffer" })
map("n", "<leader>bhs", "<cmd>split<cr>", { desc = "Split" })
map("n", "<leader>bs", "<cmd>vsplit<cr>", { desc = "Vertical Split" })

map("n", "<leader>dd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", {desc = "Diagnostics: Buffer"})
map("n", "<leader>dw", "<cmd>Trouble diagnostics toggle<cr>", {desc = "Diagnostics: Workspace" })
map("n", "<leader>df", lua("vim.diagnostic.open_float()"),  {desc = "Open Float" })
map("n", "<leader>dj", lua("vim.diagnostic.goto_next()"), {desc = "Next" })
map("n", "<leader>dk", lua("vim.diagnostic.goto_prev()"), {desc = "Previous" })
map("n", "<leader>dl", "<cmd>Trouble loclist toggle<cr>",  {desc = "Location List" })
map("n", "<leader>dq", "<cmd>Trouble quickfix toggle<cr>", {desc = "Quickfix" })
map("n", "<leader>dr", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", {desc = "LSP" })
map("n", "<leader>ds", "<cmd>Trouble symbols toggle focus=false<cr>", {desc = "Symbols" })
map("n", "<leader>dt", "<cmd>Trouble todo toggle filter.buf=0<cr>", {desc = "Todo: Buffer"})
map("n", "<leader>dT", "<cmd>Trouble todo toggle<cr>", {desc = "Todo: Workspacde"})
map('n', '<leader>R', function()
  local session = vim.fn.stdpath('state') .. '/restart_session.vim'
  vim.cmd('mksession! ' .. vim.fn.fnameescape(session))
  vim.cmd('restart source ' .. vim.fn.fnameescape(session))
end, { desc = 'Restart Neovim' })
map("n", "<leader><space>", picker.smart, {desc = "Smart Find Files" })
map("n", "<leader>:", picker.command_history, {desc = "Command History" })
map("n", "<leader>,", picker.buffers, {desc = "Find Buffers" })
map("n", "<leader>.",  function() Snacks.scratch() end, { desc = "Toggle Scratch Buffer" })
map("n", "<leader>S",  function() Snacks.scratch.select() end, { desc = "Select Scratch Buffer" })
map("n", "<leader>/",  picker.grep, {desc = "Grep" })
map("n", "<leader>fa", function() picker({}) end, {desc = "All pickers" })
map("n", "<leader>fb", picker.buffers, {desc = "Find Buffers" })
map("n", "<leader>fc", function() picker.files({ cwd = vim.fn.stdpath("config") }) end, {desc = "Find Config File" })
map("n", "<leader>fe", function() Snacks.explorer() end, {desc = "File Explorer" })
-- map("n", "<leader>fe", "<cmd>NvimTreeToggle<cr>", { desc = "File Explorer" })
map("n", "<leader>ff", picker.files, {desc = "Find Files" })
map("n", "<leader>fg", picker.git_files, { desc = "Find Git Files" })
map("n", "<leader>fp", picker.projects, {desc = "Projects" })
map("n", "<leader>fr", picker.recent, {desc = "Recent" })
map("n", "<leader>fs", picker.smart, {desc = "Smart Find Files" })
map("n", "<leader>fn", picker.notifications, { desc = "Notification History" })
-- -- git
map("n", "<leader>gb", picker.git_branches, { desc = "Git Branches" })
map("n", "<leader>gl", picker.git_log, { desc = "Git Log" })
map("n", "<leader>gL", picker.git_log_line, { desc = "Git Log Line" })
map("n", "<leader>gs", picker.git_status, { desc = "Git Status" })
map("n", "<leader>gS", picker.git_stash, { desc = "Git Stash" })
map("n", "<leader>gd", picker.git_diff, { desc = "Git Diff (Hunks)" })
map("n", "<leader>gf", picker.git_log_file, { desc = "Git Log File" })
map("n", "<leader>gi", picker.gh_issue, { desc = "GitHub Issues (open)" })
map("n", "<leader>gI", function() picker.gh_issue({ state = "all" }) end, { desc = "GitHub Issues (all)" })
map("n", "<leader>gp", picker.gh_pr, { desc = "GitHub Pull Requests (open)" })
map("n", "<leader>gP", function() picker.gh_pr({ state = "all" }) end, { desc = "GitHub Pull Requests (all)" })
-- -- search
map("n", "<leader>sB", picker.grep_buffers, { desc = "Grep Open Buffers" })
map("n", "<leader>sC", picker.commands, {desc = "Commands" })
map("n", "<leader>sD", picker.diagnostics, { desc = "Diagnostics: Workspace" })
map("n", "<leader>sH", picker.highlights, {desc = "Highlights" })
map("n", "<leader>sM", picker.man, { desc = "Man Pages" })
map("n", "<leader>sR", picker.resume, { desc = "Resume" })
map("n", "<leader>sS", picker.lsp_workspace_symbols, { desc = "Search LSP Symbols: Workspace" })
map("n", "<leader>sa", picker.autocmds, { desc = "Autocmds" })
map("n", "<leader>sb", picker.lines, { desc = "Buffer Lines" })
map("n", "<leader>sc", picker.command_history, {desc = "Command History" })
map("n", "<leader>sd", picker.diagnostics_buffer, { desc = "Buffer Diagnostics" })
map("n", "<leader>sg", picker.grep, { desc = "Grep" })
map("n", "<leader>sh", picker.help, {desc = "Help Pages" })
map("n", "<leader>si", picker.icons, { desc = "Icons" })
map("n", "<leader>sj", picker.jumps, { desc = "Jumps" })
map("n", "<leader>sk", picker.keymaps, {desc = "Keymaps" })
map("n", "<leader>sl", picker.loclist, { desc = "Location List" })
map("n", "<leader>sm", picker.marks, { desc = "Marks" })
map("n", "<leader>sp", picker.lazy, { desc = "Search for Plugin Spec" })
map("n", "<leader>sq", picker.qflist, { desc = "Quickfix List" })
map("n", "<leader>ss", picker.lsp_symbols, { desc = "Search LSP Symbols: Buffer" })
map("n", "<leader>st", picker.colorschemes, { desc = "Themes" })
map("n", "<leader>su", picker.undo, {desc = "Undo History" })
map("n", "<leader>sw", picker.grep_word, { desc = "Visual selection or word" } )
map("n", '<leader>s"', picker.registers, { desc = "Registers" })
map("n", '<leader>s/', picker.search_history, {desc = "Search History" })

map("n", "<leader>cc", function()
    require("oklch-color-picker").pick_under_cursor()
end, { desc = "Color pick under cursor" })
-- The lsp keymaps mostly have defaults already
-- map("n", "<leader>gd", picker.lsp_definitions, { desc = "Goto Definition" })  -- seems same as 
-- map("n", "<leader>gD", picker.lsp_declarations, { desc = "Goto Declaration" })
-- map("n", "<leader>gr", picker.lsp_references, {nowait = true, desc = "Goto References" })
-- map("n", "<leader>gi", picker.lsp_implementations, { desc = "Goto Implementation" })
-- map("n", "<leader>gt", picker.lsp_type_definitions, { desc = "Goto Type Definition" })
-- map("n", "<leader>gI", picker.lsp_incoming_calls, { desc = "Calls [I]ncoming" })
-- map("n", "<leader>gO", picker.lsp_outgoing_calls, { desc = "C[a]lls [O]utgoing" })
-- map("n", "<leader>la", lua("vim.lsp.buf.code_action()"), { desc = "Code Action" })  -- gra
-- map("n", "<leader>ld", lua("vim.lsp.buf.definition()"), { desc = "Definition" })
-- map("n", "<leader>lD", lua("vim.lsp.buf.declaration()"), { desc = "Declaration" })
-- map("n", "<leader>lh", lua("vim.lsp.buf.hover()"), { desc = "Hover" })  -- K
-- map("n", "<leader>li", lua("vim.lsp.buf.implementation()"), { desc = "Implementation" }) -- builtin
-- map("n", "<leader>lr", lua("vim.lsp.buf.rename()"), { desc = "Rename" }) -- default is grn
-- map("n", "<leader>lR", lua("vim.lsp.buf.references()"), { desc = "References" })
-- map("n", "<leader>lo", lua("vim.lsp.buf.document_symbol()"), { desc = "Symbols: Document" })
-- map("n", "<leader>lw", lua("vim.lsp.buf.workspace_symbol()"), { desc = "Symbols: Workspace" })
-- map("n", "<leader>lt", lua("vim.lsp.buf.type_definition()"), { desc = "Type Definition" })  -- grt
