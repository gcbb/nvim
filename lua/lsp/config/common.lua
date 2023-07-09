return {
  on_setup = function(server)
    server.setup({
      flags = {
        debounce_text_changes = 150,
      },
      on_attach = function(client, bufnr)
        -- client, bufnr
        -- -- 禁用格式化功能，交给专门插件插件处理
        -- client.resolved_capabilities.document_formatting = false
        -- client.resolved_capabilities.document_range_formatting = false
        --
        local function buf_set_keymap(mode, lhs, rhs) 
          vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, buffer = bufnr }) 

        end
        -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
        -- 绑定快捷键
        require("keybindings").mapLSP(buf_set_keymap)
      end,
    })

  end,
}
