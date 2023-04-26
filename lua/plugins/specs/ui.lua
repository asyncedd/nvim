return {
  {
    "rebelot/heirline.nvim",
    config = function()
      require("plugins.configs.ui.heirline")
    end,
    event = { "VeryLazy", "BufReadPost", "User Heirline" },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "willothy/veil.nvim",
    dependencies = {
      -- All optional, only required for the default setup.
      -- If you customize your config, these aren't necessary.
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim"
    },
    config = true,
    init = function()
      local file = vim.fn.expand "%"
      local condition = file ~= "NvimTree_1" and file ~= "[lazy]" and file ~= ""

      if not condition then
        require("lazy").load({ plugins = "veil.nvim" })
      end
    end,
  },
}
