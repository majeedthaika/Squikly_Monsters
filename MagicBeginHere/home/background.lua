function setUpBackground(fileName) 
    -- Set Background
    -- local background = display.newImage("background.png", display.contentCenterX, display.contentCenterY)
    local backgroundOption = {
        width = 500,
        height = 243,
        numFrames = 8,

        sheetContentWidth = 4000,
        sheetContentHeight = 243,

    }
    local backgroundSheet = graphics.newImageSheet(fileName, backgroundOption)
    local backgroundSequence = {
        start = 1,
        count = 8,
        time = 1400,
        loopcount = 0,
        loopdirection = "forward"
    }
    background = display.newSprite(backgroundSheet, backgroundSequence)
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    background:play()
    return background
end