return not _G.config.filetypes.lua == true and {}
  or {
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          lua_ls = {
            settings = {
              Lua = {
                hint = {
                  enable = true,
                  arrayIndex = "Disable",
                },
                runtime = {
                  pathStrict = true,
                },
                completion = {
                  callSnippet = "Both",
                },
                diagnostics = {
                  globals = {
                    "vim",
                  },
                },
                workspace = {
                  library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    -- [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                    [vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
                  },
                  maxPreload = 100000,
                  preloadFileSize = 10000,
                  checkThirdParty = false,
                },
              },
            },
          },
        },
      },
    },
    {
      "jose-elias-alvarez/null-ls.nvim",
      opts = {
        sources = {
          stylua = {
            condition = function(utils)
              return utils.root_has_file({ "stylua.toml" })
            end,
          },
        },
      },
    },
    {
      "jbyuki/one-small-step-for-vimkind",
    -- stylua: ignore
    keys = {
    },
      config = function()
        local dap = require("dap")
        dap.adapters.nlua = function(callback, config)
          callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or "${port}" })
        end
        dap.configurations.lua = {
          {
            type = "nlua",
            request = "attach",
            name = "Attach to running Neovim instance",
          },
        }
      end,
      dependencies = "nvim-dap",
    },
    {
      "folke/neodev.nvim",
      opts = {
        -- When enabled = false, Neodev will not make any changes to the sumneko_lua thus, disbling it.
        enabled = true,
        -- When, plugins = true, it'll add plugins managed by lazy.nvim or packer.nvim to the workspace. (For now, it'll use lazy.nvim)
        -- When it's false, it'll be the oppisite.
        -- But, if it's an array, it'll only add the plugins specified to the workspace.
        -- It'll be good to only add the plugins you use into the list.
        ---@type string[]
        plugins = {
          "lazy.nvim",
        },
        -- If runtime = true, it'll add the runtime (excluding the plugins I think?) to the workspace.
        -- If it's false, it'll not have intellisense for your configuration.
        -- I also believe it'll add the "vim" global too.
        runtime = true,
        -- Enable if you want types for Neovim Lua stuff.
        -- For example, Neovim options, vim.treesitter, vim.opt, vim.o, vim.g, vim.api, vim.cmd, vim.loop and vim.fn etc..
        -- These are auto-generated by Neodev.
        types = true,
        -- pathStrict being true, it'll be wayyyyy faster.
        -- runtime.path will only search the first level of directories.
        pathStrict = true,
      },
      config = function(_, opts)
        require("plugins.configs.lsp.neodev")(opts)
      end,
    },
  }
