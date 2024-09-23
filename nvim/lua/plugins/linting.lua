return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d --no-unused-vars" },
      typescriptreact = { "eslint_d --no-unused-vars" },
      svelte = { "eslint_d" },
      python = { "pylint" },
    }

    lint.ignore = {
      ".eslintrc.cjs",
      ".eslintrc.js",
    }

    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
