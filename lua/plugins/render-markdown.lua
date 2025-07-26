return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
  opts = {
    -- Heading icons from our previous setup
    heading = {
      -- Useful context to have when evaluating values.
      -- | level    | the number of '#' in the heading marker         |
      -- | sections | for each level how deeply nested the heading is |

      -- Turn on / off heading icon & background rendering.
      enabled = true,
      -- Additional modes to render headings.
      render_modes = false,
      -- Turn on / off atx heading rendering.
      atx = true,
      -- Turn on / off setext heading rendering.
      setext = true,
      -- Turn on / off sign column related rendering.
      sign = true,
      -- Replaces '#+' of 'atx_h._marker'.
      -- Output is evaluated depending on the type.
      -- | function | `value(context)`              |
      -- | string[] | `cycle(value, context.level)` |
      icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
      -- Determines how icons fill the available space.
      -- | right   | '#'s are concealed and icon is appended to right side                      |
      -- | inline  | '#'s are concealed and icon is inlined on left side                        |
      -- | overlay | icon is left padded with spaces and inserted on left hiding additional '#' |
      position = 'overlay',
      -- Added to the sign column if enabled.
      -- Output is evaluated by `cycle(value, context.level)`.
      signs = { '󰫎 ' },
      -- Width of the heading background.
      -- | block | width of the heading text |
      -- | full  | full width of the window  |
      -- Can also be a list of the above values evaluated by `clamp(value, context.level)`.
      width = 'full',
      -- Amount of margin to add to the left of headings.
      -- Margin available space is computed after accounting for padding.
      -- If a float < 1 is provided it is treated as a percentage of available window space.
      -- Can also be a list of numbers evaluated by `clamp(value, context.level)`.
      left_margin = 0,
      -- Amount of padding to add to the left of headings.
      -- Output is evaluated using the same logic as 'left_margin'.
      left_pad = 0,
      -- Amount of padding to add to the right of headings when width is 'block'.
      -- Output is evaluated using the same logic as 'left_margin'.
      right_pad = 0,
      -- Minimum width to use for headings when width is 'block'.
      -- Can also be a list of integers evaluated by `clamp(value, context.level)`.
      min_width = 0,
      -- Determines if a border is added above and below headings.
      -- Can also be a list of booleans evaluated by `clamp(value, context.level)`.
      border = false,
      -- Always use virtual lines for heading borders instead of attempting to use empty lines.
      border_virtual = false,
      -- Highlight the start of the border using the foreground highlight.
      border_prefix = false,
      -- Used above heading for border.
      above = '▄',
      -- Used below heading for border.
      below = '▀',
      -- Highlight for the heading icon and extends through the entire line.
      -- Output is evaluated by `clamp(value, context.level)`.
      backgrounds = {
        'RenderMarkdownH1Bg',
        'RenderMarkdownH2Bg',
        'RenderMarkdownH3Bg',
        'RenderMarkdownH4Bg',
        'RenderMarkdownH5Bg',
        'RenderMarkdownH6Bg',
      },
      -- Highlight for the heading and sign icons.
      -- Output is evaluated using the same logic as 'backgrounds'.
      foregrounds = {
        'RenderMarkdownH1',
        'RenderMarkdownH2',
        'RenderMarkdownH3',
        'RenderMarkdownH4',
        'RenderMarkdownH5',
        'RenderMarkdownH6',
      },
      -- Define custom heading patterns which allow you to override various properties based on
      -- the contents of a heading.
      -- The key is for healthcheck and to allow users to change its values, value type below.
      -- | pattern    | matched against the heading text @see :h lua-patterns |
      -- | icon       | optional override for the icon                        |
      -- | background | optional override for the background                  |
      -- | foreground | optional override for the foreground                  |
      custom = {},
    },

    link = {
      -- Turn on / off inline link icon rendering.
      enabled = true,
      -- Additional modes to render links.
      render_modes = false,
      -- How to handle footnote links, start with a '^'.
      footnote = {
        -- Turn on / off footnote rendering.
        enabled = true,
        -- Replace value with superscript equivalent.
        superscript = true,
        -- Added before link content.
        prefix = '',
        -- Added after link content.
        suffix = '',
      },
      -- Inlined with 'image' elements.
      image = '󰥶 ',
      -- Inlined with 'email_autolink' elements.
      email = '󰀓 ',
      -- Fallback icon for 'inline_link' and 'uri_autolink' elements.
      hyperlink = '󰌹 ',
      -- Applies to the inlined icon as a fallback.
      highlight = 'RenderMarkdownLink',
      -- Applies to WikiLink elements.
      wiki = {
        icon = '󱗖 ',
        body = function()
          return nil
        end,
        highlight = 'RenderMarkdownWikiLink',
      },
      -- Define custom destination patterns so icons can quickly inform you of what a link
      -- contains. Applies to 'inline_link', 'uri_autolink', and wikilink nodes. When multiple
      -- patterns match a link the one with the longer pattern is used.
      -- The key is for healthcheck and to allow users to change its values, value type below.
      -- | pattern   | matched against the destination text                            |
      -- | icon      | gets inlined before the link text                               |
      -- | kind      | optional determines how pattern is checked                      |
      -- |           | pattern | @see :h lua-patterns, is the default if not set       |
      -- |           | suffix  | @see :h vim.endswith()                                |
      -- | priority  | optional used when multiple match, uses pattern length if empty |
      -- | highlight | optional highlight for 'icon', uses fallback highlight if empty |
      custom = {
        web = { pattern = '^http', icon = '󰖟 ' },
        discord = { pattern = 'discord%.com', icon = '󰙯 ' },
        github = { pattern = 'github%.com', icon = '󰊤 ' },
        gitlab = { pattern = 'gitlab%.com', icon = '󰮠 ' },
        google = { pattern = 'google%.com', icon = '󰊭 ' },
        neovim = { pattern = 'neovim%.io', icon = ' ' },
        reddit = { pattern = 'reddit%.com', icon = '󰑍 ' },
        stackoverflow = { pattern = 'stackoverflow%.com', icon = '󰓌 ' },
        wikipedia = { pattern = 'wikipedia%.org', icon = '󰖬 ' },
        youtube = { pattern = 'youtube%.com', icon = '󰗃 ' },
      },
    },

    indent = {
      -- Mimic org-indent-mode behavior by indenting everything under a heading based on the
      -- level of the heading. Indenting starts from level 2 headings onward by default.

      -- Turn on / off org-indent-mode.
      enabled = true,
      -- Additional modes to render indents.
      render_modes = false,
      -- Amount of additional padding added for each heading level.
      per_level = 2,
      -- Heading levels <= this value will not be indented.
      -- Use 0 to begin indenting from the very first level.
      skip_level = 1,
      -- Do not indent heading titles, only the body.
      skip_heading = false,
      -- Prefix added when indenting, one per level.
      icon = '▎',
      -- Priority to assign to extmarks.
      priority = 0,
      -- Applied to icon.
      highlight = 'RenderMarkdownIndent',
    },

    bullet = {
      -- Useful context to have when evaluating values.
      -- | level | how deeply nested the list is, 1-indexed          |
      -- | index | how far down the item is at that level, 1-indexed |
      -- | value | text value of the marker node                     |

      -- Turn on / off list bullet rendering
      enabled = true,
      -- Additional modes to render list bullets
      render_modes = false,
      -- Replaces '-'|'+'|'*' of 'list_item'.
      -- If the item is a 'checkbox' a conceal is used to hide the bullet instead.
      -- Output is evaluated depending on the type.
      -- | function   | `value(context)`                                    |
      -- | string     | `value`                                             |
      -- | string[]   | `cycle(value, context.level)`                       |
      -- | string[][] | `clamp(cycle(value, context.level), context.index)` |
      icons = { '●', '○', '◆', '◇' },
      -- Replaces 'n.'|'n)' of 'list_item'.
      -- Output is evaluated using the same logic as 'icons'.
      ordered_icons = function(ctx)
        local value = vim.trim(ctx.value)
        local index = tonumber(value:sub(1, #value - 1))
        return ('%d.'):format(index > 1 and index or ctx.index)
      end,
      -- Padding to add to the left of bullet point.
      -- Output is evaluated depending on the type.
      -- | function | `value(context)` |
      -- | integer  | `value`          |
      left_pad = 0,
      -- Padding to add to the right of bullet point.
      -- Output is evaluated using the same logic as 'left_pad'.
      right_pad = 1,
      -- Highlight for the bullet icon.
      -- Output is evaluated using the same logic as 'icons'.
      highlight = 'RenderMarkdownBullet',
      -- Highlight for item associated with the bullet point.
      -- Output is evaluated using the same logic as 'icons'.
      scope_highlight = {},
    },
    -- The new, correct checkbox configuration
    checkbox = {
      enabled = true,
      -- Define the standard unchecked/checked states
      unchecked = { icon = "󰘼 ", highlight = "RenderMarkdownTodo" },
      checked = { icon = "󰘾 ", highlight = "RenderMarkdownDone", strikethrough = true },
      bullet = false,
      right_pad = 1,
      -- Define all of our custom states
      custom = {
        inprogress = { raw = "[~]", rendered = "󰪢 ", highlight = "RenderMarkdownInProgress" },
        question   = { raw = "[?]", rendered = " ", highlight = "RenderMarkdownQuestion" },
        warning    = { raw = "[!]", rendered = " ", highlight = "RenderMarkdownWarning" },
        idea       = { raw = "[i]", rendered = "󰛨 ", highlight = "RenderMarkdownIdea" },
        decision   = { raw = "[>]", rendered = " ", highlight = "RenderMarkdownDecision" },
        cancelled  = { raw = "[/]", rendered = "󰍚 ", highlight = "RenderMarkdownCancelled" },
      },
    },
  },
  ft = { "markdown", "norg", "rmd", "org", "codecompanion" },
  config = function(_, opts)
    -- Set up render-markdown first
    require("render-markdown").setup(opts)

    -- Define the highlight colors to match the keys in the opts table
    vim.api.nvim_set_hl(0, "RenderMarkdownTodo", { fg = "#f2f2f2" })
    vim.api.nvim_set_hl(0, "RenderMarkdownDone", { fg = "#4fff4f", strikethrough = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownInProgress", { fg = "#5f87AF", bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownQuestion", { fg = "#af87af", bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownWarning", { fg = "#ffcf00", bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownIdea", { fg = "#afaf87", bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownDecision", { fg = "#00dfff", bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownCancelled", { fg = "#ff695f", bold = true })

    -- Task cycling functionality
    local M = {}
    -- This order determines the cycle sequence
    local states = { " ", "~", "x", "?", "!", "i", ">" }

    function M.set_state(new_char)
      local line = vim.api.nvim_get_current_line()
      -- Find the character inside the brackets and replace it
      local new_line = line:gsub("%-%s*%[([%w%p%s])%]", "- [" .. new_char .. "]")
      -- Only update the line if a change was actually made
      if new_line ~= line then
        vim.api.nvim_set_current_line(new_line)
      end
    end

    function M.append_task()
      vim.api.nvim_put({ "- [ ] " }, "c", true, true)
    end

    -- Setup keymaps for Markdown files
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function()
        -- NEW KEYMAPS: Direct state setting
        vim.keymap.set("n", "<leader>clear", function() M.set_state(" ") end,
          { buffer = true, desc = "Set Task to Unchecked" })
        vim.keymap.set("n", "<leader>done", function() M.set_state("x") end,
          { buffer = true, desc = "Set Task to Checked" })
        vim.keymap.set("n", "<leader>in", function() M.set_state("~") end,
          { buffer = true, desc = "Set Task to In-Progress" })
        vim.keymap.set("n", "<leader>question", function() M.set_state("?") end,
          { buffer = true, desc = "Set Task to Question" })
        vim.keymap.set("n", "<leader>warn", function() M.set_state("!") end,
          { buffer = true, desc = "Set Task to Warning" })
        vim.keymap.set("n", "<leader>idea", function() M.set_state("i") end, { buffer = true, desc = "Set Task to Idea" }) -- Using 'a' for idea
        vim.keymap.set("n", "<leader>decision", function() M.set_state(">") end,
          { buffer = true, desc = "Set Task to Decision" })
        vim.keymap.set("n", "<leader>cancel", function() M.set_state("/") end,
          { buffer = true, desc = "Set Task to Cancelled" })
        vim.keymap.set("n", "<leader>C", M.append_task, { buffer = true, desc = "Append New Task" })

        -- ADDED: Keymap for automatically continuing a task list
        vim.keymap.set("i", "<CR>", function()
          local line = vim.api.nvim_get_current_line()
          -- If the current line is a task list item...
          if line:match("^%s*-%s*%[.%]") then
            -- ...and the text after the checkbox is empty...
            if line:match("^%s*-%s*%[.%]%s*$") then
              -- ...then delete the empty task item and create a normal new line.
              vim.api.nvim_set_current_line(line:gsub("%- %[.%]%s*$", ""), false)
              return vim.api.nvim_replace_termcodes("<CR><CR>", true, true, true)
            else
              -- ...otherwise, create a new line with a fresh todo checkbox.
              return vim.api.nvim_replace_termcodes("<CR>- [ ] ", true, true, true)
            end
          else
            -- If not a task line, just act like a normal Enter press.
            return vim.api.nvim_replace_termcodes("<CR>", true, true, true)
          end
        end, { buffer = true, expr = true, desc = "Continue markdown task list" })
      end,
    })

    -- LazyVim toggle integration (only if LazyVim is available)
    local ok, toggle = pcall(require, "lazyvim.plugins.common.toggle")
    if ok then
      toggle.map("<leader>um", {
        name = "Render Markdown",
        get = function() return require("render-markdown.state").enabled end,
        set = function(enabled)
          local m = require("render-markdown")
          if enabled then m.enable() else m.disable() end
        end,
      })
    end
  end,
}
