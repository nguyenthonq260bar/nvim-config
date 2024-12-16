local status, lualine = pcall(require, "lualine")
if not status then
  return
end

-- Lấy theme nightfly từ lualine
local lualine_theme = require("lualine.themes.catppuccin")


--Set color Insert, Command, Visual, Normal
local new_colors = {
  blue = "#65D1FF",
  green = "#3EFFDC",
  violet = "#FF61EF",
  yellow = "#FFDA7B",
  black = "#000000",
}



  


--
-- Cấu hình lualine với theme đã thay đổi và các thành phần khác
lualine.setup({
  options = {
      icons_enabled = true,
      theme = lualine_theme,
      component_separators = { left = '', right = ''}, --
      section_separators = { left = '', right = ''}, --
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = false,
      always_show_tabline = false,
      globalstatus = true,
      refresh = {
        statusline = 100,
        tabline = 100,
        winbar = 100,
      }
    },
    sections = 
    {
      lualine_z = 
      {
        {
          'buffers',
          use_mode_colors = true,
          symbols = 
          {
            modified = ' ●',      -- Text to show when the buffer is modified
            alternate_file = ' ► ', -- Text to show to identify the alternate file
            directory =  '',       
          },
        },
      },

      lualine_b = {'diff'},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {'branch'},
      lualine_a = {'mode'
      
      }

    },

    inactive_sections = {
      lualine_a = {{
       'tabs',
        tab_max_length = 40,
        max_length = vim.o.columns / 3,
        mode = 2,
        path = 0,
        use_mode_colors = true,
        tabs_color = {
          active = 'lualine_a_normal',
          inactive = 'lualine_a_inactive',
        },
        show_modified_status = true,
        symbols = {
          modified = '[+]',
        },
        fmt = function(name, context)
          local buflist = vim.fn.tabpagebuflist(context.tabnr)
          local winnr = vim.fn.tabpagewinnr(context.tabnr)
          local bufnr = buflist[winnr]
          local mod = vim.fn.getbufvar(bufnr, '&mod')
          return name .. (mod == 1 and ' +' or '')
        end},
    },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},

    winbar = {



  },
    inactive_winbar ={},

    extensions = {'fzf'}
  })
