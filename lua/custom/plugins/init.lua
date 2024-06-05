-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
--
-- See the kickstart.nvim README for more information
return {
  {
    'shortcuts/no-neck-pain.nvim',
    version = '*',
    opts = {
      width = 153,
      buffers = {
        wo = {
          fillchars = 'eob: ',
        },
      },
      bufferOptions = { enabled = false },
      bufferOptionsScratchPad = {
        enabled = false,
      },
    },
  },
  { 'xiyaowong/transparent.nvim', opts = {} },
  { 'wakatime/vim-wakatime', lazy = false },
}
