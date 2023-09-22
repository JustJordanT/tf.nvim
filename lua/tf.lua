local M = {}

M.commands = {
  TerraformFmt = function()
    -- Format the current Terraform file.
    vim.cmd('!terraform fmt')
  end,
  TerraformFmtOnSave = function()
    -- Format the current Terraform file on save.
    vim.api.
    vim.api.autocmd.Add('BufWritePre', {
      group = 'terraform_fmt',
      pattern = '*.tf',
      callback = function()
        vim.cmd('!terraform fmt')
      end,
    })
  end,
}

M.keymaps = {
  ['n <leader>tf'] = ':TerraformFmt<CR>',
}

-- plugin.setup = function()
--   -- Enable Terraform fmt on save.
--   vim.cmd('call plugin#terraform-fmt#TerraformFmtOnSave()')
-- end

return M
