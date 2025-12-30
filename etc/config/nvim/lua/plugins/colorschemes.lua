return {
    { "rktjmp/shipwright.nvim", lazy = true },
    {
      "eero-lehtinen/oklch-color-picker.nvim",
      event = "VeryLazy",
      version = "*",
      keys = {
        -- One handed keymap recommended, you will be using the mouse
        {
          "<leader>v",
          function() require("oklch-color-picker").pick_under_cursor({}) end,
          desc = "Color pick under cursor",
        },
      },
      opts = {
          highlight = {
              style = "foreground",
          },
      },
    },
    {
       "shawnohare/hadalized.nvim",
       priority = 1000,
       opts = {},
       dependencies = {
            -- "rktjmp/lush.nvim",
       },
    },
    { "rebelot/kanagawa.nvim" },
    {
    "craftzdog/solarized-osaka.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        "Allianaab2m/penumbra.nvim",
        opts = {
            contrast = "plusplus",
        },
    },
}
