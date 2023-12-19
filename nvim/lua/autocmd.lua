local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePre", {
	pattern = { "*.js", "*.jsx" },
	callback = function()
		-- for some reason I can't pass _G.TestFileRace as a param, must br called
		vim.cmd("Prettier")
	end,
})

autocmd("BufWritePre", {
	pattern = { "*.py" },
	callback = function()
		vim.cmd("silent !black %") -- run the formatter
		vim.cmd("e!") -- force reload the file
	end,
})

autocmd("BufWritePost", {
	pattern = "*.lua",
	callback = function()
		vim.cmd("FormatWrite")
	end,
})
