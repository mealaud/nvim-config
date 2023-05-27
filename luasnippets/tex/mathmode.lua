---@diagnostic disable: undefined-global
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

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
local GREEK_LETTERS = {}
GREEK_LETTERS["a"] = "alpha"
GREEK_LETTERS["b"] = "beta"
GREEK_LETTERS["c"] = "chi"
GREEK_LETTERS["d"] = "delta"
GREEK_LETTERS["e"] = "e"
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

local DELIMITERS = {}
DELIMITERS["a"] = "abs"
DELIMITERS["b"] = "bigbra"
DELIMITERS["p"] = "bigpar"
DELIMITERS["s"] = "set"

ls.add_snippets("tex", {
  -- display math
  s("dm", {
      t({ "\\[", "\t" }),
      i(0),
      t({ "", "\\]" }),
  }, { condition = in_text }),
  s("mm", {
      t("\\("),
      t(" "),
      i(1),
      t("\\)"),
      i(0),
  }, { condition = in_text }),
  -- Lowercase Greek
  s({ trig = ";(%l)", regTrig = true, wordTrig = false }, {
    f(function(_, snip)
      if GREEK_LETTERS[snip.captures[1]] then
        return "\\" .. GREEK_LETTERS[snip.captures[1]]
      end
      return ""
    end),
  }, { condition = in_mathzone }),
  -- Uppercase Greek
  s({ trig = ";(%u)", regTrig = true, wordTrig = false }, {
    f(function(_, snip)
      local greek_letter = GREEK_LETTERS[string.lower(snip.captures[1])]
      if greek_letter then
        return "\\" .. greek_letter:gsub("^%l", string.upper)
      end
      return ""
    end),
  }, { condition = in_mathzone }),
  -- LaTeX: Math subscripts
  s({ trig = "__", wordTrig = false }, {
    t("_{"),
    i(1),
    t("}"),
  }, { condition = in_mathzone }),
  -- LaTeX: Math superscripts
  s({ trig = "^^", wordTrig = false }, {
    t("^{"),
    i(1),
    t("}"),
  }, { condition = in_mathzone }),
  -- LaTeX: Math exponents
  s({ trig = "^-", wordTrig = false }, {
    t("^{-"),
    i(1),
    t("}"),
  }, { condition = in_mathzone }),
  -- LaTeX: Less than or equal to
  s({ trig = "<=", wordTrig = false }, t("\\leq"), { condition = in_mathzone }),
  -- LaTeX: Greater than or equal to
  s({ trig = ">=", wordTrig = false }, t("\\geq"), { condition = in_mathzone }),
  -- LaTeX: Times
  s({ trig = "xx", wordTrig = false }, t("\\times "), { condition = in_mathzone }),
  -- LaTeX: Otimes
  s({ trig = "ox", wordTrig = false }, t("\\otimes "), { condition = in_mathzone }),
  -- LaTeX: Oplus
  s({ trig = "o+", wordTrig = false }, t("\\oplus "), { condition = in_mathzone }),
  -- LaTeX: Center dot
  s({ trig = "**", wordTrig = false }, t("\\cdot "), { condition = in_mathzone }),
  -- LaTeX: Math boldface
  s("bf", fmt([[\mathbf{{{}}}]], i(1)), { condition = in_mathzone }),
  -- LaTeX: Romanized math
  s("rm", fmt([[\mathrm{{{}}}]], i(1)), { condition = in_mathzone }),
  -- LaTeX: Math calligraphy
  s("mcal", fmt([[\mathcal{{{}}}]], i(1)), { condition = in_mathzone }),
  -- LaTeX: Math script
  s("mscr", fmt([[\mathscr{{{}}}]], i(1)), { condition = in_mathzone }),
  -- LaTeX: Math text
  s({ trig = "tt", wordTrig = false }, fmt([[\text{{{}}}]], i(1)), { condition = in_mathzone }),
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
  }, { condition = in_mathzone }),
  -- big paren/brac/set/abs/other left-right delimiters
  set( { trig = "[b]([absp])", regTrig = true, wordTrig = false }, {
    f(function(_, snip)
      if DELIMITERS[snip.captures[1]] then
        return "\\" .. DELIMITERS[snip.captures[1]] .. "{"
      end
      return ""
    end),
    i(1),
    t("}"),
    i(0),
  }, { condition = in_mathzone }),
}, { type = "autosnippets" })


