---@diagnostic disable: undefined-global
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

local m = require("funs")

-- Table of environments
local ENVS = {}
ENVS["t"] = "theorem"
ENVS["l"] = "lemma"
ENVS["p"] = "proposition"
ENVS["c"] = "corollary"
ENVS["d"] = "defn"
ENVS["r"] = "rem"
ENVS["o"] = "pf"
ENVS["x"] = "exer"


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
    t({""}),
    i(0),
    t({"","\\end{result}",""}),
  }, { condition = m.in_text and m.begins_line }),
  -- Other environments
  s({ trig = ";([drox])", regTrig = true, wordTrig = false }, {
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
    t(""),
    i(2),
    t({"","\\end{"}),
    f(function(_, snip)
      if ENVS[snip.captures[1]] then
        return ENVS[snip.captures[1]]
      end
      return ""
    end),
    t({"}", ""}),
  }, { condition = m.in_text and m.begins_line }),
  s("enum", {
    t("\\begin{enumerate}"),
    c(1, {
      t(),
      t("[label=(\\alph*)]"),
      t("[label=(\\arabic*)]"),
      t("[label=(\\roman*)]"),
    }),
    t({ "", "\\item " }),
    i(0),
    t({ "", "\\end{enumerate}" }),
  }, { condition = m.in_text and m.begins_line }),
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
  }, { condition = m.in_text }),
  -- Problem environment
  s("pnc", {
    t("\\begin{probnc}{"),
    i(1),
    t("}"),
    i(0),
    t({"", "\\end{probnc}"}),
  }, { condition = m.in_text and m.begins_line })
}, 
{ type = "autosnippets" })
