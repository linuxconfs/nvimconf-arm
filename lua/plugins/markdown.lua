-- install without yarn or npm
return {
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && yarn",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    config = function()
      vim.g.mkdp_browser = "none" -- https://github.com/iamcco/markdown-preview.nvim/issues/378
      vim.g.mkdp_open_to_the_world = 1
      vim.g.mkdp_open_ip = "192.168.101.230"
      vim.g.mkdp_port = 1234
      vim.cmd([[
        function! g:EchoUrl(url)
            :echomsg a:url
        endfunction
        let g:mkdp_browserfunc = 'g:EchoUrl'
      ]])
    end,
    ft = { "markdown" },
  },
  {
    "dhruvasagar/vim-table-mode",
  },
}
