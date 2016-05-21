-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

-- Hide status bar
display.setStatusBar(display.HiddenStatusBar)

-- Hide android navigation bar
native.setProperty( "androidSystemUiVisibility", "immersiveSticky" )

local composer = require "composer"

-- load home screen
composer.gotoScene( "home" )






