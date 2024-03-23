local plugins = {
  {
    "xiyaowong/transparent.nvim",
    config = function()
      require("custom.config.transparent")
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussengger/nvim-dap",
    event = "VeryLazy",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    handlers = {},
  },
  {
    "mfussenegger/nvim-dap",
    config = function (_,_)
      require("core.utils").load_mappings('dap')
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require"plugins.configs.lspconfig"
      require"custom.configs.lspconfig"
    end
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "luaformatter",
        "codelldb",
      }
    }
  }
}

return plugins
