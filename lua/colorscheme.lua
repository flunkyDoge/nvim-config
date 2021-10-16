local g = vim.g

g.onedark_style = 'darker'           -- We need add the configs before colorscheme line
g.onedark_transparent_background = 1 -- By default it is 0
g.onedark_diagnostics_undercurl = 0  -- By default it is 1
g.onedark_darker_diagnostics = 0     --By default it is 1
vim.cmd 'colorscheme onedark'
