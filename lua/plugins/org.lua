--  ██████╗ ██████╗  ██████╗
-- ██╔═══██╗██╔══██╗██╔════╝
-- ██║   ██║██████╔╝██║  ███╗
-- ██║   ██║██╔══██╗██║   ██║
-- ╚██████╔╝██║  ██║╚██████╔╝
--  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝

return {
  {
    'nvim-neorg/neorg',
    lazy = false,
    version = '*',
    keys = {
      { '<leader>oj', ':Neorg journal custom<cr>',  mode = { 'n' }, desc = 'Journal' },
      { '<leader>on', ':Neorg workspace notes<cr>', mode = { 'n' }, desc = 'Notes' },
      { '<leader>ot', ':Neorg toc<cr>',  mode = { 'n' }, desc = 'TOC' },
    },
    config = function ()
      require('neorg').setup({
        load = {
            ['core.defaults'] = {},
            ['core.concealer'] = {
              config = {
                folds = true,
                icon_preset = "basic",
                init_open_folds = "auto",
              },
            },
            ['core.journal'] = {
              config = {
                journal_folder = 'Journal',
                strategy = 'nested',
                template_name = 'template.norg',
                use_template = true,
                toc_format = nil
              }
            },
            ['core.dirman'] = {
              config = {
                workspaces = {
                  notes = '~/Notes',
                },
                default_workspace = "notes"
              }
            },
        }
      })
    end
  }
}
