local actions = require("telescope.actions")
-- local action_state = require("telescope.actions.state")
local builtin = require('telescope.builtin')
-- local previewers = require("telescope.previewers")
local themes = require("telescope.themes")
local trouble = require("trouble.providers.telescope")
-- local transform_mod = require('telescope.actions.mt').transform_mod

require("telescope").setup({
    defaults = {
        -- dynamic_preview_title = true,
        -- layout_strategy = "flex",
        -- layout_config = {
        --     vertical = {
        --         preview_height = 0.5,
        --     },
        --     flex = {
        --         flip_columns = 160,
        --     },
        --     horizontal = {
        --         preview_width = 0.5,
        --     },
        --     height = 0.85,
        --     width = 0.85,
        --     preview_cutoff = 0,
        -- },
        file_ignore_patterns = { "node_modules", ".git" },
        -- path_display = {
        --     truncate = 1,
        -- },
        set_env = {
            ["COLORTERM"] = "truecolor",
        }, -- default = nil,
        -- file_previewer = previewers.cat.new,
        -- grep_previewer = previewers.vim_buffer_vimgrep.new,
        -- qflist_previewer = previewers.qflist.new,
        history = {
            mappings = {
                i = {
                    ["<C-Down>"] = actions.cycle_history_next,
                    ["<C-Up>"] = actions.cycle_history_prev,
                },
            },
        },
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<Tab>"] = actions.move_selection_previous,
                ["<S-Tab>"] = actions.move_selection_next,
                ["<C-z>"] = actions.toggle_selection,
                ["<C-s>"] = actions.select_horizontal,
                ["<C-x>"] = trouble.smart_open_with_trouble,
                ["<M-l>"] = function(prompt_bufnr)
                    actions.smart_send_to_loclist(prompt_bufnr)
                    require("trouble").open("loclist")
                end,
                ["<M-a>"] = actions.toggle_all,
                ["<C-Down>"] = actions.cycle_history_next,
                ["<C-Up>"] = actions.cycle_history_prev,
            },
            n = {
                ["<C-z>"] = actions.toggle_selection,
                ["<C-s>"] = actions.select_horizontal,
                ["<C-x>"] = trouble.smart_open_with_trouble,
                ["<M-a>"] = actions.toggle_all,
                ["<M-l>"] = function(prompt_bufnr)
                    actions.smart_send_to_loclist(prompt_bufnr)
                    require("trouble").open("loclist")
                end,
                ["<C-Down>"] = actions.cycle_history_next,
                ["<C-Up>"] = actions.cycle_history_prev,
            },
        },
    },
    pickers = {
        find_files = {
            follow = true,
            theme = "dropdown",
        },
        buffers = {
            sort_mru = true,
        },
        lsp_code_actions = themes.get_cursor(),
        lsp_range_code_actions = themes.get_cursor(),
        lsp_references = {
            timeout = 100000,
        },
        lsp_definitions = {
            timeout = 100000,
        },
        lsp_type_definitions = {
            timeout = 100000,
        },
        lsp_implementations = {
            timeout = 100000,
        },
        lsp_workspace_symbols = {
            timeout = 100000,
        },
        lsp_dynamic_workspace_symbols = {
            timeout = 100000,
        },
    },
    extension = {
        file_browser = {
            hidden = true,
            depth = 2,
        },
    },
})

local copts = { noremap = true }
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", copts)
vim.api.nvim_set_keymap(
    "n",
    "<leader>f.",
    "<cmd>lua require'telescope'.extensions.file_browser.file_browser()<CR>",
    copts
)
vim.api.nvim_set_keymap("n", "<leader>fl", "<cmd>Telescope current_buffer_fuzzy_find<CR>", copts)
vim.api.nvim_set_keymap("n", "<leader>fq", "<cmd>Telescope quickfix<CR>", copts)
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope oldfiles<CR>", copts)
vim.api.nvim_set_keymap("n", "<leader>fr", "<cmd>Telescope frecency<CR>", copts)
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", copts)
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", copts)
-- vim.api.nvim_set_keymap("n", "<leader>fc", "<cmd>Telescope commands<CR>", copts)
vim.keymap.set("n", "<leader>fc", builtin.commands, copts)
vim.api.nvim_set_keymap("n", "<leader>ft", "<cmd>Telescope treesitter<CR>", copts)
vim.api.nvim_set_keymap("n", "<leader>fj", "<cmd>Telescope jumplist<CR>", copts)
vim.api.nvim_set_keymap("n", "<leader>T", "<cmd>Telescope<CR>", copts)
vim.api.nvim_set_keymap("n", "<leader>z", "<cmd>Telescope spell_suggest<CR>", copts)
vim.api.nvim_set_keymap("n", "<leader>fm", "<cmd>Telescope marks<CR>", copts)
vim.api.nvim_set_keymap("n", '<leader>t"', "<cmd>Telescope registers<CR>", copts)

-- vim.cmd([[ command! -nargs=1 -complete=dir FindFiles Telescope find_files cwd=<args>]])
-- vim.api.nvim_set_keymap("n", "<leader>fF", ":FindFiles ", copts)
-- nnoremap <leader>tr :Telescope lsp_references<CR>
-- nnoremap <leader>ts :Telescope lsp_document_symbols<CR>
