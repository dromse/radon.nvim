local M = {}

M.generate = function(opts)
	return 'const ' .. opts.name .. ' = useRef(' .. opts.value .. ')'
end

return M
