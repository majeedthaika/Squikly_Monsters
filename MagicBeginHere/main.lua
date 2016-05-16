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
	numFrames = 15,

}
local tamagotchi = graphics.newImageSheet("bird.png", tamagotchiOption)


-- Setup seqences for each animation
local sequence = {
	{
		name = "normal",
		start = 1,
		count = 5,
		time = 1000,
		loopcount = 0,
		loopdirection = "forward"
	},

	{
		name = "happy",
		start = 12,
		count = 3,
		time = 1000,
		loopcount = 0,
		loopdirection = "forward"
	}
}

-- Setuo anime location
local anime = display.newSprite(tamagotchi, sequence)
anime.x = display.contentCenterX
anime.y = 250
anime:play()


-- Set default animation
function default(event)
	anime:setSequence("normal")
	anime:play()
end

-- Set interaction when touch
function anime:touch(event)
	if event.phase == "began" then
		anime:setSequence("happy")
		anime:play()
		timer.performWithDelay(1000, default) -- reset animation to default
		return true
	end
end

-- Add even listener for touch event on anime
anime:addEventListener("touch", anime)
