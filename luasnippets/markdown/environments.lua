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

-- Table of environments
local ENVS = {}
ENVS["t"] = "thm"
ENVS["l"] = "lem"
ENVS["p"] = "prop"
ENVS["c"] = "coro"
ENVS["d"] = "defn"
ENVS["r"] = "rem"
ENVS["o"] = "pf"
ENVS["e"] = "ex"
ENVS["u"] = "up"


ls.add_snippets("markdown", {
  -- math environments
  s({ trig = ";([tlpcdreu])", regTrig = true, wordTrig = false }, {
    t("{{% MathEnv \""),
    f(function(_, snip)
      if ENVS[snip.captures[1]] then
        return ENVS[snip.captures[1]]
      end
      return ""
    end),
    -- c(1, {
    --   t(),
    --   { t("{\\label{"), i(1), t("}}") }
    -- }),
    t({"\" %}}", ""}),
    i(0),
    t({"","{{% /MathEnv %}}",""}),
  }, { condition = m.in_text and m.begins_line }),
  s(";al", {
    t({"","$$\\begin{align"}),
    c(1, {
      t(),
      t("*"),
    }),
    t({"}", "\t"}),
    i(2),
    t({"", "\\end{align"}),
    rep(1),
    t("}$$"),
  }, { condition = m.in_text }),
   -- newlines in align/math
   s("\\\\", t("\\\\\\\\"), { condition = m.in_mathzone }),
   -- proof env
  s({ trig = ";([o])", regTrig = true, wordTrig = false }, {
    t({"{{% Proof %}}", ""}),
    i(0),
    t({"", "{{% /Proof %}}"}),
  }, { condition = m.in_text }),
}, 
{ type = "autosnippets" })
