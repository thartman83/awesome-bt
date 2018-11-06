-------------------------------------------------------------------------------
-- init.lua for awesome-bt                                                   --
-- Copyright (c) 2018 Tom Hartman (thomas.lees.hartman@gmail.com)            --
--                                                                           --
-- This program is free software; you can redistribute it and/or             --
-- modify it under the terms of the GNU General Public License               --
-- as published by the Free Software Foundation; either version 2            --
-- of the License, or the License, or (at your option) any later             --
-- version.                                                                  --
--                                                                           --
-- This program is distributed in the hope that it will be useful,           --
-- but WITHOUT ANY WARRANTY; without even the implied warranty of            --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the             --
-- GNU General Public License for more details.                              --
-------------------------------------------------------------------------------

--- Commentary -- {{{
-- Awesome widget to manage bluetooth connections
-- }}}

--- awesome-bt -- {{{

--- Libraries -- {{{
local setmetatable = setmetatable
local math         = math
local wibox        = require('wibox'       )
local color        = require('gears.color' )
local awful        = require('awful'       )
local gtable       = require('gears.table' )
local gstring      = require('gears.string')
local naughty      = require('naughty'     )
local beautiful    = require('beautiful'   )
local dp           = require('dbus_proxy'  )
-- }}}

local bt = {}

--- bt:fit -- {{{
----------------------------------------------------------------------
-- Return the desired width and height of the widget
--
-- @param ctx Cairo context
-- @param width the hinted width
-- @param height the hinted height
--
-- @return the desired width and height, where the width is equal to
-- half the height of the bounding wibar
----------------------------------------------------------------------
function bt:fit (ctx, width, height)
   return height / 2, height
end
-- }}}

--- bt:draw -- {{{
----------------------------------------------------------------------
-- Draw the bt widget. The bluetooth glyph has a 2:1 ratio for height
-- to width. 
--
-- @param w the widget to draw
-- @param cr the cairo context
-- @param width the width of the widget to draw
-- @param height the height of the widget to draw
----------------------------------------------------------------------
function bt:draw (w, cr, width, height)
   cr:save()
   cr:set_source(color(self._color or beautiful.fg_normal))

   cr.line_width = w.line_width or 1

   local margin = self._margin or 5
   local glyph_height = (height - (margin * 2))
   local glyph_width  = (width  - margin)   
   local glyph_x_zero = (width - glyph_width  ) / 2
   local glyph_y_zero = (height - glyph_height) / 2      
   
   cr:move_to(glyph_x_zero                     , glyph_y_zero + (glyph_height * .25))
   cr:line_to(glyph_x_zero + glyph_width       , glyph_y_zero + (glyph_height * .75))
   cr:line_to(glyph_x_zero + (glyph_width * .5), glyph_y_zero + glyph_height        )
   cr:line_to(glyph_x_zero + (glyph_width * .5), glyph_y_zero                       )
   cr:line_to(glyph_x_zero + (glyph_width)     , glyph_y_zero + (glyph_height * .25))
   cr:line_to(glyph_x_zero                     , glyph_y_zero + (glyph_height * .75))
   cr:stroke()
   
   cr:restore()
end
-- }}}

--- Constructor -- {{{
local function new(args)
   local obj = wibox.widget.base.empty_widget()
   gtable.crush(obj, bt, true)

   obj._bluezObjMgr = dp.Proxy:new( { bus       = dp.Bus.SYSTEM,
                                    name      = "org.bluez",
                                    interface = "org.bluez.ObjectManager",
                                    path      = "/" })

   local args = args or {}

   return obj
end
-- }}}

return setmetatable(bt, {__call = function(_,...) return new(...) end})
-- }}}
