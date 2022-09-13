local status, dashboard = pcall(require, 'dashboard')
if (not status) then return end

dashboard.custom_header = {
  '',
  '███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
  '████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
  '██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
  '██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
  '██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
  '╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
  '',
}

dashboard.custom_center = {
  {
    icon = '⚑ ',
    desc = 'Recently files                           ',
    action = 'Telescope oldfiles',
    shortcut = 'SPC f r',
  },
  {
    icon = ' ',
    desc = 'Projects                                 ',
    action = 'Telescope projects',
    shortcut = 'SPC f p',
  },
  {
    icon = ' ',
    desc = 'Find file                                ',
    action = 'Telescope find_files',
    shortcut = 'SPC f f'
  },
  {
    icon = '✪ ',
    desc = 'Find file with live grep                 ',
    action = 'Telescope live_grep',
    shortcut = 'SPC f g'
  },
}
