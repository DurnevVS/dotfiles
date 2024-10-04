local module = {}

function module.set_keybindings(opts)
	local wezterm = require("wezterm")
	local action = wezterm.action
	local keys = {}

	for i = 1, 8 do
		table.insert(keys, {
			key = tostring(i),
			mods = opts.mods,
			action = action.ActivateTab(i - 1),
		})
	end
	return table.unpack(keys)
end

return module
