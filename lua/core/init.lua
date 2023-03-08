local o = vim.api.nvim_set_option_value

vim.g.mapleader = " "
o("shadafile", "NONE", {})

require("core.lazy")

vim.api.nvim_command("colorscheme catppuccin")

require("core.options")

vim.defer_fn(function()
  require("core.autocmd")
  require("mappings.movement")
  require("mappings.lspsaga")

  o("shadafile", "", {})
end, 0)
