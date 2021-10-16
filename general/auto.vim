" transparent bg i think
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
