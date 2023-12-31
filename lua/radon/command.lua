local commands = {
    state = require('radon').show_generate_state,
    ref = require('radon').show_generate_ref
}

local M = {}

function M.setup()
    vim.api.nvim_create_user_command('Radon', function(opts)
        if commands[opts.args] then
            commands[opts.args]()
        end
    end, {
        nargs = 1,
        complete = function()
            return { 'state', 'ref' }
        end,
    })
end

return M
