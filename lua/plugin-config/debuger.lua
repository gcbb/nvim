
if not vim.g.loaded_vimspector then
    -- 设置 vimspector 插件的安装列表
    -- vim.g.vimspector_install_gadgets = { 'debugpy', 'vscode-cpptools', 'vscode-go', 'vscode-java', 'vscode-node-debug2', 'vscode-node-debug', 'vscode-php-debug', 'vscode-chrome-debug', 'vscode-lldb' }

    vim.g.vimspector_install_gadgets = { 'debugpy', 'vscode-cpptools',  'vscode-lldb' }
    -- 配置 vimspector
    vim.g.vimspector_base_dir = vim.fn.expand('<sfile>:p:h:h') .. '/.vimspector/'

    -- 自定义按键映射
    -- vim.api.nvim_set_keymap('n', '<F5>', '<Plug>VimspectorContinue', {})
    -- vim.api.nvim_set_keymap('n', '<F10>', '<Plug>VimspectorStepOver', {})
    -- vim.api.nvim_set_keymap('n', '<F11>', '<Plug>VimspectorStepInto', {})
    -- vim.api.nvim_set_keymap('n', '<F12>', '<Plug>VimspectorStepOut', {})

    -- 启用 vimspector 插件
    vim.cmd([[packadd vimspector]])


    vim.g.vimspector_session_initializations = {
        Python= {
            setup= {
                python= 'python3'
            }
        }
    }

    -- vim.g.vimspector_config = vim.g.my_vimrc_dir .. "\\vimspector_config.json"

    vim.g.vimspector_configurations = {
        test_debugpy_config = {
            adapter = "test_debugpy",
            filetypes = { "python" },
            configuration = {
                request = "launch",
                type = "python",
                cwd = "${fileDirname}",
                args = {},
                program = "${file}",
                stopOnEntry = false,
                console = "integratedTerminal",
                integer = 123,
            },
            breakpoints = {
                exception = {
                    raised = "N",
                    uncaught = "",
                    userUnhandled = ""
                }
            }
        }
    }

    vim.g.vimspector_adapters = #{
        test_debugpy= #{ extends= 'debugpy' }
    }
    vim.g.vimspector_config_name = 'test_debugpy_config'
    require("keybindings").mapVimspector()
    vim.cmd[["VimspectorInstall"]]
else
    vim.notify("loaded_vimspector:  没有找到！")
end





-- return
