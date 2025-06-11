return {
  'epwalsh/obsidian.nvim',
  version = '*',
  lazy = true,
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'me',
        path = '~/Desktop/me/',
      },
    },

    notes_subdir = 'notes',
    new_notes_location = 'notes_subdir',

    daily_notes = {
      folder = 'dailies',
      default_tags = { 'daily-notes' },
    },
  },

  config = function(_, opts)
    require('obsidian').setup(opts)

    local map = vim.keymap.set

    -- A good practice is to group obsidian-related keymaps under a common key.
    -- '<leader>o' for [O]bsidian seems fitting.
    map('n', '<leader>oq', function()
      return require('obsidian').util.selector()
    end, { desc = '[O]bsidian [Q]uick Switcher' })

    map('n', '<leader>os', '<cmd>ObsidianSearch<CR>', { desc = '[O]bsidian [S]earch' })

    map('n', '<leader>ot', '<cmd>ObsidianToday<CR>', { desc = '[O]bsidian [T]oday' })

    map('n', '<leader>on', '<cmd>ObsidianNew<CR>', { desc = '[O]bsidian [N]ew Note' })

    map('n', '<leader>ob', '<cmd>ObsidianBacklinks<CR>', { desc = '[O]bsidian [B]acklinks' })

    -- 'gf' is the standard "go to file" keymap.
    -- obsidian.nvim enhances it to follow [[wiki-links]].
    map('n', 'gf', function()
      if require('obsidian').util.cursor_on_markdown_link() then
        return '<cmd>ObsidianFollowLink<CR>'
      else
        return 'gf'
      end
    end, { expr = true, buffer = true, desc = '[O]bsidian Follow [L]ink' })

    map('n', '<leader>ou', '<cmd>ObsidianOpen<CR>', { desc = '[O]bsidian Open from [U]RL' })
  end,
}
