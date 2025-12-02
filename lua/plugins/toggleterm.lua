return {
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {},
  config = function()
    require("toggleterm").setup({
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4 -- 40% of window width
        end
      end,
      direction = "vertical",
    })

    -- Custom terminal for lazygit (vertical version)
    local Terminal = require("toggleterm.terminal").Terminal
    
    local lazygit = Terminal:new({
      cmd = "lazygit",
      dir = "git_dir",
      direction = "vertical",
      size = function() return math.floor(vim.o.columns * 0.30) end, -- 60% width for lazygit
      on_open = function(term)
        vim.cmd("startinsert!")
      end,
    })

    function _lazygit_toggle()
      lazygit:toggle()
    end

    -- Keymaps
    vim.keymap.set("n", "<leader>og", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true, desc = "Toggle lazygit"})
    vim.keymap.set("n", "<leader>ot", "<cmd>toggleterm direction=horizontal<CR>", {noremap = true, silent = true, desc = "Opens terminal"})
  end
}
