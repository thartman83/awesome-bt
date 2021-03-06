-------------------------------------------------------------------------------
-- init.lua for wibox.widget mocks                                           --
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
-- wibox.widget mocks
-- }}}

--- widget -- {{{
return { imagebox = require('wibox.widget.imagebox'),
         textbox  = require('wibox.widget.textbox' ),
         base     = require('wibox.widget.base'    )
}
-- }}}
