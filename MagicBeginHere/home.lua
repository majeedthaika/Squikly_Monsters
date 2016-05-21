-- Import dependency
local widget = require( "widget" )
local composer = require( "composer" )
local scene = composer.newScene()

require("home.tama")
require("home.background")
require("home.UI")

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called
-- -----------------------------------------------------------------------------------------------------------------

-- Local forward references should go here

-- -------------------------------------------------------------------------------




-- "scene:create()"
function scene:create( event )

    local sceneGroup = self.view

    -- Set title (Will be remove later)
    local title = setUpTitle("Tamagotchi v0.15")

    -- Set background
    --background = setUpBackground("bg.png")

    -- Set Tama 
    local tama = setUpTama("egg.png")

    -- Set up needs
    hunger = setUpNeedBar("widget-progress-view.png")


    -- Set up needs level
    -- TODO: Load from save file
    hunger:setProgress( 1 )


    setUpIcons()
    local feedIcon = getFeedIcon()

    -- Set reaction when touch
    function tama:touch(event)
        if event.phase == "ended" then
            hideShowIcons(tama)
        end
    end

    function feedIcon:touch(event)
        if event.phase == "ended" then
            feed()
            hunger:setProgress(hunger:getProgress() + 0.1)
            return true
        end
    end

    -- Trigger needs
    function needs()
        hunger:setProgress(hunger:getProgress() - 0.1)
    end

    -- Add hunger loop
    timer.performWithDelay(20000, needs, -1)

    -- Add even listener for touch event on tama
    tama:addEventListener("touch", tama)
    feedIcon:addEventListener("touch", feedIcon)

end


-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen)


    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen
        -- Insert code here to make the scene come alive
        -- Example: start timers, begin animation, play audio, etc.


    end
end


-- "scene:hide()"
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen)
        -- Insert code here to "pause" the scene
        -- Example: stop timers, stop animation, stop audio, etc.


    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen


    end
end



-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )

-- -------------------------------------------------------------------------------

return scene