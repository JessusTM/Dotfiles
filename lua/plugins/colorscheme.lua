return {
  "catppuccin/nvim",
  lazy = true,
  priority = 1000,
  opts = function()
    return {
      flavour = "mocha",
      term_colors = true,
      integrations = {
        nvimtree = true,
        telescope = true,
        dashboard = true,
        gitsigns = true,
        cmp = true,
      },
    }
  end,
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd("colorscheme catppuccin-mocha")
  end,
}
