local map = vim.keymap.set

-- buffer operations
map('n', '<leader>bn', ':bn<cr>', {})
map('n', '<leader>bp', ':bp<cr>', {})

-- tab operations
map('n', '<leader>tn', ':tabnew<cr>', {})
map('n', '<leader>tc', ':tabclose<cr>', {})
map('n', '<C-n>', ':tabnext<cr>', {})
map('n', '<C-p>', ':tabprevious<cr>', {})

-- window operations
map('n', '<leader>wh', '<C-w>s<cr>', {})
map('n', '<leader>wv', '<C-w>v<cr>', {})
map('n', '<leader>sc', '<C-w>q', {})
map('n', '<C-h>', '<C-w>h', {})
map('n', '<C-j>', '<C-w>j', {})
map('n', '<C-k>', '<C-w>k', {})
map('n', '<C-l>', '<C-w>l', {})

-- terminal operations
map('n', '<leader>ft', ':FloatermToggle<cr>', {})
map('t', '<Esc>', '<C-\\><C-n>:FloatermToggle<cr>', {})

-- nvim-tree
map('n', '<leader>n', [[:NvimTreeToggle<cr>]], {})

-- telescope
map('n', '<leader>ff', [[:Telescope find_files<cr>]], { noremap = true, silent = true })
map('n', '<leader>fg', [[:Telescope live_grep<cr>]], { noremap = true, silent = true })
map('n', '<leader>fb', [[:Telescope buffers<cr>]], { noremap = true, silent = true })
map('n', '<leader>fh', [[:Telescope help_tags<cr>]], { noremap = true, silent = true })

vim.cmd([[
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
]]
)