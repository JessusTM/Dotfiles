return {
	{
		"tiagovla/tokyodark.nvim",
		priority = 1000,
		config = function()
			require("tokyodark").setup({
				transparent_background = false, -- establece el fondo transparente
				gamma = 1.00, -- ajusta el brillo del tema
				styles = {
					comments = { italic = true }, -- estilo para comentarios
					keywords = { italic = true }, -- estilo para palabras clave
					identifiers = { italic = true }, -- estilo para identificadores
					functions = {}, -- estilo para funciones
					variables = {}, -- estilo para variables
				},
				custom_highlights = function(highlights, palette) return {} end, -- extiende los resaltes
				custom_palette = function(palette) return {} end, -- extiende la paleta
				terminal_colors = true, -- habilita los colores del terminal
			})
			vim.cmd.colorscheme("tokyodark")
		end,
	},
}
