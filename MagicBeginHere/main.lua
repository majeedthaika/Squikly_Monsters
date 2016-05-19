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
	width = 300,
	height = 300,
	numFrames = 16,

	sheetContentWidth = 2400,
	sheetContentHeight = 600,



}
local tamagotchi = graphics.newImageSheet("egg.png", tamagotchiOption)

-- Setup seqences for each animation
local sequence = {
	{
		name = "normal",
		start = 1,
		count = 8,
		time = 1600*1.5,
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

-- =====================

-- Set Icons
local icon_1 = display.newImage("tmpIcon.png", anime.x, anime.y)
icon_1:scale(0.05, 0.05)
icon_1.alpha = 0


-- =====================

-- Set global for icons
icons = {icon_1}
xAxis = {75}
yAxis = {75}
-- Set hide/show icons
function hideShowIcons()
		if icons[1].alpha == 0 then
			for i = 1, 1 do
				transition.to(icons[i], 
					{x = anime.x + xAxis[i], y = anime.y - yAxis[i],
					alpha = 1, time = 250})
			end
		else
			for i = 1, 1 do
				transition.to(icons[i], 
					{x = anime.x, y = anime.y,
					alpha = 0, time = 250})
			end	
		end		
end

-- Set reaction when touch
function anime:touch(event)
	if event.phase == "began" then
		hideShowIcons()
	end
end

-- Set Happy when feed
function icon_1:touch(event)
	if event.phase == "began" then
		anime:setSequence("happy")
		anime:play()
		timer.performWithDelay(1600, default) -- reset animation to default
		hideShowIcons()
		return true
	end
end

-- Add even listener for touch event on anime
anime:addEventListener("touch", anime)
icon_1:addEventListener("touch", icon_1)





