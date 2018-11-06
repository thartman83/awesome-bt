-------------------------------------------------------------------------------
-- awesome-bt_spec.lua for awesome-bt                                        --
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
-- Unit tests for awesome-bt
-- }}}

--- awesome-bt tests -- {{{
require 'busted.runner'()
package.path = 'mocks/?.lua;mocks/?/init.lua;../?/init.lua;' .. package.path

describe("a set of tests for awesome-bt", function()

  --- BlockDescription -- {{{
  describe("tests for parsing discovered bt devices", function ()
    local abt = require("awesome-bt")()    
    
  end)
  -- }}}
  
end)

-- }}}
