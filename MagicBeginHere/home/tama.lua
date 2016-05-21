-- ===============
local tama
-- ===============

function setUpTama(fileName)
	-- Set Tamagotchi
	local options = {
    width = 300,
    height = 300,
    numFrames = 16,

    sheetContentWidth = 2400,
    sheetContentHeight = 600,

	}
    local imageSheet = graphics.newImageSheet(fileName, options)

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

    tama = display.newSprite(imageSheet, sequence)
    tama.x = display.contentCenterX
    tama.y = 225
    tama:scale(0.5, 0.5)
    tama:play()

    return tama
end

function getTama()
    return tama
end

function setTamaSequence(sequence)
    tama:setSequence(sequence)
    tama:play()
end

function setSequenceNormal(event)
    tama:setSequence("normal")
    tama:play()
end