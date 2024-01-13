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
        "dhruvasagar/vim-table-mode",
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
                        template = "\n* %^{Blog Title} :%^{Tags}:  \n \t %u \n- %?",
                        target = "~/org/blogging.org",
                    },
                    l = {
                        description = "Learning - All Learnings",
                        template = "\n* %^{What to Learn ? } :%^{Tags}: \n \t %u \n- %?",
                        target = "~/org/learning.org",
                    },
                    r = {
                        description = "Research - Research and observations for everything",
                        template = "\n* %^{What to Research on ?} :%^{Tags}: \n \t %u \n- %?",
                        target = "~/org/research.org",
                    },
                    h = {
                        description = "Habbit Tracker - Anything specific to test",
                        template = "\n* %^{What habbit to track} :%^{Tags}: \n \t %u \n- %?",
                        target = "~/org/habbit.org",
                    },
                    s = {
                        description = "Shopping / Bucket List",
                        template = "\n* %^{What to buy / do } :%^{Tags}: \n \t %u \n- %?",
                        target = "~/org/bucketlist.org",
                    },
                    d = {
                        description = "Develop - Write some code",
                        template = "\n* %^{What to Code ?} :%^{Tags}: \n \t %u \n- %?",
                        target = "~/org/develop.org",
                    },
                    e = {
                        description = "Errands - All type of home tasks",
                        template = "\n* %^{What task todo ?} :%^{Tags}: \n \t %u \n- %?",
                        target = "~/org/errands.org",
                    },
                    u = {
                        description = "Link to refer to",
                        template = "\n* %^{Link to note} :%^{Tags}: \n \t %u \n- %?",
                        target = "~/org/links.org",
                    },
                },
                org_todo_keywords = {
                    "TODO(t)",
                    "WAITING(w)",
                    "DOING(i)",
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
