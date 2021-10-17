local Plug = vim.fn['plug#']

-- Auto upgrade vim-plug and update plugs upon start
vim.cmd [[
    if empty(glob('~/.config/nvim/autoload/plug.vim'))
        silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall
        autocmd VimEnter * PlugInstall | source $MYVIMRC
    endif
]]

vim.call('plug#begin', '~/.config/nvim/plugged')

    -- Better Syntax Support
    Plug('sheerun/vim-polyglot')
    -- File Explorer sidebar
    Plug('scrooloose/NERDTree', {on = 'NERDTreeToggle'})
    -- NERDTree extensions
    Plug('Xuyuanp/nerdtree-git-plugin')
    Plug('tiagofumo/vim-nerdtree-syntax-highlight')
    Plug('scrooloose/nerdtree-project-plugin')
    Plug('PhilRunninger/nerdtree-visual-selection')
    -- Ranger Integration
    Plug('francoiscabrol/ranger.vim')
    Plug('rbgrouleff/bclose.vim')
    -- Auto pairs for '(' '[' '{'
    Plug('tpope/vim-surround')
    -- LSP
    Plug('neovim/nvim-lspconfig')
    Plug('glepnir/lspsaga.nvim')
    Plug('onsails/lspkind-nvim')
    Plug('kosayoda/nvim-lightbulb')
    Plug('mfussenegger/nvim-jdtls')
    Plug('mfussenegger/nvim-dap')
    -- Autocomplete
    Plug('hrsh7th/cmp-nvim-lsp')
    Plug('hrsh7th/cmp-buffer')
    Plug('hrsh7th/nvim-cmp')
    Plug('hrsh7th/cmp-path')
    Plug('ray-x/cmp-treesitter')
    Plug('L3MON4D3/LuaSnip')
    -- LSP installer
    Plug('williamboman/nvim-lsp-installer')
    -- Bottom bar, lightline
    Plug('itchyny/lightline.vim')
    Plug('taohexxx/lightline-buffer')
    -- Icons
    Plug('ryanoasis/vim-devicons')
    Plug('kyazdani42/nvim-web-devicons')
    -- Fuzzy Search
    Plug('nvim-lua/plenary.nvim')
    Plug('nvim-telescope/telescope.nvim')
    Plug('BurntSushi/ripgrep')
    Plug('nvim-telescope/telescope-fzf-native.nvim')
    Plug('nvim-treesitter/nvim-treesitter')
    Plug('sharkdp/fd')
    Plug('nvim-telescope/telescope-frecency.nvim')
    Plug('tami5/sqlite.lua')
    Plug('nvim-lua/popup.nvim')
    Plug('nvim-telescope/telescope-media-files.nvim')
    Plug('AckslD/nvim-neoclip.lua')
    -- Themes
    Plug('navarasu/onedark.nvim')
    Plug('cocopon/iceberg.vim')
    --Terminal Emulator
    Plug('s1n7ax/nvim-terminal')
    -- Command list
    Plug('liuchengxu/vim-which-key')
    -- Colour preview for hex codes
    Plug('lilydjwg/colorizer')
    -- Sneak, better ctrl + F basically
    Plug('justinmk/vim-sneak')
    -- Home screen with a bunch of shit
    Plug('glepnir/dashboard-nvim')
    -- Restore session
    Plug('folke/persistence.nvim')
    -- Passwordstore
    Plug('fourjay/vim-password-store')
    -- Git Integration
    Plug ('mhinz/vim-signify')
    Plug ('tpope/vim-fugitive')
    Plug ('tpope/vim-rhubarb')
    Plug ('junegunn/gv.vim')
    Plug ('airblade/vim-gitgutter')
    -- Line up text
    Plug ('godlygeek/tabular')
    -- Show indentation
    Plug ('Yggdroot/indentLine')

vim.call('plug#end')
