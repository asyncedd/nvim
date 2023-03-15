-- lua/core/init.lua
-- This is the place where the magic happens!

-- Our ms-jpq's async.
-- Set the <leader> key to: <Space>
-- So we can go for ex. -> `<leader>ff` to open Telescope.nvim.
-- Quite useful ain't it? :)
vim.g.mapleader = " "

-- Disable builtin plugins (Using the g.loaded method so it's not real :()
require("core.disableBuiltinPlugins")

-- Set some options.
-- Now, we can use shortcuts like `<leader>ff` to open Telescope.nvim.
-- This will make out lives much easier! :D
require("core.options")

-- Initalize the plugin manager, lazy.nvim.
-- We're gonna use the best tools for the job!
require("core.lazy")

vim.cmd("colorscheme catppuccin")

-- vim.cmd("colorscheme catppuccin")

-- Do some stuff that aren't required in our UI. (mappings, autocmd etc...)
-- Also without blocking the main thread for the maximum efficiency.
vim.schedule(function()
  -- Add some autocmds.
  -- Check it out, it's quite neat!
  require("core.autocmd")
  -- Add some mappings... We need these more maximum productivity!
  -- TODO merge `mappings.lspsaga` with `mappings.plugins`
  require("mappings.movement")
  require("mappings.lspsaga")
  require("mappings.plugins")
end)


