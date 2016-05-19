local composer = require( "composer" )
local scene = composer.newScene()

display.setStatusBar(display.HiddenStatusBar)

-- SETUP BACKGROUND
local background = display.newImage("background2.png")
background:scale(2.0,1.8)--"letterbox")
background.anchorX = -8
background.anchorY = -5

local _H = display.contentHeight
local _W = display.contentWidth


-- print("display.content")
-- print(_H)
-- print(_W)

-- SETUP SCOREBOARD
-- local score = require( "score" )
-- local scoreText = score.init({
--    fontSize = 150,
--    font = "Helvetica",
--    x = display.contentCenterX-100,
--    y = 80,
--    maxDigits = 7,
--    leadingZeros = false,
--    filename = "scorefile.txt",
-- })

local textBox = native.newTextBox( 100, 240, 400, 140 )
textBox.font = native.newFont( "Helvetica-Bold", 70 )
textBox:setTextColor(0, 0, 0)
textBox.alpha = 1.0
textBox.hasBackground = false
textBox.text = "You win!"
textBox.x = (_W/2) + 40
textBox.y = (_H/2) - 400
textBox.isVisible = false

-----------------------------------------------
--ADD SQUARE GRIDS TO CONTROL CLICKS
local distanceApart = 300
local blank = "blank.png"
--[ middle row ]--
local button22 = display.newImage(blank)
button22.x = _W / 2
button22.y = (_H / 2) + 50
button22.state = "blank"
local button21 = display.newImage(blank)
button21.x = button22.x - distanceApart
button21.y = button22.y
button21.state = "blank"
local button23 = display.newImage(blank)
button23.x = button22.x + distanceApart
button23.y = button22.y
button23.state = "blank"

--[ top row ]--
local button11 = display.newImage(blank)
button11.x = button21.x
button11.y = button21.y - distanceApart
button11.state = "blank"
local button12 = display.newImage(blank)
button12.x = button22.x
button12.y = button22.y - distanceApart
button12.state = "blank"
local button13 = display.newImage(blank)
button13.x = button23.x
button13.y = button23.y - distanceApart
button13.state = "blank"

--[bottom row]--
local button31 = display.newImage(blank)
button31.x = button21.x
button31.y = button21.y + distanceApart
button31.state = "blank"
local button32 = display.newImage(blank)
button32.x = button22.x
button32.y = button22.y + distanceApart
button32.state = "blank"
local button33 = display.newImage(blank)
button33.x = button23.x
button33.y = button23.y + distanceApart
button33.state = "blank"

------------------------------------------------
--function to deliver moves played by user
local clicked = 0

function reset()
	print("Reseting..")
	composer.removeScene("tictactoe")
	--change screen
end

function gameover()
	print("Checking..")
	--just check if any consecutive buttons have same state, but not blank.
	--if block for win
	if
	--conditions for 3 in a row
	((button31.state ~= "blank") and (button31.state == button32.state) and (button32.state == button33.state)) or
	((button21.state ~= "blank") and (button21.state == button22.state) and (button22.state == button23.state)) or
	((button11.state ~= "blank") and (button11.state == button12.state) and (button12.state == button13.state)) or
	--conditons for 3 in a col
	((button11.state ~= "blank") and (button11.state == button21.state) and (button21.state == button31.state)) or
	((button22.state ~= "blank") and (button22.state == button12.state) and (button12.state == button32.state)) or
	((button33.state ~= "blank") and (button33.state == button23.state) and (button23.state == button13.state)) or
	--conditions for diagonals
	((button11.state ~= "blank") and (button11.state == button22.state) and (button22.state == button33.state)) or
	((button31.state ~= "blank") and (button31.state == button22.state) and (button22.state == button13.state)) then
		local modulo = clicked - math.floor(clicked/2)*2
		if (modulo == 0) then
			print("cross wins!")
			textBox.text = "AI wins!"
			textBox.isVisible = true
		else
			print("naught wins!")
			textBox.text = "You win!"
			textBox.isVisible = true
		end
		reset()
	--contions for draw
	elseif (clicked == 9) then
		print("Draw!")
		textBox.text = "Draw!"
		textBox.isVisible = true
		reset()
	end
end

--called when a moved is made
function play(event)
	local modulo = clicked - math.floor(clicked/2)*2
	if (event.target.state == "blank") then
		if event.phase == "ended" then
			if modulo == 0 then
				local button = display.newImage("naught.png")
				button.x = event.target.x
				button.y = event.target.y
				event.target.state = "naught"
				clicked = clicked + 1
			else
				local button = display.newImage("cross.png")
				button.x = event.target.x
				button.y = event.target.y
				event.target.state = "cross"
				clicked = clicked + 1
			end
			if (clicked > 4) then
				gameover()
			end
		end
	end
end

--event listener for the grid
button11:addEventListener("touch", play)
button12:addEventListener("touch", play)
button13:addEventListener("touch", play)
button21:addEventListener("touch", play)
button22:addEventListener("touch", play)
button23:addEventListener("touch", play)
button31:addEventListener("touch", play)
button32:addEventListener("touch", play)
button33:addEventListener("touch", play)

local composer = require "composer"
-- load menu screen
return scene