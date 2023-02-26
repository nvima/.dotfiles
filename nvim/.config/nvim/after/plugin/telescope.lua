local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fz', builtin.builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>fm', builtin.man_pages, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>gf', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- Definiert eine benutzerdefinierte Funktion, um Dateien im aktuellen Verzeichnis des Buffers zu suchen
function FindInCurrentDirectory()
  require('telescope.builtin').find_files({
    prompt_title = "Files in current directory",
    cwd = vim.fn.expand("%:p:h")
  })
end

-- Ordnet der Tastenkombination <leader>f die Funktion FindInCurrentDirectory zu
vim.api.nvim_set_keymap('n', '<leader>fz', ':lua FindInCurrentDirectory()<CR>', { noremap = true, silent = true })

