local set = vim.opt
local g = vim.g

-- set leader key
g.mapleader = " "

vim.cmd 'syntax=enable'                   -- Enables syntax highlighing
set.termguicolors = true                  -- Theme compatability
set.hidden = true                         -- Required to keep multiple buffers open multiple buffers
set.wrap = false                          -- Display long lines as just one line
set.encoding = 'utf-8'                    -- The encoding displayed
set.pumheight = 10                        -- Makes popup menu smaller
set.fileencoding = 'utf-8'                -- The encoding written to file
set.ruler = true              			      -- Show the cursor position all the time
set.cmdheight = 2                         -- More space for displaying messages
vim.cmd 'set iskeyword+=-'                -- treat dash separated words as a word text object"
set.mouse = 'a'                           -- Enable your mouse
set.splitbelow = true                     -- Horizontal splits will automatically be below
set.splitright = true                     -- Vertical splits will automatically be to the right
vim.cmd 'set t_Co=256'                    -- Support 256 colors
set.conceallevel = 0                      -- So that I can see `` in markdown files
set.tabstop = 2                           -- Insert 2 spaces for a tab
set.shiftwidth = 2                        -- Change the number of space characters inserted for indentation
set.smarttab = true                       -- Makes tabbing smarter will realize you have 2 vs 4
set.expandtab = true                      -- Converts tabs to spaces
set.smartindent = true                    -- Makes indenting smart
set.autoindent = true                     -- Good auto indent
set.number = true                         -- Line numbers
set.cursorline = true                     -- Enable highlighting of the current line
set.background = 'dark'                   -- tell vim what the background color looks like
set.showtabline = 2                       -- Always show tabs
vim.cmd 'set noshowmode'                  -- We don't need to see things like -- INSERT -- anymore
set.backup = false                        -- This is recommended by coc
vim.cmd 'set nowritebackup'               -- This is recommended by coc
set.updatetime = 100                      -- Faster completion
set.timeoutlen = 500                      -- By default timeoutlen is 1000 ms
set.hlsearch = true                       -- Better searching
vim.cmd [[
	set formatoptions-=r 
	set formatoptions-=c 
	set formatoptions-=o
]]
set.clipboard = 'unnamedplus'             -- Copy paste between vim and everything else
set.autochdir = true                      -- Your working directory will always be the same as your working directory
set.ignorecase = true                     -- Case insensitive search
set.smartcase = true                      -- Case insensitive when using cases
g.EasyMotion_smartcase = 1              -- Smart casing for EasyMotion 
g.EasyMotion_use_smartsign_us = 1       -- US layout for SmartCase 
vim.cmd [[
	set guioptions+=a
]]

-- auto source when writing to init.vm alternatively you can run :source $MYVIMRC
vim.cmd [[
au! BufWritePost $MYVIMRC source %
cmap w!! w !sudo tee %
]]

vim.cmd [[let g:incsearch#auto_nohlsearch = 1]]
-- Set bin location for LanguageTool
g.languagetool_cmd = '/usr/bin/languagetool'
