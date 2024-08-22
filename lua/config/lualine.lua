local lualine = require('lualine')

-- Obtener la paleta de colores de Catppuccin
local C = require("catppuccin.palettes").get_palette("mocha")

-- Configuración de lualine con tema Catppuccin personalizado
lualine.setup {
    options = {
        theme = {
            normal = {
                a = { bg = C.blue, fg = C.mantle, gui = "bold" },
                b = { bg = C.surface0, fg = C.blue },
                c = { bg = C.base, fg = C.text },
            },
            insert = {
                a = { bg = C.green, fg = C.base, gui = "bold" },
                b = { bg = C.surface0, fg = C.green },
            },
            visual = {
                a = { bg = C.mauve, fg = C.base, gui = "bold" },
                b = { bg = C.surface0, fg = C.mauve },
            },
            replace = {
                a = { bg = C.red, fg = C.base, gui = "bold" },
                b = { bg = C.surface0, fg = C.red },
            },
            command = {
                a = { bg = C.peach, fg = C.base, gui = "bold" },
                b = { bg = C.surface0, fg = C.peach },
            },
            inactive = {
                a = { bg = C.base, fg = C.blue },
                b = { bg = C.base, fg = C.surface1, gui = "bold" },
                c = { bg = C.base, fg = C.overlay0 },
            },
        },
        icons_enabled = true,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        globalstatus = true,
    },
    sections = {
        lualine_a = {
            { 'mode', icon = '' },
        },
        lualine_b = {
            { 'branch', icon = '' },
            { 'diff', symbols = { added = ' ', modified = ' ', removed = ' ' } },
            { 'diagnostics', sources = { 'nvim_lsp' }, symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' } },
        },
        lualine_c = {
            { 'filename', icon = '󰈙' },
        },
        lualine_x = {
            { 'filetype' },
        },
        lualine_y = {
            { 'progress' },
        },
        lualine_z = {
            { 'location' },
        },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            { 'filename', icon = '󰈙' },
        },
        lualine_x = {
            { 'filetype' },
        },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = {},
}

