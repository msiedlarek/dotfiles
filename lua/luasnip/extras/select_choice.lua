local session = require("luasnip.session")
local util = require("luasnip.util.util")
local ls = require("luasnip")

local function set_choice_callback(_, indx)
	if not indx then
		return
	end
	ls.set_choice(indx)
end

local function select_choice()
	assert(session.active_choice_node, "No active choiceNode")
	vim.ui.select(
		ls.get_current_choices(),
		{ kind = "luasnip" },
		set_choice_callback
	)
end

return select_choice
