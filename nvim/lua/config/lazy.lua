local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      opts = {},
    },
    { import = "lazyvim.plugins.extras.linting.eslint" },
    { import = "lazyvim.plugins.extras.formatting.prettier" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.rust" },
    { import = "lazyvim.plugins.extras.lang.tailwind" },
    { import = "lazyvim.plugins.extras.coding.copilot" },
    { import = "lazyvim.plugins.extras.util.mini-hipatterns" },
    { import = "plugins" },
    {
      "kyazdani42/nvim-web-devicons",
      lazy = true,
    },
    {
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
      "stevearc/conform.nvim",
      branch = "nvim-0.9",
      opts = {},
    },
    {
      "mrcjkb/rustaceanvim",
      version = "^5",
      lazy = false,
    },
    {
      "nvim-java/nvim-java",
      dependencies = {
        "nvim-lspconfig",
      },
      config = function()
        require("java").setup()
        require("lspconfig").jdtls.setup({})
      end,
    },
    {
      "mfussenegger/nvim-dap",
      config = function()
        local dap = require("dap")

        dap.adapters.java = {
          type = "server",
          host = "127.0.0.1",
          port = 5005,
        }

        dap.configurations.java = {
          {
            type = "java",
            request = "launch",
            name = "Debug Java Program",
            mainClass = "${file}",
          },
        }
      end,
    },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  checker = { enabled = true },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "rplugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
