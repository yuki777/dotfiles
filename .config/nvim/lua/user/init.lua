---- 開始時にカレントディレクトリのツリーを表示する
----vim.cmd("autocmd VimEnter * Neotree toggle")
--vim.cmd("autocmd VimEnter * Neotree")
--
---- 開始時に前回終了時のセッションを開く
--vim.cmd("autocmd VimEnter * SessionManager load_current_dir_session")
--
---- セッションを終了時に自動保存
--vim.cmd("autocmd VimLeave * SessionManager save_current_session")
--
--return {}
return
{
	-- https://www.lazyvim.org/plugins/ui#bufferlinenvim
	"https://github.com/akinsho/bufferline.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function() require('bufferline').setup({
		options = {
			mode = "tabs",
		},
	}) end
}
