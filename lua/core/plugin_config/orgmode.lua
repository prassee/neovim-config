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
  win_split_mode = { 'float', 0.97 },
  org_todo_keywords = { 'TODO(t)', 'DOING(d)', '|', 'CANCELLED(c)', 'DELAYED(l)', 'DONE(n)' },
  org_todo_keyword_faces = {
    DOING = ':foreground cyan :weight bold',
    CANCELLED = ':background red :foreground #000000  :slant italic :underline on',
    DELAYED = ':background #B3DAFF :foreground grey  :slant italic :underline on',
    TODO = ':background green :foreground white :underline on', -- overrides builtin color for `TODO` keyword
  },
  org_agenda_files = { '/data/org/officelk-*' },
  org_default_notes_file = '/data/org/refile.org',
  org_capture_templates = {
    h = 'Home',
    ht = {
      description = 'Home Todo',
      template = '* TODO %?\n %u',
      target = '/data/org/home-todo.org'
    },
    hj = {
      description = 'Home Journal',
      template = '\n*** %<%Y-%m-%d> %<%A>\n**** %U\n\n%?',
      target = '/data/org/home-journal.org'
    },
    o = 'Office',
    ot = {
      description = 'Office Todo',
      template = '* TODO %?\n %u',
      target = '/data/org/officelk-todo.org'
    },
    oj = {
      description = 'Office Journal',
      template = '\n*** %<%Y-%m-%d>%<%A>\n**** %U\n\n%?',
      target = '/data/org/officelk-journal.org'
    },
    om = {
      description = 'Meeting Notes',
      template = '\n*** %^{What are we discussing?} %U\n\t - %?\n**** Action Items\n\n\t',
      target = '/data/org/officelk-meeting-notes.org'
    },
    e = 'Office Event',
    er = {
      description = 'recurring',
      template = '*** %?\n %T',
      target = '/data/org/officelk-recurring-calendar.org',
      -- headline = 'recurring'
    },
    eo = {
      description = 'one-time',
      template = '*** %?\n %T',
      target = '/data/org/officelk-onetime-calendar.org',
      -- headline = 'one-time'
    }
  }
})
