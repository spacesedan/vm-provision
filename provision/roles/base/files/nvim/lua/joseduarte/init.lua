require("joseduarte.set")
require("joseduarte.remap")

local augroup = vim.api.nvim_create_augroup
local JoseDuarteGroup = augroup('JoseDuarte', {})
local yank_group = augroup('HighlightYank', {})

local autocmd = vim.api.nvim_create_autocmd


autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})


autocmd({ "BufWritePre" }, {
    group = JoseDuarteGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

function R(name)
    require("plenary.reload").reload_module(name)
end

-- additional filetypes
vim.filetype.add({
    extension = {
        templ = "templ",
    },
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
