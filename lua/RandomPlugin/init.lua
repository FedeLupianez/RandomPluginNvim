local M = {}

M.mappings = require("RandomPlugin.mappings")
M.config = require("RandomPlugin.config")

function M.setup()
	M.config.setup()
	M.mappings.setup()
end

return M
