-- Bootstrap lazy.nvim and LazyVim along with your plugins
require("config.lazy")

-- Cargar el tema Catppuccin y lualine
require("catppuccin").setup({
  flavour = "mocha",
})

-- Enable the loader if available
if vim.loader then
  vim.loader.enable()
end

-- Define a print function for debugging
_G.dd = function(...)
  require("util.debug").dump(...)
end
vim.print = _G.dd

-- Definir el tema Catppuccin manualmente
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

-- Configuración de la fuente
vim.opt.guifont = "FiraCode Nerd Font:h17" -- Cambia "FiraCode Nerd Font" por la fuente que prefieras

-- Función para obtener el nombre del sistema operativo
local function get_os_name()
  local f = io.popen("uname -s")
  local os_name = f:read("*a") or "Unknown OS"
  f:close()
  return os_name:sub(1, -2) -- Eliminar el salto de línea al final
end

-- Requerir lualine antes de configurarlo
local lualine = require("lualine")

lualine.setup({
  options = {
    theme = catppuccin_theme,
    section_separators = { left = "", right = "" }, -- Estos son los separadores que Catppuccin usa por defecto
    component_separators = { left = "", right = "" },
    icons_enabled = true, -- Asegúrate de que los iconos estén habilitados
  },
  sections = {
    lualine_a = { "mode" }, -- Coloca el modo actual de Vim en la esquina superior izquierda
    lualine_b = { "branch" }, -- Coloca la rama de Git actual en la esquina superior derecha
    lualine_c = { "filename" }, -- Coloca el nombre del archivo actual en el centro
    lualine_x = { "encoding", get_os_name, "filetype" }, -- Muestra la codificación, el nombre del host y el tipo de archivo en la esquina superior derecha
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = {},
  },
})

-- Set the color scheme to catppuccin-mocha
vim.cmd("colorscheme catppuccin-mocha")
