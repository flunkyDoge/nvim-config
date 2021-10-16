-- Importing plugins first since that's required for some reason lol
require('plugins')

-- Import vimscript files
vim.cmd[[
		source ~/.config/nvim/general/paths.vim
		source ~/.config/nvim/general/lsp-keys.vim
		source ~/.config/nvim/general/auto.vim
		source ~/.config/nvim/keys/mappings.vim
		source ~/.config/nvim/general/lightline.vim
	]]

-- Import remaining lua files
require('autocomplete')
require('terminal')
require('dashboard')
require('settings')
require('colorscheme')

-- Import the LSP config files
require('lsp.python-lsp')
require('lsp.lua-lsp')
require('lsp.bash-lsp')
