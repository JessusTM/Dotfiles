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
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "plugins" },
    { import = "lazyvim.plugins.extras.formatting.prettier" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.tailwind" },
    { import = "lazyvim.plugins.extras.coding.copilot" },
    { import = "lazyvim.plugins.extras.util.mini-hipatterns" },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
      "simrat39/rust-tools.nvim",
      opts = {
        -- make sure mason installs the server
        servers = {
          rust_analyzer = {},
        },
        setup = {
          rust_analyzer = function(_, opts)
            require("lazyvim.util").on_attach(function(client, buffer)
              if client.name == "rust_analyzer" then
                vim.keymap.set(
                  "n",
                  "K",
                  "<cmd>RustHoverActions<cr>",
                  { buffer = buffer, desc = "Hover Actions (Rust)" }
                )
                vim.keymap.set(
                  "n",
                  "<leader>cR",
                  "<cmd>RustCodeAction<cr>",
                  { buffer = buffer, desc = "Code Action (Rust)" }
                )
                vim.keymap.set(
                  "n",
                  "<leader>dr",
                  "<cmd>RustDebuggables<cr>",
                  { buffer = buffer, desc = "Run Debuggables (Rust)" }
                )
              end
            end)
            local mason_registry = require("mason-registry")
            -- rust tools configuration for debugging support
            local codelldb = mason_registry.get_package("codelldb")
            local extension_path = codelldb:get_install_path() .. "/extension/"
            local codelldb_path = extension_path .. "adapter/codelldb"
            local liblldb_path = vim.fn.has("mac") == 1 and extension_path .. "lldb/lib/liblldb.dylib"
              or extension_path .. "lldb/lib/liblldb.so"
            local rust_tools_opts = vim.tbl_deep_extend("force", opts, {
              dap = {
                adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
              },
              tools = {
                on_initialized = function()
                  vim.cmd([[
                    augroup RustLSP
                    autocmd CursorHold                      *.rs silent! lua vim.lsp.buf.document_highlight()
                    autocmd CursorMoved,InsertEnter         *.rs silent! lua vim.lsp.buf.clear_references()
                    autocmd BufEnter,CursorHold,InsertLeave *.rs silent! lua vim.lsp.codelens.refresh()
                    augroup END
                  ]])
                end,
              },
              server = {
                settings = {
                  ["rust-analyzer"] = {
                    cargo = {
                      allFeatures = true,
                      loadOutDirsFromCheck = true,
                      runBuildScripts = true,
                    },
                    -- Add clippy lints for Rust.
                    checkOnSave = {
                      allFeatures = true,
                      command = "clippy",
                      extraArgs = { "--no-deps" },
                    },
                    procMacro = {
                      enable = true,
                      ignored = {
                        ["async-trait"] = { "async_trait" },
                        ["napi-derive"] = { "napi" },
                        ["async-recursion"] = { "async_recursion" },
                      },
                    },
                  },
                },
              },
            })
            require("rust-tools").setup(rust_tools_opts)
            return true
          end,
          taplo = function(_, _)
            local function show_documentation()
              if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
                require("crates").show_popup()
              else
                vim.lsp.buf.hover()
              end
            end
            require("lazyvim.util").on_attach(function(client, buffer)
              if client.name == "taplo" then
                vim.keymap.set("n", "K", show_documentation, { buffer = buffer, desc = "Show Crate Documentation" })
              end
            end)
            return false -- make sure the base implementation calls taplo.setup
          end,
        },
      },
    },
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
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
