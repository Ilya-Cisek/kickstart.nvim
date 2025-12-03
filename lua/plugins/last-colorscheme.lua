return {
    'raddari/last-color.nvim',
    config = function()
        require('last-color').setup {
            -- Optional: Customize the file path where the colorscheme is saved
            file_path = vim.fn.stdpath 'data' .. '/last_colorscheme',
            -- Optional: Define a fallback colorscheme if the saved one is not found or invalid
            fallback_colorscheme = 'default',
        }
    end,
}
