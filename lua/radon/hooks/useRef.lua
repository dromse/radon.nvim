local M = {}

M.generate = function(opts)
	return 'const ' .. opts.name .. 'Ref = useRef(' .. opts.value .. ')'
end

return M
