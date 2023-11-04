local utils = require 'radon.utils'

local generate_useState = require('radon.hooks.useState').generate
local generate_useRef = require('radon.hooks.useRef').generate
local generate_template = require('radon.components').generate

local M = {}

M.setup = function(opts)
	opts = opts or {}

	require('radon.command').setup()
end

M.generate_state = function(opts)
	opts = utils.validate(opts)
	opts.hook = generate_useState(opts)
	utils.insert_line(opts)
end

M.generate_ref = function(opts)
	opts = utils.validate(opts)
	opts.hook = generate_useRef(opts)
	utils.insert_line(opts)
end

M.generate_component = function(opts)
	--[[ I need to find current directory structure  ]]
	-- I need to create components directory and add file with component snippet.
	-- it's create component in current dir
	-- options to autofind dir or to manually
	local name = opts.name
	local language = opts.language
	local file_name

	if language == 'ts' then
		file_name = name .. '.tsx'
	elseif language == 'js' then
		file_name = name .. '.jsx'
	else
		error(
			string.format('Error: "%s" is not available file format', language)
		)
	end

	if vim.fn.filereadable(file_name) == 1 then
		error(string.format('"%s" is exists!', file_name))
		return
	end

	local template = generate_template(name, language)

	vim.api.nvim_command('edit ' .. file_name)

	local curr_buf = vim.api.nvim_get_current_buf()
	vim.api.nvim_buf_set_lines(curr_buf, 0, -1, false, template)

	print 'Component generated!'
end

M.show_generate_state = function()
	utils.show('state', M.generate_state)
end

M.show_generate_ref = function()
	utils.show('ref', M.generate_ref)
end

M.show_generate_component = function()
	local name = {
		prompt = 'Enter name: ',
		default = 'Component',
	}

	local language = {
		prompt = 'Language [js, ts]: ',
		default = 'js',
	}

	local path = {
		prompt = 'Path (auto, current, manual): ',
		default = 'current',
	}

	local opts = {}

	local name_on_confirm = function(input)
		if input then
			opts.name = input
		else
			print 'You cancelled.'
		end
	end

	local file_type_on_confirm = function(input)
		if input then
			opts.language = input
		else
			print 'You cancelled.'
		end
	end

	local path_on_confirm = function(input)
		if input == 'current' then
			opts.path = input

			M.generate_component(opts)
		elseif input == 'auto' then
			-- tries to find or create components dir inside src
			print 'Need to implement!'
		elseif input == 'manual' then
			-- insert path manually
			print 'Need to implement!'
		else
			print 'You cancelled.'
		end
	end

	vim.ui.input(name, name_on_confirm)
	vim.ui.input(language, file_type_on_confirm)
	vim.ui.input(path, path_on_confirm)
end

return M
