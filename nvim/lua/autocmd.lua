local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePre", {
	pattern = "*.js",
	callback = function()
		-- for some reason I can't pass _G.TestFileRace as a param, must br called
		vim.cmd("Prettier")
	end,
})

autocmd("BufWritePost", {
	pattern = "*.lua",
	callback = function()
		vim.cmd("FormatWrite")
	end,
})
