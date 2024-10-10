local lualine = require("lualine")
local rp_colors = require("rose-pine.palette")

-- Configuración de lualine con los colores de Rose Pine
lualine.setup({
  options = {
    theme = {
      normal = {
        a = { bg = rp_colors.rose, fg = rp_colors.base, gui = "bold" },
        b = { bg = rp_colors.surface, fg = rp_colors.rose },
        c = { bg = rp_colors.base, fg = rp_colors.text },
      },
      insert = {
        a = { bg = rp_colors.foam, fg = rp_colors.base, gui = "bold" },
        b = { bg = rp_colors.surface, fg = rp_colors.foam },
      },
      visual = {
        a = { bg = rp_colors.iris, fg = rp_colors.base, gui = "bold" },
        b = { bg = rp_colors.surface, fg = rp_colors.iris },
      },
      replace = {
        a = { bg = rp_colors.love, fg = rp_colors.base, gui = "bold" },
        b = { bg = rp_colors.surface, fg = rp_colors.love },
      },
      command = {
        a = { bg = rp_colors.gold, fg = rp_colors.base, gui = "bold" },
        b = { bg = rp_colors.surface, fg = rp_colors.gold },
      },
      inactive = {
        a = { bg = rp_colors.base, fg = rp_colors.muted },
        b = { bg = rp_colors.base, fg = rp_colors.surface, gui = "bold" },
        c = { bg = rp_colors.base, fg = rp_colors.overlay },
      },
    },
    icons_enabled = true,
    component_separators = { left = "|", right = "|" },
    section_separators = { left = "", right = "" },
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      { "mode", icon = "" },
    },
    lualine_b = {
      { "branch", icon = "" },
      { "diff", symbols = { added = " ", modified = " ", removed = " " } },
      {
        "diagnostics",
        sources = { "nvim_lsp" },
        symbols = { error = " ", warn = " ", info = " ", hint = " " },
      },
    },
    lualine_c = {
      { "filename", icon = "󰈙" },
    },
    lualine_x = {
      { "filetype" },
    },
    lualine_y = {
      { "progress" },
    },
    lualine_z = {
      { "location" },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      { "filename", icon = "󰈙" },
    },
    lualine_x = {
      { "filetype" },
    },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
})
