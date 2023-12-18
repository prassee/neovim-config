return {
  'nvim-orgmode/orgmode',
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter', lazy = true },
  },
  event = 'VeryLazy',
  config = function()
    -- Load treesitter grammar for org
    require('orgmode').setup_ts_grammar()

    -- Setup treesitter
    require('nvim-treesitter.configs').setup({
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'org' },
      },
      ensure_installed = { 'org' },
    })

    -- Setup orgmode
    -- I'm classifying this as LRDE i.e L -> Learning , R -> Research , D -> Develop, E -> Errands
    require('orgmode').setup({
      org_capture_templates = {
        l = { description = 'Learning - All Learnings', template = '* TODO %?\n  %u' },
        r = { description = 'Research - Research and observations for everything', template = '* TODO %?\n  %u' },
        d = { description = 'Develop - Write some code', template = '* TODO %?\n  %u' },
        e = { description = 'Errands - All type of home tasks', template = '* TODO %?\n %u' }
      },
      org_agenda_files = '/data/org/**/*',
      org_default_notes_file = '/data/org/refile.org',
    })
  end,
}
