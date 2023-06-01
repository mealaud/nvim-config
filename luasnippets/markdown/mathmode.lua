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

-- Mel function
local GREEK_LETTERS = {}
GREEK_LETTERS["a"] = "alpha"
GREEK_LETTERS["b"] = "beta"
GREEK_LETTERS["c"] = "chi"
GREEK_LETTERS["d"] = "delta"
GREEK_LETTERS["e"] = "varepsilon"
GREEK_LETTERS["v"] = "varphi"
GREEK_LETTERS["f"] = "phi"
GREEK_LETTERS["g"] = "gamma"
GREEK_LETTERS["i"] = "iota"
GREEK_LETTERS["l"] = "lambda"
GREEK_LETTERS["m"] = "mu"
GREEK_LETTERS["n"] = "nu"
GREEK_LETTERS["r"] = "rho"
GREEK_LETTERS["s"] = "sigma"
GREEK_LETTERS["t"] = "theta"
GREEK_LETTERS["u"] = "vartheta"
GREEK_LETTERS["w"] = "omega"
GREEK_LETTERS["x"] = "xi"
GREEK_LETTERS["z"] = "zeta"

ls.add_snippets("markdown", {
  -- display math
  s("dm", {
      t({"", "$$", "\t" }),
      i(0),
      t({ "", "$$" }),
  }, { condition = m.in_text }),
  s("mm", {
      t("$"),
      t(" "),
      i(1),
      t("$"),
      i(0),
  }, { condition = m.in_text }),
  -- Lowercase Greek
  s({ trig = ";(%l)", regTrig = true, wordTrig = false }, {
    f(function(_, snip)
      if GREEK_LETTERS[snip.captures[1]] then
        return "\\" .. GREEK_LETTERS[snip.captures[1]]
      end
      return ""
    end),
  }, { condition = m.in_mathzone }),
  -- Uppercase Greek
  s({ trig = ";(%u)", regTrig = true, wordTrig = false }, {
    f(function(_, snip)
      local greek_letter = GREEK_LETTERS[string.lower(snip.captures[1])]
      if greek_letter then
        return "\\" .. greek_letter:gsub("^%l", string.upper)
      end
      return ""
    end),
  }, { condition = m.in_mathzone }),
  -- LaTeX: Math subscripts
  s({ trig = "__", wordTrig = false }, {
    t("_{"),
    i(1),
    t("}"),
  }, { condition = m.in_mathzone }),
  -- LaTeX: Math superscripts
  s({ trig = "^^", wordTrig = false }, {
    t("^{"),
    i(1),
    t("}"),
  }, { condition = m.in_mathzone }),
  -- LaTeX: Math exponents
  s({ trig = "^-", wordTrig = false }, {
    t("^{-"),
    i(1),
    t("}"),
  }, { condition = m.in_mathzone }),
  -- LaTeX: Less than or equal to
  s({ trig = "<=", wordTrig = false }, t("\\leq"), { condition = m.in_mathzone }),
  -- LaTeX: Greater than or equal to
  s({ trig = ">=", wordTrig = false }, t("\\geq"), { condition = m.in_mathzone }),
  -- LaTeX: Times
  s({ trig = "xx", wordTrig = false }, t("\\times "), { condition = m.in_mathzone }),
  -- LaTeX: Otimes
  s({ trig = "ox", wordTrig = false }, t("\\otimes "), { condition = m.in_mathzone }),
  -- LaTeX: Oplus
  s({ trig = "o+", wordTrig = false }, t("\\oplus "), { condition = m.in_mathzone }),
  -- LaTeX: Center dot
  s({ trig = "**", wordTrig = false }, t("\\cdot "), { condition = m.in_mathzone }),
  -- inverse/exp -1
  s({ trig = "\\inv", wordTrig = false }, t("^{-1}"), { condition = m.in_mathzone }),
  -- Normal arrow
  -- s({ trig = "\->", regTrig = false, wordTrig = false }, t("\\to"), { condition = m.in_mathzone }),
  -- -- Up arrow
  -- s("^>", t("\\uparrow"), { condition = m.in_mathzone }),
  -- -- Down arrow
  -- s(".>", t("\\downarrow"), { condition = m.in_mathzone }),
  -- Overline
  s("--", {t("\\overline{"), i(1), t("}"), i(0)}, { condition = m.in_mathzone }),
  -- Widetilde
  s("~~", {t("\\widetilde{"), i(1), t("}"), i(0)}, { condition = m.in_mathzone }),
  -- Colon
  s("::", t("\\colon"), { condition = m.in_mathzone }),
  -- ldots
  s("..", t("\\ldots"), { condition = m.in_mathzone }),
  -- fraction
  s("fr", {t("\\frac{"), i(1), t("}{"), i(2), t("}"), i(0)}, { condition = m.in_mathzone }),
  -- coloneqq
  s(":=", t("\\coloneqq"), { condition = m.in_mathzone }),
  -- subseteq
  s("sub", t("\\subseteq"), { condition = m.in_mathzone }),
  -- not subseteq
  s("nsu", t("\\not\\subseteq"), { condition = m.in_mathzone }),
  -- supseteq
  s("Sup", t("\\supseteq"), { condition = m.in_mathzone }),
  -- not supseteq
  s("nSu", t("\\not\\supseteq"), { condition = m.in_mathzone }),
  -- LaTeX: Math boldface
  s("bf", fmt([[\mathbf{{{}}}]], i(1)), { condition = m.in_mathzone }),
  -- LaTeX: Romanized math
  s("rm", fmt([[\mathrm{{{}}}]], i(1)), { condition = m.in_mathzone }),
  -- operators
  s("on", fmt([[\operatorname{{{}}}]], i(1)), { condition = m.in_mathzone }),
  -- LaTeX: Math calligraphy
  s("mcal", fmt([[\mathcal{{{}}}]], i(1)), { condition = m.in_mathzone }),
  -- LaTeX: Math script
  s("mscr", fmt([[\mathscr{{{}}}]], i(1)), { condition = m.in_mathzone }),
  -- LaTeX: Math text
  s({ trig = "tt", wordTrig = false }, fmt([[\text{{{}}}]], i(1)), { condition = m.in_mathzone }),
   -- sqrt snippet
  s({trig = "sqrt", wordTrig = false }, {
    t("\\sqrt"),
    c(1, {
      t(),
      { t("["), i(1), t("]")}
    }),
    t("{"),
    i(2),
    t("}"),
    i(0),
  }, { condition = m.in_mathzone }),
  s({ trig = "ba", wordTrig = false }, {
    t("\\left | "),
    i(1),
    t(" \\right | "),
    i(0),
  }, { condition = m.in_mathzone }),
  s({ trig = "bb", wordTrig = false }, {
    t("\\left [ "),
    i(1),
    t(" \\right ] "),
    i(0),
  }, { condition = m.in_mathzone }),
  s({ trig = "bs", wordTrig = false }, {
    t("\\left \\\\{ "),
    i(1),
    t(" \\right \\\\} "),
    i(0),
  }, { condition = m.in_mathzone }), 
  s({ trig = "bp", wordTrig = false }, {
    t("\\left ( "),
    i(1),
    t(" \\right ) "),
    i(0),
  }, { condition = m.in_mathzone }),
  s( { trig = "[\\](%u)", regTrig = true, wordTrig = false }, {
    f(function(_, snip)
      return "\\mathbb{" .. snip.captures[1] .. "}"
    end)
  }, { condition = m.in_mathzone }),
  s( { trig = "([^\\])lim", regTrig = true, wordTrig = false}, {
    t("\\lim_{"),
    i(1),
    t("}"),
    i(0),
  }, { condition = m.in_mathzone }),
  s( { trig = "([^o\\])int", regTrig = true, wordTrig = false}, {
    t("\\int_{"),
    i(1),
    t("}^{"),
    i(2),
    t("}"),
    i(3),
    t(" \\\\, \\mathrm d "),
    i(0),
  }, { condition = m.in_mathzone }),
  s("dx", {t("\\, \\mathrm d "), i(0)}, { condition = m.in_mathzone }),
  s( { trig = "([^\\])sum", regTrig = true, wordTrig = false}, {
    t("\\sum_{"),
    i(1),
    t("}^{"),
    i(2),
    t("}"),
    i(0),
  }, { condition = m.in_mathzone }),
  s("idx", {
    t("\\mathrm d "),
    i(1),
    t("/\\mathrm d "),
    i(0),
  }, { condition = m.in_mathzone }),
  s("ddx", {
    t("\\frac{\\mathrm d "),
    i(1),
    t("}{\\mathrm d "),
    i(2),
    t("}"),
    i(0),
  }, { condition = m.in_mathzone }),
  s("ipx", {
    t("\\partial "),
    i(1),
    t("/\\partial "),
    i(0),
  }, { condition = m.in_mathzone }),
  s("ppx", {
    t("\\frac{\\partial "),
    i(1),
    t("}{\\partial "),
    i(2),
    t("}"),
    i(0),
  }, { condition = m.in_mathzone }),
  s("ker", t("\\mathrm{ker}"), { condition = m.in_mathzone }),
}, { type = "autosnippets" })
