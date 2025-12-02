return {
    "goolord/alpha-nvim",
    dependencies = { "echasnovski/mini.icons" },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        local version = vim.version()
        local version_string = string.format("Version v%d.%d.%d", version.major, version.minor, version.patch)

        dashboard.section.header.val = {
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                     ]],
            [[       ████ ██████           █████      ██                     ]],
            [[      ███████████             █████                             ]],
            [[      █████████ ███████████████████ ███   ███████████   ]],
            [[     █████████  ███    █████████████ █████ ██████████████   ]],
            [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
            [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
            [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
            [[                                                                       ]],
            string.format("    %-65s", version_string),
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
        }

        -- Get Neovim version

        -- Add version to footer

        alpha.setup(dashboard.opts)
    end,
}
