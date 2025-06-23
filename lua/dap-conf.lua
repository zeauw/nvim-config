local dap, dapui = require("dap"), require("dapui")

-- dap

-- python dap

local dap = require('dap')
dap.adapters.python = function(cb, config)
    if config.request == 'attach' then
        ---@diagnostic disable-next-line: undefined-field
        local port = (config.connect or config).port
        ---@diagnostic disable-next-line: undefined-field
        local host = (config.connect or config).host or '127.0.0.1'
        cb({
            type = 'server',
            port = assert(port,
                          '`connect.port` is required for a python `attach` configuration'),
            host = host,
            options = {source_filetype = 'python'}
        })
    else
        cb({
            type = 'executable',
            command = vim.fn.stdpath('data') ..
                "/mason/packages/debugpy/venv/bin/python",
            args = {'-m', 'debugpy.adapter'},
            options = {source_filetype = 'python'}
        })
    end
end

local dap = require('dap')
dap.configurations.python = {
    {
        -- The first three options are required by nvim-dap
        type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = 'launch',
        name = "Launch file",

        -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

        program = "${file}", -- This configuration will launch the current file if used.
        pythonPath = function()
            -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
            -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
            -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
                return cwd .. '/venv/bin/python'
            elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
                return cwd .. '/.venv/bin/python'
            elseif os.getenv("VIRTUAL_ENV") ~= nil then
                return os.getenv("VIRTUAL_ENV") .. "/bin/python"
            else
                return '/usr/bin/python'
            end
        end
    }
}

-- dapui

dapui.setup({
    layouts = {
        {
            elements = {
                {id = "scopes", size = 0.25}, {id = "breakpoints", size = 0.25},
                {id = "stacks", size = 0.2}, {id = "watches", size = 0.2},
                {id = "repl", size = 0.1}
            },
            position = "left",
            size = 40
        }
    }
})

dap.listeners.before.attach.dapui_config = function() dapui.open() end
dap.listeners.before.launch.dapui_config = function() dapui.open() end
dap.listeners.before.event_terminated.dapui_config =
    function() dapui.close() end
dap.listeners.before.event_exited.dapui_config = function() dapui.close() end
