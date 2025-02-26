local M = {}

M.options = {
	defaults = {
		min_number = 1,
		max_number = 999,
		length_string = 14,
	},

	keymaps = {
		random_number = "<leader>rn",
		random_string = "<leader>rs",
		random_format = "<leader>rf",
	},
}

function M.setup(opts)
	if next(opts) ~= nil then
		for key, value in pairs(opts) do
			for key_2, value_2 in pairs(opts[key]) do
				M.options[key][key_2] = value_2
			end
		end
	end
end

return M
