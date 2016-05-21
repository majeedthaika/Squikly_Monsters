display.setStatusBar(display.HiddenStatusBar)
-- local physics = require "physics"
-- physics.start()
-- physics.setGravity(0,0)

-- SETUP BACKGROUND
local background = display.newImage("background2.jpg")
background:scale(2.0,1.8)--"letterbox")
background.anchorX = -8
background.anchorY = -5

local _H = display.contentHeight
local _W = display.contentWidth
local clicked = 0

print("display.content")
print(_H)
print(_W)

local cross
local naught
local number = 0

-- SETUP SCOREBOARD
local myscore
local score = require( "score" )
local scoreText = score.init({
   fontSize = 150,
   font = "Helvetica",
   x = display.contentCenterX-100,
   y = 80,
   maxDigits = 7,
   leadingZeros = false,
   filename = "scorefile.txt",
})

-- RESPOND TO TOUCH EVENTS
-- function touchScreen(event)
-- 	modulo = number - math.floor(number/2)*2
-- 	if event.phase == "ended" then
-- 		if number == 4 then
-- 			score.add(1)
-- 			myscore = score.get
-- 			print (type(myscore))
-- 		end
-- 		if modulo == 0 then
-- 			cross = display.newImage("cross.png")
-- 			cross.x = event.x
--         	cross.y = event.y
--         -- end
--         else
--         	naught = display.newImage("naught.png")
--         	naught.x = event.x
--         	naught.y = event.y
--         end
--         number = number + 1
--     end
-- end

-- Runtime:addEventListener("touch", touchScreen)

-----------------------------------------------
--ADD SQUARE GRIDS TO CONTROL CLICKS
local distanceApart = 300
local blank = "blank.png"
--[ middle row ]--
local button22= display.newImage(blank)
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

--function to change square grid to cross
function changeToCross( event )
	local button = event.target
	-- if event.phase == "ended" then
		print(button.state)
		if (button.state == "blank") then
			button = display.newImage("cross.png");
			button.x = event.target.x;
			button.y = event.target.y;
			button.state = "occupied"
			print (button.state)
			clicked = clicked + 1
		end
	-- end
end
--function to change square grid to naught
function changeToCircle( event )
	local button = event.target
	-- if event.phase == "ended" then
		print(button.state)
		if (button.state == "blank") then
			button = display.newImage("naught.png")
			button.x = event.target.x
			button.y = event.target.y
			button.state = "occupied"
			clicked = clicked + 1
		end
	-- end
end

function play(event)
	local button = event.target
	modulo = clicked - math.floor(clicked/2)*2
	if event.phase == "began" then
		if modulo == 0 then
			button11:addEventListener("touch", changeToCross)
			button12:addEventListener("touch", changeToCross)
			button13:addEventListener("touch", changeToCross)
			button21:addEventListener("touch", changeToCross)
			button22:addEventListener("touch", changeToCross)
			button23:addEventListener("touch", changeToCross)
			button31:addEventListener("touch", changeToCross)
			button32:addEventListener("touch", changeToCross)
			button33:addEventListener("touch", changeToCross)
		else
			button11:addEventListener("touch", changeToCircle)
			button12:addEventListener("touch", changeToCircle)
			button13:addEventListener("touch", changeToCircle)
			button21:addEventListener("touch", changeToCircle)
			button22:addEventListener("touch", changeToCircle)
			button23:addEventListener("touch", changeToCircle)
			button31:addEventListener("touch", changeToCircle)
			button32:addEventListener("touch", changeToCircle)
			button33:addEventListener("touch", changeToCircle)
		end
		-- print("modulo", modulo)
	end
end

Runtime:addEventListener("touch", play)

------------------------------------------------

-- function play(event)
-- 	local modulo = clicked - math.floor(clicked/2)*2
-- 	local button = event.target
-- 	if (button.state == "blank") then
-- 		if event.phase == "ended" then
-- 			if modulo == 0 then
-- 				button = display.newImage("naught.png")
-- 				button.x = event.target.x
-- 				button.y = event.target.y
-- 				button.state = "occupied"
-- 				clicked = clicked + 1
-- 			else
-- 				button = display.newImage("cross.png")
-- 				button.x = event.target.x
-- 				button.y = event.target.y
-- 				button.state = "occupied"
-- 				clicked = clicked + 1
-- 			end
-- 		end
-- 	end
-- 	print(clicked)
-- end

-- button11:addEventListener("touch", play)
-- button12:addEventListener("touch", play)
-- button13:addEventListener("touch", play)
-- button21:addEventListener("touch", play)
-- button22:addEventListener("touch", play)
-- button23:addEventListener("touch", play)
-- button31:addEventListener("touch", play)
-- button32:addEventListener("touch", play)
-- button33:addEventListener("touch", play)
-- button11:addEventListener("touch", play)
-- button12:addEventListener("touch", play)
-- button13:addEventListener("touch", play)
-- button21:addEventListener("touch", play)
-- button22:addEventListener("touch", play)
-- button23:addEventListener("touch", play)
-- button31:addEventListener("touch", play)
-- button32:addEventListener("touch", play)
-- button33:addEventListener("touch", play)