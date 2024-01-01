return {
    {
        "akinsho/org-bullets.nvim",
        config = function()
            require("org-bullets").setup({
                list = "•",
                headlines = { "◉", "○", "✸", "✿" },
            })
        end,
    },
    {
        "lukas-reineke/headlines.nvim",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = true, -- or `opts = {}`
    },
    {
        "nvim-orgmode/orgmode",
        dependencies = {
            { "nvim-treesitter/nvim-treesitter", lazy = true },
        },
        event = "VeryLazy",
        config = function()
            -- Load treesitter grammar for org
            require("orgmode").setup_ts_grammar()

            -- Setup treesitter
            require("nvim-treesitter.configs").setup({
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = { "org" },
                },
                ensure_installed = { "org" },
            })

            -- Setup orgmode
            -- I'm classifying this as LRDE i.e L -> Learning , R -> Research , D -> Develop, E -> Errands
            require("orgmode").setup({
                org_capture_templates = {
                    b = {
                        description = "Blogging - All Blogging",
                        template = "** %^{Blog Title} %?  \n \t %u",
                        target = "~/org/blogging.org",
                    },
                    l = {
                        description = "Learning - All Learnings",
                        template = "** %^{What to learn ? } %?  \n \t  %u",
                        target = "~/org/learning.org",
                    },
                    r = {
                        description = "Research - Research and observations for everything",
                        template = "** %^{Which to research on ?} %? \t \n \t %u",
                        target = "~/org/research.org",
                    },
                    h = {
                        description = "Habbit Tracker - Anything specific to test",
                        template = "** %^{what to track} %? \t \n \t %u",
                        target = "~/org/habbit.org",
                    },
                    s = {
                        description = "Shopping / Bucket List",
                        template = "** %^{What to buy / do } %? \t \n \t %u",
                        target = "~/org/bucketlist.org",
                    },
                    d = {
                        description = "Develop - Write some code",
                        template = "** %^{What to code ?} %?\n \t %u",
                        target = "~/org/develop.org",
                    },
                    e = {
                        description = "Errands - All type of home tasks",
                        template = "** %^{What task todo ?} %?\n \t %u",
                        target = "~/org/errands.org",
                    },
                    u = {
                        description = "Link to refer to",
                        template = "** %^{Link} %?\n \t %u",
                        target = "~/org/links.org",
                    },
                },
                org_todo_keywords = {
                    "TODO(t)",
                    "WAITING(w)",
                    "|",
                    "DONE(d)",
                    "DELEGATED(g)",
                },
                win_split_mode = "float",
                org_agenda_files = "~/org/**/*",
                org_default_notes_file = "~/org/refile.org",
                mappings = {
                    global = {
                        org_toggle_checkbox = "<C-S-Space>",
                    },
                },
            })
        end,
    },
}
