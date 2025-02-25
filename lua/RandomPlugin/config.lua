local M = {}

M.options = {
	defaults = {
		min_number = 1,
		max_number = 999,
		length_string = 14,
	},
}

function M.setup(opts)
	if next(opts) ~= nil then
		M.options = opts
	end
end

return M
