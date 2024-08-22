require("config.lazy")
require("config.lualine")
if vim.loader then
  vim.loader.enable()
end

_G.dd = function(...)
  require("util.debug").dump(...)
end
vim.print = _G.dd

vim.opt.guifont = "FiraCode Nerd Font:h17"

