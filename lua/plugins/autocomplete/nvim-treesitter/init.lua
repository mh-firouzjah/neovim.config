return {
	"nvim-treesitter/nvim-treesitter",
	event = "BufReadPre",
	build = ":TSUpdate",
	config = function()
		require("packages.autocomplete.nvim-treesitter.main")
	end,
}
