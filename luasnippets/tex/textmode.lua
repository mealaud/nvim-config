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


ls.add_snippets("tex", {
  s(";q", {
    t("\\textcolor{red}{"),
    i(1),
    t("}"),
    i(0),
  }, { condition = m.in_text }),
  s(":fo", t("(\\(\\Rightarrow\\))"), { condition = m.in_text }),
  s(":re", t("(\\(\\Leftarrow\\))"), { condition = m.in_text }),
  s(":su", t("(\\(\\subseteq\\))"), { condition = m.in_text }),
  s(":Su", t("(\\(\\supseteq\\))"), { condition = m.in_text }),
  s("*", {
    t("\\textbf{"),
    i(1),
    t("}"),
    i(0),
  }, { condition = m.in_text }),
  s("_", {
    t("\\textit{"),
    i(1),
    t("}"),
    i(0),
  }, { condition = m.in_text }),
}, { type = "autosnippets" })
