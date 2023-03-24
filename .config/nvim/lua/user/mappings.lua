-- <F12> Neotreeと行表示を非表示にする
vim.api.nvim_set_keymap('n', '<F12>', ':Neotree close<CR>:set number! relativenumber!<CR>', {noremap = true, silent = true})
