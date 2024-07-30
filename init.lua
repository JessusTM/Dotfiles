require("config.lazy")

require("catppuccin").setup({
  flavour = "mocha",
})

if vim.loader then
  vim.loader.enable()
end

_G.dd = function(...)
  require("util.debug").dump(...)
end
vim.print = _G.dd

local catppuccin_theme = {
  normal = {
    a = { bg = "#8aadf4", fg = "#1e2030", gui = "bold" },
    b = { bg = "#292c3c", fg = "#8aadf4" },
    c = { bg = "#1e2030", fg = "#cdd6f4" },
  },
  insert = {
    a = { bg = "#a6e3a1", fg = "#1e2030", gui = "bold" },
    b = { bg = "#292c3c", fg = "#a6e3a1" },
  },
  visual = {
    a = { bg = "#cba6f7", fg = "#1e2030", gui = "bold" },
    b = { bg = "#292c3c", fg = "#cba6f7" },
  },
  replace = {
    a = { bg = "#f38ba8", fg = "#1e2030", gui = "bold" },
    b = { bg = "#292c3c", fg = "#f38ba8" },
  },
  command = {
    a = { bg = "#f9e2af", fg = "#1e2030", gui = "bold" },
    b = { bg = "#292c3c", fg = "#f9e2af" },
  },
  inactive = {
    a = { bg = "#1e2030", fg = "#8aadf4", gui = "bold" },
    b = { bg = "#1e2030", fg = "#414868" },
    c = { bg = "#1e2030", fg = "#737aa2" },
  },
}

vim.opt.guifont = "FiraCode Nerd Font:h17"

local function get_os_name()
  local f = io.popen("uname -s")
  local os_name = f:read("*a") or "Unknown OS"
  f:close()
  return os_name:sub(1, -2)
end

local lualine = require("lualine")

lualine.setup({
  options = {
    theme = catppuccin_theme,
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
    icons_enabled = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = { "filename" },
    lualine_x = { "encoding", get_os_name, "filetype" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = {},
  },
})

vim.cmd("colorscheme catppuccin-mocha")
