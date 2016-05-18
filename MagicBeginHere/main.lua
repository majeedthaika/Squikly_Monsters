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
	text = "Tamagotchi v0.11",
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
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> a5d812a... Add touch tama Happy, update tama pic
	width = 300,
	height = 300,
	numFrames = 16,

	sheetContentWidth = 2400,
	sheetContentHeight = 600,
<<<<<<< HEAD


=======
	width = 100,
	height = 98,
	numFrames = 15,
>>>>>>> f23a223... Add animation changes, and timer to default animation

}
local tamagotchi = graphics.newImageSheet("egg.png", tamagotchiOption)
=======

>>>>>>> a5d812a... Add touch tama Happy, update tama pic

<<<<<<< HEAD
=======

<<<<<<< HEAD
>>>>>>> f23a223... Add animation changes, and timer to default animation
=======
}
local tamagotchi = graphics.newImageSheet("egg.png", tamagotchiOption)

>>>>>>> a5d812a... Add touch tama Happy, update tama pic
-- Setup seqences for each animation
local sequence = {
	{
		name = "normal",
		start = 1,
		count = 8,
		time = 1600*1.5,
<<<<<<< HEAD
		loopcount = 0,
		loopdirection = "forward"
	},

	{
		name = "happy",
		start = 6,
		count = 8,
		time = 1600,
=======
>>>>>>> a5d812a... Add touch tama Happy, update tama pic
		loopcount = 0,
		loopdirection = "forward"
	},

	{
		name = "happy",
		start = 6,
		count = 8,
		time = 1600,
		loopcount = 0,
		loopdirection = "forward"
	}
}

<<<<<<< HEAD
<<<<<<< HEAD
-- Setuo anime location
local anime = display.newSprite(tamagotchi, sequence)
anime.x = display.contentCenterX
anime.y = 225
anime:scale(0.5, 0.5)
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
		timer.performWithDelay(1600, default) -- reset animation to default
=======
=======
-- Setuo anime location
>>>>>>> f23a223... Add animation changes, and timer to default animation
local anime = display.newSprite(tamagotchi, sequence)
anime.x = display.contentCenterX
anime.y = 225
anime:scale(0.5, 0.5)
anime:play()


-- Set default animation
function default(event)
	anime:setSequence("normal")
	anime:play()
end

-- Set interaction when touch
function anime:touch(event)
	if event.phase == "began" then
<<<<<<< HEAD
		print "Touch"
>>>>>>> 71fc3a6... Add interaction, remove icons
=======
		anime:setSequence("happy")
		anime:play()
<<<<<<< HEAD
		timer.performWithDelay(1000, default) -- reset animation to default
>>>>>>> f23a223... Add animation changes, and timer to default animation
=======
		timer.performWithDelay(1600, default) -- reset animation to default
>>>>>>> a5d812a... Add touch tama Happy, update tama pic
		return true
	end
end

<<<<<<< HEAD
<<<<<<< HEAD
-- Add even listener for touch event on anime
=======
>>>>>>> 71fc3a6... Add interaction, remove icons
=======
-- Add even listener for touch event on anime
>>>>>>> f23a223... Add animation changes, and timer to default animation
anime:addEventListener("touch", anime)
