-- helpful resource: https://icyphox.sh/blog/nvim-lua/
require("settings")
require("plugins")
require("maps")
require("autocmd")
require("lsp")

vim.cmd("colorscheme tokyonight-storm")

vim.opt.clipboard="unnamed"

vim.g.ale_sign_error = '✘'
vim.g.ale_sign_warning = '⚠'
