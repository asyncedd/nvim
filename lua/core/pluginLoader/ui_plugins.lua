local vim = vim -- Avoid using expensive global searching.
local api = vim.api
local o = api.nvim_set_option_value

local function augroup(name)
  return api.nvim_create_augroup("lazyload_" .. name, { clear = true })
end

local threads = {}

table.insert(threads, coroutine.create(function()
  api.nvim_command("colorscheme catppuccin")
  -- vim.g.enfocado_style = "nature"
  -- vim.g.enfocado_style = "neon"
  -- vim.g.enfocado_plugin = {
  --   "gitsigns",
  --   "lazy",
  --   "indent-blankline",
  --   "heirline"
  -- }
  -- api.nvim_command("colorscheme enfocado")
end))

table.insert(threads, coroutine.create(function()
  api.nvim_create_autocmd({ "BufReadPost" }, {
    group = augroup("ui"),
    callback = function()
      local module_names = {
        "plugins.configs.editor.treesitter",
        "plugins.configs.ui.indent",
        "plugins.configs.editor.gitsigns",
        "plugins.configs.ui.heirline",
        "plugins.configs.editor.ufo",
        -- "configs.ui.animate"
      }

      -- Load modules asynchronously using pcall
      for _, name in ipairs(module_names) do
        vim.schedule(function()
          pcall(require, name)
        end)
      end
      require("colorizer").setup()
    end
  })
end))


for i, thread in ipairs(threads) do
  coroutine.resume(thread)
end
