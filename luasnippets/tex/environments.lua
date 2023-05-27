---@diagnostic disable: undefined-global
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

local in_comment = function()
    return vim.fn["vimtex#syntax#in_comment"]() == 1
end

local in_mathzone = function()
    return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

local in_text = function()
    return not in_mathzone() and not in_comment()
end

local begins_line = function()
    local cur_line = vim.api.nvim_get_current_line()
    return #cur_line == #string.match(cur_line, "%s*[^%s]+")
end

local get_env = function(name)
    return {
        t({ "\\begin{" .. name .. "}", "\t" }),
        i(0),
        t({ "", "\\end{" .. name .. "}" }),
    }
end

-- Mel function
-- wordSteal
local function stringSteal(args) 
  return args[1][1]
end


-- Table of environments
local ENVS = {}
ENVS["t"] = "theorem"
ENVS["l"] = "lemma"
ENVS["p"] = "proposition"
ENVS["c"] = "corollary"
ENVS["d"] = "defn"
ENVS["r"] = "rem"
ENVS["o"] = "pf"


ls.add_snippets("tex", {
  -- Result environments
  s({ trig = ";([tlpc])", regTrig = true, wordTrig = false }, {
    f(function(_, snip)
      if ENVS[snip.captures[1]] then
        return "\\begin{result}{" .. ENVS[snip.captures[1]] .. "}"
      end
      return ""
    end),
    c(1, {
      t(),
      { t("{\\label{"), i(1), t("}}") }
    }),
    t({"","\t"}),
    i(0),
    t({"","\\end{result}",""}),
  }, { condition = in_text and begins_line }),
  -- Other environments
  s({ trig = ";([dro])", regTrig = true, wordTrig = false }, {
    t("\\begin{"),
    f(function(_, snip)
      if ENVS[snip.captures[1]] then
        return ENVS[snip.captures[1]]
      end
      return ""
    end),
    t("}"),
    c(1, {
      t(),
      { t("{\\label{"), i(1), t("}}") }
    }),
    t({"", "\t"}),
    i(2),
    t({"","\\end{"}),
    f(function(_, snip)
      if ENVS[snip.captures[1]] then
        return ENVS[snip.captures[1]]
      end
      return ""
    end),
    t({"}", ""}),
  }, { condition = in_text and begins_line }),
  s("enum", {
    t("\\begin{enumerate}"),
    c(1, {
      t(),
      t("[label=(\\alph*)]"),
      t("[label=(\\roman*)]"),
      t("[label=(\\arabic*)]"),
    }),
    t({ "", "\t\\item " }),
    i(0),
    t({ "", "\\end{enumerate}" }),
  }, { condition = in_text and begins_line }),
  -- align environments
  s(";al", {
    t("\\begin{align"),
    c(1, {
      t(),
      t("*"),
    }),
    t({"}", "\t"}),
    i(2),
    t({"", "\\end{align"}),
    rep(1),
    t("}"),
  }, { condition = in_text }),
  -- Problem environment
  s("pnc", {
    t("\\begin{probnc}{"),
    i(1),
    t({"}", "\t"}),
    i(0),
    t({"", "\\end{probnc}"}),
  }, { condition = in_text and begins_line })
}, 
{ type = "autosnippets" })
