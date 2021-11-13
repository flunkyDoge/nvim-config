-- Importing plugins first since that's required for some reason lol
require('plugins')

-- Import vimscript files
vim.cmd[[
		source ~/.config/nvim/general/paths.vim
		source ~/.config/nvim/general/lsp-keys.vim
		source ~/.config/nvim/general/auto.vim
		source ~/.config/nvim/keys/mappings.vim
		source ~/.config/nvim/general/lightline.vim
		source ~/.config/nvim/general/signify.vim
		source ~/.config/nvim/general/sneak.vim
	]]

-- Import remaining lua files
require('autocomplete')
require('terminal')
require('dashboard')
require('settings')
require('colorscheme')
require('surround')

-- Import the LSP config files
-- require('lsp.linter')
require('lsp.python-lsp')
require('lsp.lua-lsp')
require('lsp.bash-lsp')
require('lsp.csharp-lsp')

terminal = require('nvim-terminal').DefaultTerminal;

local silent = { silent = true }

vim.api.nvim_set_keymap('n', '<leader>t', ':lua terminal:toggle()<cr>', silent)
vim.api.nvim_set_keymap('n', '<leader>1', ':lua terminal:open(1)<cr>', silent)
vim.api.nvim_set_keymap('n', '<leader>2', ':lua terminal:open(2)<cr>', silent)
vim.api.nvim_set_keymap('n', '<leader>3', ':lua terminal:open(3)<cr>', silent)
