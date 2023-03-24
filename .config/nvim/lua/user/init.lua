-- 開始時にカレントディレクトリのツリーを表示する
vim.cmd("autocmd VimEnter * Neotree toggle")

-- 開始時に前回終了時のセッションを開く
vim.cmd("autocmd VimEnter * SessionManager load_current_dir_session")

-- セッションを終了時に自動保存
vim.cmd("autocmd VimLeave * SessionManager save_current_session")

return {}
