-- NvimTree shortcuts
-- Ctrl + s -> Opens Tree
vim.api.nvim_set_keymap('n', '<C-s>', ':NvimTreeToggle<CR>',
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh<CR>',
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeFindFile<CR>',
    { noremap = true, silent = true })

-- Traversing splits
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W><C-J>',
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-K>', '<C-W><C-K>',
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>',
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>',
    { noremap = true, silent = true })

-- Trouble
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>",
    {silent = true, noremap = true})

vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>",
    {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>",
    {silent = true, noremap = true})

vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>",
    {silent = true, noremap = true})

vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
    {silent = true, noremap = true})

vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>",
    {silent = true, noremap = true})

-- Hop
vim.api.nvim_set_keymap("n", "fw", "<cmd>HopWord<cr>",
    {silent = true, noremap = true})

vim.api.nvim_set_keymap("n", "fl", "<cmd>HopLine<cr>",
    {silent = true, noremap = true})

vim.api.nvim_set_keymap("n", "fp", "<cmd>HopPattern<cr>",
    {silent = true, noremap = true})

-- Sniprun
vim.api.nvim_set_keymap("n", "run", "<cmd>SnipRun<cr>",
    {silent = true, noremap = true})

vim.api.nvim_set_keymap("n", "<leader>rs", "<cmd>SnipReset<cr>",
    {silent = true, noremap = true})

-- Telescope
vim.api.nvim_set_keymap('n', '<leader>tb',
    [[<cmd>lua require('telescope.builtin').buffers()<CR>]],
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>tf',
    [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]],
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>tbf',
    [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]],
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>th',
    [[<cmd>lua require('telescope.builtin').help_tags()<CR>]],
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>tt',
    [[<cmd>lua require('telescope.builtin').tags()<CR>]],
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>td',
    [[<cmd>lua require('telescope.builtin').grep_string()<CR>]],
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>tg',
    [[<cmd>lua require('telescope.builtin').live_grep()<CR>]],
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>to',
    [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]],
    { noremap = true, silent = true })

-- Diagnostics
vim.api.nvim_set_keymap('n', '<leader>e',
    [[<cmd>lua vim.diagnostic.open_float()<CR>]],
    { noremap = true, silent = true })

-- Copilot
vim.cmd [[imap <silent><script><expr> <C-s> copilot#Accept('\<CR>')]]
