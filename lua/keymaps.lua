local map = vim.keymap.set

-- nmap <C-p> :Files<CR>
map(
	'n',
	'<C-p>',
	':Files<CR>',
	{desc = 'fzf Files'}
)

-- nmap <C-e> :Buffers<CR> 
map(
	'n',
	'<C-e>',
	':Buffers<CR>',
	{desc = 'fzf Buffers'}
)

-- let g:fzf_action = { 'ctrl-e': 'edit' }


-- Start an external command with a single bang
map('n', '!', ':!', { desc = 'Execute Shell Command' })

-- 命令行模式使用 上下键代替 
map('c', '<Up>', '<C-p>')
map('c', '<Down>', '<C-n>')

-- Allow misspellings
vim.cmd.cnoreabbrev('qw', 'wq')
vim.cmd.cnoreabbrev('Wq', 'wq')
vim.cmd.cnoreabbrev('WQ', 'wq')
vim.cmd.cnoreabbrev('Qa', 'qa')
vim.cmd.cnoreabbrev('Bd', 'bd')
vim.cmd.cnoreabbrev('bD', 'bd')

-- Switch (window) to the directory of the current opened buffer
map('n', '<Leader>cd', function()
	local bufdir = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':p:h')
	if vim.loop.fs_stat(bufdir) then
		vim.defer_fn(function()
			vim.cmd.lcd(bufdir)
		end, 300)
		vim.notify(bufdir)
	end
end, { desc = 'Change Local Directory' })

-- easy-align
map(
	{ 'n','x'},
	'ga',
	'<Plug>(EasyAlign)',
	{desc = 'EasyAlign'}
)

-- nvim-tree
map(
	{ 'n','x'},
	'tree',
	':NvimTreeToggle<CR>',
	{desc = 'NvimTreeToggle'}
)
