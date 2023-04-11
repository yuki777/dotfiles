-- -- <F1>  ファイルのFullpathを表示しつつ、Fullpathをコピーする
-- vim.api.nvim_set_keymap('n', '<F1>', ':let @*=expand("%:p")<CR>:echo expand("%:p")<CR>', {noremap = true, silent = true})
-- -- <F2>  設定可能
-- vim.api.nvim_set_keymap('n', '<F2>', ':set paste!<CR>', {noremap = true, silent = true})
-- -- <F3>  設定可能
-- vim.api.nvim_set_keymap('n', '<F3>', ':echo 3<CR>', {noremap = true})
-- -- <F4>  設定可能
-- vim.api.nvim_set_keymap('n', '<F4>', ':echo 4<CR>', {noremap = true})
-- -- <F5>  デバッグ実行する
-- -- <F6>  ?
-- -- <F7>  ターミナルを開く
-- -- <F8>  設定可能
-- vim.api.nvim_set_keymap('n', '<F8>', ':echo 8<CR>', {noremap = true})
-- -- <F9>  デバッグブレイクポイントを設定する
-- -- <F10> ?
-- -- <F11> ?
-- -- <F12> Neotreeを閉じて、Gitsignsをトグルして、行表示をトグルする
-- vim.api.nvim_set_keymap('n', '<F12>', ':Neotree close<CR>:Gitsigns toggle_signs<CR>:set number! relativenumber!<CR>', {noremap = true, silent = true})
-- 
-- -- <tab> nextバッファへ移動する
-- vim.api.nvim_set_keymap('n', '<tab>', ':bnext<CR>', {noremap = true, silent = true})
-- -- <S-tab> previousバッファへ移動する
-- vim.api.nvim_set_keymap('n', '<S-tab>', ':bprevious<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })
vim.api.nvim_set_keymap('n', '<Down>', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', '<Up>', 'gk', { noremap = true })
vim.api.nvim_set_keymap('n', 'gj', 'j', { noremap = true })
vim.api.nvim_set_keymap('n', 'gk', 'k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W>l', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-h>', '^', { noremap = true })
vim.api.nvim_set_keymap('n', '*', '*N', { noremap = true })
vim.api.nvim_set_keymap('n', '#', '#N', { noremap = true })
vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':nohl<CR>:set nopaste<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<tab>', ':tabnext<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-tab>', ':tabprevious<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-d>', ':Neotree toggle<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F11>', ':set paste<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F12>', ':Neotree close<CR>:Gitsigns toggle_signs<CR>:set number! relativenumber!<CR>', {noremap = true, silent = true})
