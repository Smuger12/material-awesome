-------------------------------------------------
-- Battery Widget for Awesome Window Manager
-- Shows the battery status using the ACPI tool
-- More details could be found here:
-- https://github.com/streetturtle/awesome-wm-widgets/tree/master/battery-widget

-- @author Pavel Makhov
-- @copyright 2017 Pavel Makhov
-------------------------------------------------

local awful = require('awful')
local naughty = require('naughty')
local watch = require('awful.widget.watch')
local wibox = require('wibox')
local clickable_container = require('widget.material.clickable-container')
local gears = require('gears')
local dpi = require('beautiful').xresources.apply_dpi

local HOME = os.getenv('HOME')
local PATH_TO_ICONS = HOME .. '/.config/awesome/widget/package-updater/icons/'
local updateAvailable = false
local numOfUpdatesAvailable

local widget =
  wibox.widget {
  {
    id = 'icon',
    widget = wibox.widget.imagebox,
    resize = true
  },
  layout = wibox.layout.align.horizontal
}

local widget_button = clickable_container(wibox.container.margin(widget, dpi(14), dpi(14), dpi(4), dpi(4)))
widget_button:buttons(
  gears.table.join(
    awful.button(
      {},
      1,
      nil,
      function()
        if updateAvailable then
          awful.spawn('pamac-manager --updates')
        else
          awful.spawn('pamac-manager')
        end
      end
    )
  )
)
-- Alternative to naughty.notify - tooltip. You can compare both and choose the preferred one
awful.tooltip(
  {
    objects = {widget_button},
    mode = 'outside',
    align = 'right',
    timer_function = function()
      if updateAvailable then
        return numOfUpdatesAvailable .. ' updates are available'
      else
        return 'We are up-to-date!'
      end
    end,
    preferred_positions = {'right', 'left', 'top', 'bottom'}
  }
)

local last_battery_check = os.time()
watch(
  'pamac checkupdates',
  60,
  function(_, stdout)
    numOfUpdatesAvailable = tonumber(stdout:match('.-\n'):match('%d*'))
    local widgetIconName
    if (numOfUpdatesAvailable ~= nil) then
      updateAvailable = true
      widgetIconName = 'package-up'
    else
      updateAvailable = false
      widgetIconName = 'package'
    end
    widget.icon:set_image(PATH_TO_ICONS .. widgetIconName .. '.svg')
    collectgarbage('collect')
  end,
  widget
)

return widget_button
