-- Load custom treesitter grammar for org filetype
require('orgmode').setup_ts_grammar()

-- Treesitter configuration
require('nvim-treesitter.configs').setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop,
  -- highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    -- Required for spellcheck, some LaTex highlights and
    -- code block highlights that do not have ts grammar
    additional_vim_regex_highlighting = { 'org' },
  },
  ensure_installed = { 'org' }, -- Or run :TSUpdate org
}

require('orgmode').setup({
  org_agenda_files = { '/data/org/officelk-*' },
  org_default_notes_file = '/data/org/refile.org',
  org_capture_templates = {
    o = 'Office',
    ot = {
      description = 'Office Todo',
      template = '* TODO %?\n %u',
      target = '/data/org/officelk-todo.org'
    },
    oj = {
      description = 'Office Journal',
      template = '\n*** %<%Y-%m-%d> %<%A>\n**** %U\n\n%?',
      target = '/data/org/officelk-journal.org'
    },
    om = {
      description = 'Meeting Notes',
      template = '\n*** %<%Y-%m-%d> %<%A>\n**** %U\n\n%?',
      target = '/data/org/officelk-meeting-notes.org'
    },
    e = 'Office Event',
    er = {
      description = 'recurring',
      template = '** %?\n %T',
      target = '/data/org/officelk-recurring-calendar.org',
      -- headline = 'recurring'
    },
    eo = {
      description = 'one-time',
      template = '** %?\n %T',
      target = '/data/org/officelk-onetime-calendar.org',
      -- headline = 'one-time'
    }
  }
})
