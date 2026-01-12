vim.g.mapleader = " "

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set('n', 't', function()
  local bottom_term_win
  local bottom_row = -1

  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].buftype == 'terminal' then
      local pos = vim.api.nvim_win_get_position(win)
      if pos[1] > bottom_row then
        bottom_row = pos[1]
        bottom_term_win = win
      end
    end
  end

  if bottom_term_win then
    vim.api.nvim_set_current_win(bottom_term_win)
    vim.api.nvim_win_set_height(bottom_term_win, 12)
    vim.cmd('vsplit | terminal')
  else
    vim.cmd('botright 12split | terminal')
  end
end, { silent = true })

vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h]], { silent = true })
vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-w>j]], { silent = true })
vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]], { silent = true })
vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>l]], { silent = true })
