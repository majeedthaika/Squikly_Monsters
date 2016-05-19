display.setStatusBar( display.HiddenStatusBar )

-- include the Corona "composer" module
local composer = require "composer"

-- SETUP BACKGROUND
local background = display.newImage("background.jpg")
background:scale(2.0,1.8)--"letterbox")
background.anchorX = -8
background.anchorY = -5

local _H = display.contentHeight
local _W = display.contentWidth