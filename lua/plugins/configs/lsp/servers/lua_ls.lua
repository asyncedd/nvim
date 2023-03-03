local M = {
  Lua = {
    runtime = {
      -- Tell the LS (langauge server) that we're using LuaJIT!
      version = "LuaJIT",
      special = {
        reload = "require",
      },
    },
    completion = {
      -- Show function name and call the Snippet
      callSnippet = "Replace",
      -- Should the displayed context word contains the content of another file in the workspace
      workspaceWord = true,
    },
    misc = {
      -- CLI parameters when starting the LS (Language server)
      parameters = {
        "--log-level=trace",
      }
    },
    workspace = {
      -- Don't check for third party workspaces.
      checkThirdParty = false,
      -- Make the LS (langauge sever) aware of Neovim runtime files.
      -- library = vim.api.nvim_get_runtime_file("", true)
      -- Only load needed files.
      -- We only load the VIMRUNTIME Lua and LSP files and, some stuff for plugins installed via lazy.nvim.
      library = {
        [vim.fn.expand "$VIMRUNTIME/lua"] = true,
        [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
        [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
      },
      -- "Cache" files for fast loading.
      -- Oh yeah we allow 100 MB of cache. No more than that.
      -- And we skip files that are over 10MB.
      maxPreload = 100000,
      preloadFileSize = 10000,
    },
    -- Disable the opt-in telemtry. Even though it's opt-in.
    telemetry = {
      enable = false,
    },
    -- Get the LS (language server) to reconize the "vim" global.
    globals = {
      "vim"
    },
    -- Enable LS (language server) diagnostics.
    diagnostics = {
      enable = true,
      -- Set "strong" and "strict" severtities to "Warning".
      groupSeverity = {
        strong = "Warning",
        strict = "Warning",
      },
      -- Modify the diagnostic needed file status.
      groupFileStatus = {
        ["ambiguity"] = "Opened",
        ["await"] = "Opened",
        ["codestyle"] = "None",
        ["duplicate"] = "Opened",
        ["global"] = "Opened",
        ["luadoc"] = "Opened",
        ["redefined"] = "Opened",
        ["strict"] = "Opened",
        ["strong"] = "Opened",
        ["type-check"] = "Opened",
        ["unbalanced"] = "Opened",
        ["unused"] = "Opened",
      },
      unusedLocalExclude = { "_*" },
    },
    -- Enable LS (langage server) formatting.
    format = {
      enable = true,
      defaultConfig = {
        -- Space-indents for the win!
        indent_style = "space",
        -- As 0.2x devs we need our 2 spaces!
        indent_size = "2",
        continuation_indent_size = "2",
      }
    }
  },
}

return M
