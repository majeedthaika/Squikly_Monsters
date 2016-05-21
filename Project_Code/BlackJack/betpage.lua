-----------------------------------------------------------------------------------------
--
-- betpage.lua
--
-----------------------------------------------------------------------------------------
-- Require the widget library
local widget = require( "widget" )

local composer = require( "composer" )
local scene = composer.newScene()

--------------------------------------------
-- Global Variables
local bankAmount = 100000; -- the players money (TEST VAL! CHANGEME)
local betAmount; -- how much the player is betting

--------------------------------------------

-- forward declarations and other locals
local playnowbutton; -- Play now action button
local menupagebutton; -- Menu page action button
local pickerWheel -- Drop down menu
local values -- Value of the picker wheel
local bankText -- Text displaying bank balance
local betLimits={ 1,3,10,30,100,300,1000,3000,10000,30000,100000,300000,1000000,3000000,10000000 }

function playnow(event)
	if ( event.phase == "began" ) then
        moved = false
    elseif ( event.phase == "moved" ) then
        moved = true
    else
    	if ( moved == false ) then
    		-- Get the table of current values for all columns
    		values = pickerWheel:getValues()

    		-- Get the value for each column in the wheel (by column index)
    		local betAmount = values[1].value
	
			if ((betAmount*2) <= bankAmount) then
				bankAmount = bankAmount - betAmount
				-- go to bjtable.lua scene
				local options = {
				effect = "fade",
				time = 500,
				params = {bankAmount=bankAmount,  betAmount=betAmount}
				}
				composer.gotoScene( "bjtable", options )
			else
				betText.text = "Invalid, Try again:"
			    betText.fontSize = 30
			    betText:setTextColor(1,0.2,0.2)
			end
    	end
    end
    return true
end

function menupage(event)
	if ( event.phase ~= "began" ) then
		-- go to menu.lua scene
		local options = {
		effect = "fade",
		time = 500,
		params = {bankAmount=bankVal}
		}
		composer.gotoScene( "menu", options )
    end
    return true
end

function scene:create( event )
	local sceneGroup = self.view

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	-- display a background image
	local background = display.newImageRect( "Table_Green_banner.jpg", display.contentWidth, display.contentHeight )
	background.anchorX = 0
	background.anchorY = 0
	background.x, background.y = 0, 0

	-- display Text header
	local options = {
	    text = "Bet Amount:", -- supports up to 11 digits   
	    x = display.contentCenterX,
	    y = 30,
	    width = 300,
	    font = native.systemFontBold,   
	    fontSize = 30,
	    align = "center"  --new alignment parameter
	}
	betText = display.newText(options);
    betText:setTextColor(1,1,1)

	-- Configure the picker wheel columns
	local columnData = {
	    -- Bet Amount
	    { 
	        align = "center",
	        width = 270,
	        startIndex = 7,
	        labels = betLimits,
	        fontSize = 30,
	    },
	}

	-- Image sheet options and declaration
	local options = {
	    frames = 
	    {
	        { x=0, y=0, width=320, height=222 },
	        { x=320, y=0, width=320, height=222 },
	        { x=640, y=0, width=8, height=222 }
	    },
	    sheetContentWidth = 648,
	    sheetContentHeight = 222
	}
	local pickerWheelSheet = graphics.newImageSheet( "widget-pickerwheel-standard.png", options )

	-- Create the widget
	pickerWheel = widget.newPickerWheel(
	    {
	        columns = columnData,
	        sheet = pickerWheelSheet,
	        overlayFrame = 1,
	        overlayFrameWidth = 320,
	        overlayFrameHeight = 222,
	        backgroundFrame = 2,
	        backgroundFrameWidth = 320,
	        backgroundFrameHeight = 222,
	        columnColor = { 0, 0, 0, 0 },
	        fontColor = { 1, 1, 1, 0.5 },
	        fontColorSelected = { 0.2, 0.6, 0.4 }
	    }
	)
	pickerWheel.x, pickerWheel.y = display.contentCenterX, display.contentCenterY

	local options = {
	    text = "Balance: $", -- supports up to 11 digits      
	    x = 100,
	    y = 30,
	    width = 150,
	    font = native.systemFontBold,   
	    fontSize = 18,
	    align = "left"  --new alignment parameter
	}
	bankText = display.newText(options);
    bankText:setTextColor(0,0,0)

	playnowbutton = widget.newButton{
		defaultFile = "PlayNow.png",
		overFile = "PlayNowOver.png",
	}
	playnowbutton.x, playnowbutton.y = display.contentCenterX-80, display.contentCenterY+135

	menupagebutton = widget.newButton{
		defaultFile = "MainMenu.png",
		overFile = "MainMenuOver.png",
	}
	menupagebutton.x, menupagebutton.y = display.contentCenterX+75, display.contentCenterY+135

	-- for all button touch events
	playnowbutton:addEventListener('touch',playnow)
	menupagebutton:addEventListener('touch',menupage)

	-- all display objects must be inserted into group
	sceneGroup:insert( background )
	sceneGroup:insert( playnowbutton )
	sceneGroup:insert( menupagebutton )
	sceneGroup:insert( betText )
	sceneGroup:insert( bankText )
	sceneGroup:insert( pickerWheel )
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	

	-- Get params from other scenes
	if phase == "will" then
		bankAmount = event.params.bankAmount

		bankText.text = "Balance: $"..bankAmount
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then

		composer.removeScene( "bjtable" )
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end	
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene 