local M = {}

M.generate = function(opts)
	local name_capitalized = opts.name:gsub('^%l', string.upper)

	return 'const ['
		.. opts.name
		.. ', set'
		.. name_capitalized
		.. '] = useState('
		.. opts.value
		.. ')'
end

return M
