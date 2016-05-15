-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

-- Hide status bar
display.setStatusBar(display.HiddenStatusBar)

-- Set Title
local titleOption = {
	text = "Tamagotchi v0.1",
	x = display.contentCenterX,
	y = 24,
	fontSize = 24,
	width = 200,
	height = 0
}
local title = display.newText(titleOption)

-- Set Background
local background = display.newImage("background.png", display.contentCenterX, display.contentCenterY)


-- Set Tamagotchi
local tamagotchiOption = {
	width = 100,
	height = 98,
	numFrames = 5,

}
local tamagotchi = graphics.newImageSheet("bird.png", tamagotchiOption)

local sequence = {
	{
		name = "normal",
		start = 1,
		count = 5,
		time = 1000,
		loopcount = 0,
		loopdirection = "forward"
	}
}

local anime = display.newSprite(tamagotchi, sequence)
anime.x = display.contentCenterX
anime.y = 250
anime:play()


-- Add interaction

function anime:touch(event)
	if event.phase == "began" then
		print "Touch"
		return true
	end
end

anime:addEventListener("touch", anime)



























