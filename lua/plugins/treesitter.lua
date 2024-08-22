-- ~/.config/nvim/lua/plugins/treesitter.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.9.1",  -- Asegúrate de usar la versión que desees
    opts = function(_, opts)
      -- Agregar lenguajes adicionales para asegurar que estén instalados
      opts.ensure_installed = vim.tbl_extend("force", opts.ensure_installed or {}, {
        "javascript",
        "typescript",
        "css",
        "gitignore",
        "graphql",
        "http",
        "json",
        "scss",
        "sql",
        "vim",
        "python",
        "java",
        "lua",
        "xml",         -- Asegúrate de que xml esté incluido
        "dockerfile",
        "git_config",
        "jsdoc",
        "make",
        "toml",
        "vimdoc",      -- Asegúrate de usar vimdoc en lugar de help
      })

      -- Opciones adicionales
      opts.ignore_install = { "help", "xml" } -- Ignorar "help"

      -- Configuración del linter de consultas
      opts.query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
      }
    end,
  },
}

