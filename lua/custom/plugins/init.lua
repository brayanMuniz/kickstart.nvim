-- For preview md files (I think)
-- when switching buffers open new window
vim.g.mkdp_combine_preview_auto_refresh = 1
vim.g.mkdp_auto_close = 0
vim.g.mkdp_combine_preview = 1

return {

  -- Custom snippets loader
  {
    'L3MON4D3/LuaSnip',
    config = function()
      require('luasnip.loaders.from_lua').load { paths = '~/.config/nvim/snippets' }
    end,
  },

  -- Folding
  -- https://github.com/kevinhwang91/nvim-ufo
  { 'kevinhwang91/nvim-ufo', dependencies = { 'kevinhwang91/promise-async' } },

  -- Preview md files
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },

  -- make neovim transparent
  {
    'xiyaowong/transparent.nvim',
    config = function()
      require('transparent').setup {
        extra_groups = {
          'NeoTreeNormal',
          'NeoTreeNormalNC',
          'NormalFloat',
        },
      }
    end,
  },

  -- wakatime
  { 'wakatime/vim-wakatime', lazy = false },

  -- add padding to left side
  {
    'shortcuts/no-neck-pain.nvim',
    version = '*',
    config = function()
      require('no-neck-pain').setup {
        buffers = {
          left = { enabled = true },
          right = { enabled = false },
        },
        width = 110,
      }
    end,
  },
}
