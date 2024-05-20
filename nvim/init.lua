-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Habilitar el cargador si está disponible
if vim.loader then
  vim.loader.enable()
end

-- Definir función de impresión para depuración
_G.dd = function(...)
  require("util.debug").dump(...)
end
vim.print = _G.dd

-- Cargar la configuración diferida (lazy)
require("config.lazy")

-- Cargar TokyoDark
require("plugins.colorscheme")

-- Cargar Lualine
local lualine = require("lualine")

-- Función para obtener el nombre del sistema operativo
local function get_os_name()
  local f = io.popen("uname -s")
  local os_name = f:read("*a") or "Unknown OS"
  f:close()
  return os_name:sub(1, -2) -- Eliminar el salto de línea al final
end

lualine.setup({
  options = {
    theme = "tokyodark", -- Elige el tema de Lualine
    section_separators = "", -- Puedes personalizar los separadores entre las secciones
    component_separators = "|", -- Puedes personalizar los separadores entre los componentes
  },
  sections = {
    lualine_a = { "mode" }, -- Coloca el modo actual de Vim en la esquina superior izquierda
    lualine_b = { "branch" }, -- Coloca la rama de Git actual en la esquina superior derecha
    lualine_c = { "filename" }, -- Coloca el nombre del archivo actual en el centro
    lualine_x = { "encoding", "hostname", get_os_name, "filetype" }, -- Muestra la codificación, el nombre del host y el tipo de archivo en la esquina superior derecha
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = {},
  },
})
