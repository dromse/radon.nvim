local utils = require 'radon.utils'

local generate_useState = require('radon.hooks.useState').generate
local generate_useRef = require('radon.hooks.useRef').generate

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

M.show_generate_state = function()
	utils.show('state', M.generate_state)
end

M.show_generate_ref = function()
	utils.show('ref', M.generate_ref)
end

return M
