local M = {}

M.get_component_function_line_id = function(curr_buf)
	local file_name = vim.fn.expand '%:t:r'

	for i, line in ipairs(vim.api.nvim_buf_get_lines(curr_buf, 1, -1, true)) do
		if string.find(line, file_name) then
			return i + 1
		end
	end

	error 'Error: cannot find component function by file name.'
end

M.validate = function(opts)
	local name = opts.name:gsub('%s', '')
	local value = opts.value

	if name == nil or name == '' then
		error 'Error: "name" cannot be empty!'
	end

	return { name = name, value = value }
end

M.insert_line = function(opts)
	local tabstop = vim.opt.tabstop:get()

	local spaces_indention = string.rep(' ', tabstop)

	local curr_buf = vim.api.nvim_get_current_buf()

	local component_line_id = M.get_component_function_line_id(curr_buf)

	vim.api.nvim_buf_set_lines(
		curr_buf,
		component_line_id,
		component_line_id,
		true,
		{ spaces_indention .. opts.hook }
	)
end

M.show = function(name_default, generate_hook)
	local name_ui_opts = {
		prompt = 'Enter name: ',
		default = name_default,
	}

	local default_value_ui_opts = {
		prompt = 'Input default value: ',
		default = '',
	}

	local opts = {}

	local name_on_confirm = function(input)
		if input then
			opts.name = input
		else
			print 'You cancelled.'
		end
	end

	local default_value_on_confirm = function(input)
		if input then
			opts.value = input

			generate_hook(opts)
		else
			print 'You cancelled.'
		end
	end

	vim.ui.input(name_ui_opts, name_on_confirm)
	vim.ui.input(default_value_ui_opts, default_value_on_confirm)
end

return M
