local M = {}

M.options = {
	defaults = {
		min_number = 1,
		max_number = 999,
		length_string = 14,
	},
}

function M.setup(opts)
	M.options = vim.tbl_extend("force", opts or {})
end

return M
