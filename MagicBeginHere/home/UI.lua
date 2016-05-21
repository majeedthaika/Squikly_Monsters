local widget = require( "widget" )
require("home.tama")

function setUpTitle(title)
    -- Set Title
    local titleOption = {
        text = title,
        x = display.contentCenterX,
        y = 24,
        fontSize = 24,
        width = 200,
        height = 0
    }
    return display.newText(titleOption)
end

function setUpNeedBar(fileName)
	local options = {
	    width = 64,
	    height = 64,
	    numFrames = 6,
	    sheetContentWidth = 384,
	    sheetContentHeight = 64
	}
	local progressSheet = graphics.newImageSheet( fileName, options )

	return widget.newProgressView(
	    {
	        sheet = progressSheet,
	        fillOuterMiddleFrame = 2,
	        fillOuterWidth = 0,
	        fillOuterHeight = 10,
	        fillInnerMiddleFrame = 5,
	        fillWidth = 0,
	        fillHeight = 10,
	        left = display.contentCenterX - 50,
	        top = 50,
	        width = 100,
	        isAnimated = true
	    }
	)
end

-- =================
local feedIcon 
-- =================

function setUpIcons()
	feedIcon = display.newImage("tmpIcon.png", getTama().x, getTama().y)
	feedIcon:scale(0.05, 0.05)
	feedIcon.alpha = 0
end

function getFeedIcon()
	return feedIcon
end

function hideShowIcons(tama)
	icons = {feedIcon}
    xAxis = {75}
    yAxis = {75}

    if icons[1].alpha == 0 then
    	print("Show")
        for i = 1, 1 do
            transition.to(icons[i], 
                {x = tama.x + xAxis[i], y = tama.y - yAxis[i],
                alpha = 1, time = 250})
        end
    else
    	print("Hide")
        for i = 1, 1 do
            transition.to(icons[i], 
                {x = tama.x, y = tama.y,
                alpha = 0, time = 250})
        end 
    end     
end

function feed()
    setTamaSequence("happy")
    timer.performWithDelay(1600, setSequenceNormal) -- reset animation to default
    hideShowIcons(getTama())
end