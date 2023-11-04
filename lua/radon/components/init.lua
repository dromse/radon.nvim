local M = {}

local ts = require 'radon.components.typescript'
local js = require 'radon.components.javascript'

---Generate component lines inside table.
---@param name string
---@param language 'ts' | 'js'
---@return table
M.generate = function(name, language)
	local component_raw

	if language == 'ts' then
		component_raw = ts
	elseif language == 'js' then
		component_raw = js
	else
		error(
			string.format(
				'Error: "%s" is not available for component template',
				language
			)
		)
	end

	local component = component_raw:gsub('NAME', name)
	local component_lines = vim.split(component, '\n')

	return component_lines
end

return M
