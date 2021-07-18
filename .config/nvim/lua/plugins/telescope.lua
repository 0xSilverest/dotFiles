local M = {}

M.plugin = {
    "nvim-telescope/telescope.nvim",
    module = "telescope",

    cmd = "Telescope",

    keys = {
        {"", "<C-p>"},
        {"", "<C-f>"},
        {"n", "<Leader>f"}
    },

    wants = {
        "popup.nvim",
        "plenary.nvim",
        "telescope-fzf-native.nvim",
        "telescope-frecency.nvim",
        "telescope-media-files.nvim",
        "telescope-hop.nvim"
    },

    requires = {
        {"nvim-telescope/telescope-media-files.nvim",
          opt = true},
        {"nvim-telescope/telescope-hop",
          opt = true},
        {"nvim-telescope/telescope-frecency.nvim",
          opt = true,
          requires = {
            {"tami5/sql.nvim",
              module = "sql"},
          }},
        {"nvim-telescope/telescope-fzf-native.nvim",
          opt = true,
          run = "make"},
        },
        {"nvim-telescope/telescope-arecibo.nvim",
          rocks = {"openssl", "lua-http-parser"}},

    config = function()
        require("plugins.telescope").config()
    end
}

M.config = function()
    local _, telescope = pcall(require, "telescope")
    local actions = require "telescope.actions"
    local previewers = require "telescope.previewers"

    local k = vim.keymap
    local nnoremap = k.nnoremap

    local delta = previewers.new_termopen_previewer {
      get_command = function(entry)
        return {
          "git",
          "-c",
          "core.pager=delta",
          "-c",
          "delta.side-by-side=false",
          "diff",
          entry.value .. "^!",
        }
      end,
    }

    M.no_preview = function()
      return require("telescope.themes").get_dropdown {
        borderchars = {
          { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
          prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
          results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
          preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        },
        layout_config = {
          width = 0.6,
        },
        previewer = false,
      }
    end

    telescope.setup{
        defaults = {
            vimgrep_arguments = {
                'rg',
                '--color=never',
                '--no-heading',
                '--with-filename',
                '--line-number',
                '--column',
                '--smart-case'
            },
            prompt_prefix = "> ",
            selection_caret = "> ",
            entry_prefix = "  ",
            initial_mode = "insert",
            selection_strategy = "reset",
            sorting_strategy = "descending",
            layout_strategy = "flex",
            scroll_strategy = "cycle",
            layout_config = {
                horizontal = {
                    width = 0.8,
                    height = 0.8,
                    preview_width = 0.6,
                },
                vertical = {
                    height = 0.8,
                    preview_height = 0.5,
                },
            },
            file_sorter =  require'telescope.sorters'.get_fuzzy_file,
            file_ignore_patterns = {},
            generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
            winblend = 0,
            border = {},
            borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
            color_devicons = true,
            use_less = true,
            path_display = {},
            set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,

            file_previewer = previewers.vim_buffer_cat.new,
            grep_previewer = previewers.vim_buffer_vimgrep.new,
            qflist_previewer = previewers.vim_buffer_qflist.new,
            buffer_previewer_maker = previewers.buffer_previewer_maker
        },
        pickers = {
            buffers = {
                sort_lastused = true,
                theme = "dropdown",
                previewer = false,
                mappings = {
                    i = {
                        ["<c-m>"] = telescope.extensions.metals.commands(),
                        ["<c-d>"] = actions.delete_buffer,
                        ["<C-h>"] = telescope.extensions.hop.hop,  -- hop.hop_toggle_selection
                        ["<C-space>"] = function(prompt_bufnr)
                            local opts = {
                                callback = actions.toggle_selection,
                                loop_callback = actions.send_selected_to_qflist,
                            }
                            telescope.extensions.hop._hop_loop(prompt_bufnr, opts)
                        end,
                    },
                    n = {
                        ["<c-d>"] = actions.delete_buffer,
                    }
                }
            },
            find_files = {
                file_ignore_patterns = {"%.class", "%.tasty"},
            },
            lsp_code_actions = M.no_preview(),
            current_buffer_fuzzy_find = M.no_preview(),
            git_commits = {
                previewer = {
                    delta,
                    previewers.git_commit_message.new {},
                    previewers.git_commit_diff_as_was.new {},
                },
            },
        },
        extensions = {
            fzf = {
                override_generic_sorter = true,
                override_file_sorter = true,
            },
            media_files = {
                filetypes = { "png", "webp", "jpg", "jpeg", "pdf", "mkv" },
                find_cmd = "rg",
            },
            frecency = {
                show_scores = false,
                show_unindexed = true,
                ignore_patterns = { "*.git/*", "*/tmp/*", "*/target/*"},
                workspaces = {
                    ["nvim"] = "/home/silverest/.config/nvim",
                    ["xmonad"] = "/home/silverest/.xmonad",
                    ["kitty"] = "/home/silverest/.config/kitty",
                    ["fish"] = "/home/silverest/.config/fish",
                    ["polybar"] = "/home/silverest/.config/polybar",
                    ["scala"] = "/home/silverest/Coding/scala",
                    ["clojure"] = "/home/silverest/Coding/clojure",
                    ["haskell"] = "/home/silverest/Coding/haskell",
                },
            },  
            arecibo = {
                ["selected_engine"]   = 'google',
                ["url_open_command"]  = 'xdg-open',
                ["show_http_headers"] = false,
                ["show_domain_icons"] = false,
            },
        }
    }

    local builtin = require "telescope.builtin"

    local plugins = {'fzf', 'media_files', 'hop',
                     'frecency', 'dap', 'arecibo'}

    for _, plug in ipairs(plugins) do
        pcall(telescope.load_extension, plug)
    end

    M.arecibo = function()
        telescope.extension.arecibo.websearch(M.no_preview())
    end

    M.frecency = function()
        telescope.extension.frecency.frecency(M.no_preview())
    end

    M.builtins = function()
        builtin.builtin(M.no_preview())
    end

    M.workspace_symbols = function()
        builtin.lsp_workspace_symbols {
            path_display = { "absolute" },
        }
    end

    M.grep_prompt = function()
        builtin.grep_string {
            path_display = { "shorten" },
            search = vim.fn.input "Grep String > ",
            only_sort_text = true,
            use_regex = true,
        }
    end
end

return M
