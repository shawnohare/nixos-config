-- NOTE: Useful notes https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/

-- TODO: Seems neovim now uses lsp for gq formatting. This can be nice
-- for some languages, but not for others.
-- https://vi.stackexchange.com/questions/39200/wrapping-comment-in-visual-mode-not-working-with-gq

-- Disable netrw for nvim-tree.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.termguicolors = true
vim.opt.background = "dark"

if vim.g.vscode ~= nil then
	do
		return
	end
end

-- ---------------------------------------------------------------------------
-- package manager setup
-- ---------------------------------------------------------------------------
-- require("packager").setup()
require("config.lazy")

vim.cmd([[
try
    colorscheme hadalized
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
endtry
]])

-- ---------------------------------------------------------------------------
-- post package config
-- ---------------------------------------------------------------------------
vim.filetype.add({
    extension = {
      jinja = 'jinja',
      jinja2 = 'jinja',
      j2 = 'jinja',
    },
})

vim.cmd([[
autocmd filetype nix setlocal commentstring=#\ %s
autocmd filetype cfg setlocal commentstring=#\ %s
autocmd filetype sql setlocal commentstring=--\ %s
autocmd filetype pgsql setlocal commentstring=--\ %s
autocmd filetype xdefaults setlocal commentstring=!\ %s
autocmd filetype groovy setlocal commentstring=//\ %s
autocmd filetype jenkinsfile setlocal commentstring=//\ %s

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
filetype indent on
]])

vim.g.neovide_cursor_animation_length = 0.0
vim.g.neovide_cursor_trail_length = 0.01
vim.g.tex_flavor = "latex"
vim.g.sql_type_default = "pgsql"
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.ackprg = "rg --vimgrep --no-heading -uu"

-- ---------------------------------------------------------------------------
-- options
-- ---------------------------------------------------------------------------

vim.opt.autochdir = true
vim.opt.autowrite = false -- :wqa write when moving to other buffers/windows
vim.opt.clipboard:append("unnamedplus")
vim.opt.colorcolumn = "+1"
vim.opt.completeopt = { "noinsert", "menuone", "noselect" }
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.foldcolumn = "0"
vim.opt.foldenable = true
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = "indent"
vim.opt.foldnestmax = 8
-- vim.opt.formatoptions:remove('tc')
vim.opt.formatoptions = "roql"
vim.opt.guifont = "JetBrainsMono Nerd Font"
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.inccommand = "nosplit"
vim.opt.linebreak = true
vim.opt.modeline = false -- security risk?
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.pumblend = 10
vim.opt.scrolljump = 1
vim.opt.scrolloff = 5
vim.opt.shiftwidth = 4
vim.opt.shortmess:append("A")
vim.opt.showcmd = true
vim.opt.showmode = false
vim.opt.smartcase = true
vim.opt.softtabstop = 4
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 4
vim.opt.textwidth = 79
vim.opt.title = true
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.wildmenu = true
vim.opt.wildoptions = "pum"
vim.opt.wrap = false

vim.opt.listchars = {
	tab = ">-",
	trail = "·",
	extends = "◣",
	precedes = "◢",
	nbsp = "○",
	eol = "↵",
}

vim.opt.wildignore = {
	"*.DS_Store",
	".git",
	".hg",
	".svn",
	"*.o",
	"*.obj",
	"*.exe",
	"*.pyc",
	"*.luac",
	"*.class",
	"*/target/*",
}

-- NOTE: default lualine seems sensible enough for now.
-- local statusline = {
-- 	"%{mode()} | ",
-- 	"buf:%n | ",
-- 	" %F", -- full path to file
-- 	-- '%{fugitive#statusline()}',
-- 	-- righthand side
-- 	"%=",
-- 	"%{&filetype} (%{&fenc}) ",
-- 	"%h%m%w%r | ",
-- 	"%l:%c (%p%%) ",
-- 	"%*",
-- }
-- -- local statusline = {
-- --   '%{mode()} | ',
-- --   ' %t',
-- --   '%r',
-- --   '%m',
-- --   '%=',
-- --   '%{&filetype}',
-- --   ' %2p%%',
-- --   ' %3l:%-2c '
-- -- }
--
-- vim.o.statusline = table.concat(statusline, "")

-- Some lsp's cause the log file to grow infinitely very fast.
--
vim.lsp.log.set_level("off")
