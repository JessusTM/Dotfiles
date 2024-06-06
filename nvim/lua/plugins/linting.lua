return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d --no-unused-vars" }, -- Add --no-unused-vars flag
      typescriptreact = { "eslint_d --no-unused-vars" }, -- Add --no-unused-vars flag
      svelte = { "eslint_d" },
      python = { "pylint" },
    }

    -- setup an ignore for .eslintrc.js files
    -- this is because the eslint_d linter will try to lint the config files
    -- and will throw an error if it's not a valid js files
    lint.ignore = {
      ".eslintrc.cjs",
      ".eslintrc.js",
    }

    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })

    -- The following code is used as initial setup for the linting, but it's not needed with the current setup
    -- local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

    -- vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
    -- 	group = lint_augroup,
    -- 	callback = function() lint.try_lint() end,
    -- })
  end,
}
