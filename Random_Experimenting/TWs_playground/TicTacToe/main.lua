display.setStatusBar( display.HiddenStatusBar )

-- include the Corona "composer" module
local composer = require "composer"

-- SETUP BACKGROUND
local background = display.newImage("background.jpg")
background:scale(1.0,1.0)--"letterbox")
background.anchorX = 0
background.anchorY = 0

local _H = display.contentHeight
local _W = display.contentWidth

local start = display.newImage("start-button.png")
start:scale(0.5,0.5)
start.x = _W / 2 - 50
start.y = (_H / 2) + 15

local instruction = display.newImage("instructions-button.png")
instruction:scale(0.8,0.8)
instruction.x = _W / 2 + 110
instruction.y = (_H / 2) - 3

local help = display.newImage("help.png")
help:scale(1,1)
help.x = instruction.x
help.y = instruction.y
help.isVisible = false

function tictactoe(event)
	if event.phase == "ended" then
		composer.gotoScene( "tictactoe", "flip", 1000 )
	end
end

function helpme(event)
	if event.x > instruction.x - instruction.width and event.x < instruction.x + instruction.width or event.y == instruction.y then
		help.isVisible = true
	else
		help.isVisible = false
	end
end

start:addEventListener("touch", tictactoe)
Runtime:addEventListener("mouse", helpme)