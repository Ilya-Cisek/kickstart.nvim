return {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000,
    config = function()
        -- Enable transparent background for Moonfly
        vim.g.moonflyTransparent = true
        vim.cmd.colorscheme "moonfly"
        -- Optional: Also set floating windows to be transparent
        vim.g.moonflyNormalFloat = true
    end,
}
