---@module "lazy"
---@type LazySpec
return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    dependencies = {
      {
        'nvim-treesitter/nvim-treesitter-context',
        opts = {
          max_lines = 4,
          multiline_threshold = 2,
        },
      },
    },
    config = function()
        local ts = require 'nvim-treesitter'
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
        vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo[0][0].foldmethod = 'expr'

        vim.api.nvim_create_autocmd('FileType', {
            pattern = patterns,
            callback = function()
                vim.treesitter.start()
            end,
        })
    end,
}
