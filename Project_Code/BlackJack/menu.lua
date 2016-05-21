-----------------------------------------------------------------------------------------
--
-- menu.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "widget" library
local widget = require "widget"

--------------------------------------------

-- forward declarations and other locals
-- None

function gotobetpage(event)
	if ( event.phase == "began" ) then
        moved = false
    elseif ( event.phase == "moved" ) then
        moved = true
    else
    	if ( moved == false ) then
    		-- go to betpage.lua scene
			local options = {
			effect = "fade",
			time = 500,
			params = {bankAmount=1000000, betAmount=0} -- CHANGE THIS
			}
			composer.gotoScene( "betpage", options )
    	end
    end
    return true
end

function scene:create( event )
	local sceneGroup = self.view

	composer.removeScene( "betpage" )
	composer.removeScene( "bjtable" )

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	-- display a background image
	local background = display.newImageRect( "BJHomeOutline.png", display.contentWidth, display.contentHeight )
	background.anchorX = 0
	background.anchorY = 0
	background.x, background.y = -5, 15
	
	-- create/position logo/title image on upper-half of the screen
	-- local titleLogo = display.newImageRect( "logo.png", 264, 42 )
	-- titleLogo.x = display.contentWidth * 0.5
	-- titleLogo.y = 100
	
	local roundedRect1 = display.newRoundedRect( 409, 96, 111, 55, 15 )
	roundedRect1:setFillColor( 255/255, 255/255, 255/255, 0/255 )
	roundedRect1.isHitTestable = true
	
	-- all display objects must be inserted into group
	roundedRect1:addEventListener('touch',gotobetpage)
	-- all display objects must be inserted into group
	sceneGroup:insert( background )
	sceneGroup:insert( roundedRect1 )
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
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