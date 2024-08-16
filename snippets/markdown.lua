local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require 'luasnip.util.events'
local ai = require 'luasnip.nodes.absolute_indexer'
local extras = require 'luasnip.extras'
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local conds = require 'luasnip.extras.expand_conditions'
local postfix = require('luasnip.extras.postfix').postfix
local types = require 'luasnip.util.types'
local parse = require('luasnip.util.parser').parse_snippet
local ms = ls.multi_snippet
local k = require('luasnip.nodes.key_indexer').new_key

local date = function()
  return { os.date '%Y-%m-%d' }
end

-- NOTE: denote c as cursor position

-- Define snippets
ls.add_snippets('markdown', {
  -- comments: [//]: # (c)
  s('com', {
    t '[//]: # (',
    i(1, 'comment'),
    t ')',
  }),

  -- Collapsible:
  -- <details>
  -- <summary>c</summary>
  -- </details>
  s({ trig = '\\col', wordTrig = false }, {
    t { '<details>', '' },
    t '<summary>',
    i(1),
    t '</summary>',
    t { '', '</details>' },
  }),

  -- NOTE: Katex Helpers

  -- Inline math equation
  s('im', {
    t '$',
    i(1, 'equation'),
    t '$',
  }),
  -- Block math equation
  s('bm', {
    t { '$$', '' },
    i(1, 'equation'),
    t { '', '$$' },
  }),

  -- \tex -> \text{c}
  s({ trig = '\\tex', wordTrig = false }, {
    t '\\text{',
    i(1),
    t '}',
  }),
  -- \re to \reals
  s({ trig = '\\re', wordTrig = false }, {
    t '\\reals',
  }),

  -- ^{ to ^{c}
  s({ trig = '^{' }, {
    t '^{',
    i(1),
    t '}',
  }),
  -- _{ to _{c}
  s({ trig = '_{' }, {
    t '_{',
    i(1),
    t '}',
  }),

  -- \vec -> \vec{c}
  s({ trig = '\\ve', wordTrig = false }, {
    t '\\vec{',
    i(1),
    t '}',
  }),
})
