local map = vim.keymap.set

-- NvimTree shortcuts
map('n', '<C-s>', ':NvimTreeToggle<CR>', { silent = true })
map('n', '<leader>r', ':NvimTreeRefresh<CR>', { silent = true })
map('n', '<leader>n', ':NvimTreeFindFile<CR>', { silent = true })

-- Traversing splits
map('n', '<C-J>', '<C-W><C-J>', { silent = true })
map('n', '<C-K>', '<C-W><C-K>', { silent = true })
map('n', '<C-L>', '<C-W><C-L>', { silent = true })
map('n', '<C-H>', '<C-W><C-H>', { silent = true })

-- Trouble
map("n", "<leader>xx", "<cmd>Trouble<cr>", { silent = true })
map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", { silent = true })
map("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", { silent = true })
map("n", "<leader>xl", "<cmd>Trouble loclist<cr>", { silent = true })
map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", { silent = true })
map("n", "gR", "<cmd>Trouble lsp_references<cr>", { silent = true })

-- Hop
map("n", "fw", "<cmd>HopWord<cr>", { silent = true })
map("n", "fl", "<cmd>HopLine<cr>", { silent = true })
map("n", "fp", "<cmd>HopPattern<cr>", { silent = true })

-- Telescope (lazy-loaded)
local telescope_loaded = false
local function load_telescope()
    if not telescope_loaded then
        telescope_loaded = true
        local telescope = require('telescope.builtin')
        map('n', '<leader>tb', telescope.buffers, { silent = true })
        map('n', '<leader>tf', function() telescope.find_files({previewer = false}) end, { silent = true })
        map('n', '<leader>tbf', telescope.current_buffer_fuzzy_find, { silent = true })
        map('n', '<leader>th', telescope.help_tags, { silent = true })
        map('n', '<leader>tt', telescope.tags, { silent = true })
        map('n', '<leader>td', telescope.grep_string, { silent = true })
        map('n', '<leader>tg', telescope.live_grep, { silent = true })
        map('n', '<leader>fh', telescope.help_tags)
        map('n', '<leader>to', function() telescope.tags{only_current_buffer = true} end, { silent = true })
    end
end

-- Create lazy-loaded Telescope mappings
local telescope_keys = {'tb', 'tf', 'tbf', 'th', 'tt', 'td', 'tg', 'to'}
for _, key in ipairs(telescope_keys) do
    map('n', '<leader>' .. key, function()
        load_telescope()
        vim.api.nvim_input('<leader>' .. key)
    end, { silent = true })
end

-- Diagnostics
map('n', '<leader>e', vim.diagnostic.open_float, { silent = true })

-- Resize
map('n', '<leader>rs', '<cmd>SmartResizeMode<CR>', { silent = true })

-- Buffer navigation
map('n', '<leader>bn', ':bnext<CR>')
map('n', '<leader>bp', ':bprevious<CR>')
map('n', '<leader>bd', ':bdelete<CR>')

-- Quick save
map('n', '<leader>s', ':w<CR>')

