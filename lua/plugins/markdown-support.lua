return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
        vim.g.mkdp_auto_start = 1
        vim.g.mkdp_auto_close = 1
        vim.g.mkdp_filetypes = { "markdown" }
        vim.g.mkdp_browser = "/usr/bin/firefox"
        vim.g.mkdp_combine_preview = 0
        vim.g.mkdp_combine_preview_auto_refresh = 1
        vim.g.mkdp_port = "8999"
    end,
    ft = { "markdown" },
}
