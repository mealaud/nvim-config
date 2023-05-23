return {
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup()

    local Rule = require('nvim-autopairs.rule')
    local npairs = require('nvim-autopairs')
    local cond = require('nvim-autopairs.conds')
    print(vim.inspect(cond))

    -- npairs.add_rule(Rule("$", "$","tex"):with_move(cond.done()))
    npairs.add_rule(
    Rule("$", "$", "tex")
    :with_move(function(opts)
      return opts.next_char == opts.char
    end)
    )

    -- Don't autopair ' when in a .tex file
    require("nvim-autopairs").get_rule("'")[1]:with_pair(function()
      if vim.bo.filetype == "tex" then
        return false
      end
    end)

    -- Don't autopair " when in a .tex file
    require("nvim-autopairs").get_rule('"')[1]:with_pair(function()
      if vim.bo.filetype == "tex" then
        return false
      end
    end)
  end,
}
