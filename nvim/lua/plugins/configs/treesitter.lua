require('nvim-treesitter.configs').setup({
    auto_install = true,
    elixir_toolchest = {with_unused_atom = {}},
    highlight = {enable = true},
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 'ttt',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?'
        }
    },
    query_linter = {enable = true, use_virtual_text = true, lint_events = {"BufWrite", "CursorHold"}}
})
