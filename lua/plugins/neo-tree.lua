return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      -- Telescope-like theme configuration
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      default_component_configs = {
        indent = {
          indent_size = 2,
          padding = 1,
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└",
          highlight = "NeoTreeIndentMarker",
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "ﰊ",
          default = "",
        },
        name = {
          trailing_slash = false,
          use_git_status_colors = true,
        },
        git_status = {
          symbols = {
            added     = "",
            modified  = "",
            deleted   = "",
            renamed   = "➜",
            untracked = "",
            ignored   = "",
            unstaged  = "",
            staged    = "",
            conflict  = "",
          }
        },
      },
      window = {
        position = "float",
        width = 40,
        mappings = {
          ["<space>"] = "none",
          ["l"] = "open",
          ["h"] = "close_node",
          ["<cr>"] = "open",
          -- Add tab switching with [ and ]
          ["["] = "prev_source",
          ["]"] = "next_source",
        }
      },
      filesystem = {
        follow_current_file = {
          enabled = true
        },
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        use_libuv_file_watcher = true,
      },
      -- Float window configuration (Telescope-like)
      source_selector = {
        winbar = true,
        statusline = false,
        sources = {
          { source = "filesystem", display_name = " 󰉓 Files " },
          { source = "buffers",    display_name = " 󰈚 Buffers " },
          { source = "git_status", display_name = " 󰊢 Git " },
        },
      },
      -- Telescope-like floating window appearance
      float = {
        enable = true,
        open_win_config = function()
          local screen_w = vim.opt.columns:get()
          local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
          local window_w = math.min(80, screen_w * 0.8)
          local window_h = math.min(20, screen_h * 0.8)
          local center_x = (screen_w - window_w) / 2
          local center_y = ((screen_h - window_h) / 2) - 1
          return {
            relative = "editor",
            border = "rounded",
            width = window_w,
            height = window_h,
            col = center_x,
            row = center_y,
            -- Add these lines for solid background
            style = "minimal",
            winblend = 0, -- 0 = fully opaque, 100 = fully transparent
          }
        end,
      },
    })

    vim.keymap.set("n", "<leader>e", ":Neotree reveal float <CR>", { desc = "Reveal file in Neotree" })
    
    -- Set highlights for solid background
    vim.cmd([[
      " Make NeoTree background solid
      highlight! NeoTreeNormal guibg=#1a1a1a
      highlight! NeoTreeFloatBorder guibg=#1a1a1a guifg=#666666
      highlight! NeoTreeFloatTitle guibg=#1a1a1a guifg=#ffffff
      highlight! NeoTreeTitleBar guibg=#1a1a1a guifg=#ffffff
      
      " If the above doesn't work, try these more specific highlights:
      highlight! NeoTreeFloatNormal guibg=#1a1a1a
      highlight! link NeoTreeFloatBorder NormalFloat
    ]])
  end
}
