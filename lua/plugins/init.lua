-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  print("NOTICE: Bootstrapping Lazy.nvim. Please wait! (It shouldn't be too long!)")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath
  })
  print("OK: Done!")
end

vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

local disabledPlugins = require("user.builtinPlugins")
-- Lazy load a plugin.
---@param plugin string: A plugin to load.
local lazyLoad = function(plugin) -- CREDIT: NvChad.
  vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile" }, {
    group = vim.api.nvim_create_augroup("BeLazyOnFileOpen" .. plugin, {}),
    callback = function()
      local file = vim.fn.expand "%"
      local condition = file ~= "NvimTree_1" and file ~= "[lazy]" and file ~= ""

      if condition then
        vim.api.nvim_del_augroup_by_name("BeLazyOnFileOpen" .. plugin)

        -- dont defer for treesitter as it will show slow highlighting
        -- This deferring only happens only when we do "nvim filename"
        if plugin ~= "nvim-treesitter" then
          vim.schedule(function() require("lazy").load({ plugins = plugin })

            if plugin == "nvim-lspconfig" or plugin == "null-ls" then
              vim.cmd("silent! do FileType")
            end
          end)
        else
          require("lazy").load({ plugins = plugin })
        end
      end
    end,
  })
end

require("lazy").setup({
  { import = "plugins.specs" }
}, {
  performance = {
    rtp = {
      disabled_plugins = disabledPlugins
    },
  },
  install = {
    colorscheme = {
      "catppuccin",
      "habamax",
    }
  },
  defaults = {
    lazy = true,
    version = false,
  },
})

