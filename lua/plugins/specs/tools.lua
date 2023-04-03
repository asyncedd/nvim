return {
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("tools.telescope")
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "debugloop/telescope-undo.nvim",
      {
        "jedrzejboczar/possession.nvim",
        config = function ()
          require("possession").setup({})
        end,
      },
    },
    event = "VeryLazy",
  },
  {
    "thePrimeagen/harpoon",
    config = function()
      require("tools.harpoon")
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("tools.nvimtree")
    end,
    cmd = {
      "NvimTreeToggle",
      "NvimTreeFocus",
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>tr", "<cmd>NvimTreeToggle<cr>" },
    },
  },
  {
    "folke/trouble.nvim",
    config = true,
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle<cr>" },
      { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>" },
      { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>" },
      { "<leader>xl", "<cmd>TroubleToggle loclist<cr>" },
      { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>" },
      { "gR", "<cmd>TroubleToggle lsp_references<cr>" },
    },
  },
  {
    "TimUntersberger/neogit",
    cmd = { "Neogit" },
    config = true,
    keys = {
      { "<leader>gt", function() require("neogit").open({ kind = "split" }) end },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "rafcamlet/nvim-luapad",
    lazy = true,
    cmd = {
      "Luapad",
      "LuaRun",
      "Lua",
    },
  },
  {
    "sindrets/diffview.nvim",
    config = true,
    keys = {
      { "<leader>dv", "<cmd>DiffviewOpen<cr>" },
    },
  },
  {
    "ThePrimeagen/vim-be-good",
    cmd = { "VimBeGood" },
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
    },
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>" },
    },
  },
  {
    "pwntester/octo.nvim",
    config = true,
    cmd = {
      "Octo",
    },
    keys = {
      { "<leader>gh", ":Octo " },
    },
  },
}
