return {
	"ckipp01/stylua-nvim",
	config = function()
		require("stylua-nvim").setup({
			config_file = "stylua.toml",
		})
	end,
}
