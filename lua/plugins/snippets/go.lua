local s = require("luasnip").snippet
local i = require("luasnip").insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
	s(
		"iferr",
		fmt(
			[[
  if err != nil {{
    {}
  }}{}
  ]],
			{
				i(1, "return"),
				i(2),
			}
		)
	),
}
