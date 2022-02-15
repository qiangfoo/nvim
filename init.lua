require('plugins')
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.mouse = 'a'
vim.opt.confirm = true

require('nightfox').load("nightfox")

require('nvim-tree').setup {
    view = {
        width = 30,
        auto_resize = true,
        side = 'right'
    }
}
require('lualine').setup{}

local cmp = require('cmp')
cmp.setup{
  snippet = {
    expand = function (args)
      vim.fn["vsnip#anonymous"](args.body) 
    end
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = true })
  },
  sources = cmp.config.sources({
    { name = 'buffer' }
  })
}

-- keymaps
local keymap = function (mode, from, to)
  vim.api.nvim_set_keymap(mode, from, to, { noremap = true, silent = true })
end

keymap('n', '<Leader>fb', "<cmd>lua require('fzf-lua').blines()<CR>")
keymap('n', '<Leader>ff', "<cmd>lua require('fzf-lua').files()<CR>")
keymap('n', '<Leader>p', '"+P')
keymap('v', '<Leader>y', '"+y')
keymap('n', '<Leader>c', ':BufferClose<CR>')
