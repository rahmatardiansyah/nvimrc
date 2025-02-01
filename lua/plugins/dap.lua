return {
  'mfussenegger/nvim-dap',
  dependencies = {
    { 'rcarriga/nvim-dap-ui', 'nvim-neotest/nvim-nio' },
  },
  keys = {
    {
      '<leader>db',
      function()
        require('dap').toggle_breakpoint()
      end,
    },
    {
      '<leader>dc',
      function()
        require('dap').continue()
      end,
    },
  },
  config = function()
    local dap = require('dap')

    require('dap').adapters['pwa-node'] = {
      type = 'server',
      host = 'localhost',
      port = '${port}',
      executable = {
        command = 'node',
        args = { os.getenv('HOME') .. '/.local/source/js-debug/src/dapDebugServer.js', '${port}' },
      },
    }

    dap.adapters.chrome = {
      type = 'executable',
      command = 'node',
      args = { os.getenv('HOME') .. '/.local/source/vscode-chrome-debug/out/src/chromeDebug.js' },
    }

    dap.configurations.javascript = {
      {
        type = 'pwa-node',
        request = 'launch',
        name = 'Launch file',
        program = '${file}',
        cwd = '${workspaceFolder}',
      },
    }

    dap.configurations.javascriptreact = {
      {
        type = 'chrome',
        request = 'attach',
        program = '${file}',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        port = 9222,
        webRoot = '${workspaceFolder}',
      },
    }

    dap.configurations.typescriptreact = {
      {
        type = 'chrome',
        request = 'attach',
        program = '${file}',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        port = 9222,
        webRoot = '${workspaceFolder}',
      },
    }

    dap.configurations.vue = {
      {
        type = 'chrome',
        request = 'attach',
        program = '${file}',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        port = 9222,
        webRoot = '${workspaceFolder}',
      },
    }

    local dapui = require('dapui')
    dapui.setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end,
}
