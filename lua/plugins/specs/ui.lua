return {
  -- Colorscheme
  {
    "catppuccin/nvim",
    config = function ()
      require("plugins.configs.ui.catppuccin")
    end,
    lazy = false,
  },
  -- Indent blanklines
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      show_current_context = true,
      show_current_context_start = true,
      show_end_of_line = true,
      space_char_blankline = " ",
      enabled = true,
      colored_indent_levels = false,
      show_trailing_blankline_indent = true,
    },
    event = "BufReadPost",
    config = true,
  },
  -- Colorizer
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPost",
    config = true,
  },
  {
    "rebelot/heirline.nvim",
    event = "BufReadPost",
    config = function ()
      require("plugins.configs.ui.heirline")
    end
  },
  {
    "anuvyklack/pretty-fold.nvim",
    config = true,
    event = "BufReadPost",
    dependencies = {
      {'anuvyklack/fold-preview.nvim',
        dependencies = { 'anuvyklack/keymap-amend.nvim' },
        config = true,
      }
    }
  }
}
