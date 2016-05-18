display.setStatusBar(display.HiddenStatusBar)
local physics = require "physics"
physics.start()
physics.setGravity(0,0)

-- SETUP GRAPHICS

local background = display.newImage("background.png")
background:scale(4.0,4.0)
background.anchorX = -8
background.anchorY = -5

local happy = display.newImage("happy.png")
happy.x = 100
happy.y = 100
physics.addBody(happy, "dynamic")

local angry = display.newImage("angry.png")
angry.x = 1080
angry.y = 1920
physics.addBody(angry, "static")

local angry2 = display.newImage("angry.png")
angry2.x = 1080
angry2.y = 1920
physics.addBody(angry2, "static")

-- RESPOND TO TOUCH EVENTS 

function touchScreen(event)
	if event.phase == "ended" then
		transition.to(happy,{time=1000, x=event.x, y=event.y})
	end
end

Runtime:addEventListener("touch", touchScreen)

-- CREATE ANGRY MOVEMENT

function moveAngry()
	transition.to(angry,{time=1000, x=math.random(80,880), y=math.random(60,580), onComplete=moveAngry})
	
	transition.to(angry2,{time=1000, x=math.random(80,880), y=math.random(60,580)})
end

moveAngry()

-- RESPOND TO COLLISIONS

function onCollision(event)
	--print("collide!")
	happy:removeSelf()
end

Runtime:addEventListener("collision", onCollision)













