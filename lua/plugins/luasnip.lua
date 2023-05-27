return {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    config = function()
        local types = require("luasnip.util.types")

        -- Loads in snippets
        require("luasnip.loaders.from_lua").load({
            paths = vim.fn["stdpath"]("config") .. "/luasnippets/",
        })
        -- Adds a new command to reload snippets
        vim.api.nvim_create_user_command("ReloadSnippets", function()
            require("luasnip.loaders.from_lua").load({
                paths = vim.fn["stdpath"]("config") .. "/luasnippets/",
            })
        end, {})

        require("luasnip").config.set_config({
            update_events = "TextChanged,TextChangedI",
            enable_autosnippets = true,
            store_selection_keys = "<Tab>",
            -- ext_opts = {
            --     [types.choiceNode] = {
            --         active = {
            --             virt_text = { { "<- Choice" } },
            --         },
            --     },
            -- },
        })

        local ls = require("luasnip")
        -- Keymaps
        vim.keymap.set('i', '<Tab>', function()
          if ls.expand_or_jumpable() then
            return '<Plug>luasnip-expand-or-jump'
          else 
            return '<Tab>'
          end
        end, { expr = true })

        vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
            if ls.jumpable(-1) then
                ls.jump(-1)
            end
        end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<C-j>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<C-k>", function()
            if ls.choice_active() then
                ls.change_choice(-1)
            end
        end, { silent = true })
    end,
}
