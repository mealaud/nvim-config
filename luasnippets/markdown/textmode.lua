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

local m = require("mdfuns")


ls.add_snippets("markdown", {
  s(":fo", t("($\\Rightarrow$)"), { condition = m.in_text }),
  s(":re", t("($\\Leftarrow$)"), { condition = m.in_text }),
  s(":su", t("($\\subseteq$)"), { condition = m.in_text }),
  s(":Su", t("($\\supseteq$)"), { condition = m.in_text }),
  s("\\\\", t("{{%nl%}}"), { condition = m.in_text }),
  s(":td", {t("{{% tdf \""), i(1), t("\" %}} "), i(0)}, { condition = m.in_text } ),
  s("--", t("——"), { condition = m.in_text } ),
  s(":ts", t("⊢"), { condition = m.in_text } ),
  s(",,", t("&nbsp;&nbsp;&nbsp;&nbsp;"), { condition = m.in_text and m.begins_line } ),
  -- s("\\n", t("{{%nl%}}"), { condition = m.in_text }),
}, { type = "autosnippets" })
