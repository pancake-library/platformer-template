pancake =  require "pancake"
function love.load()
	pancake.init({window = {pixelSize = love.graphics.getHeight()/64}}) --Initiating pancake and setting pixelSize, so that the pancake display will be the height of the window! pixelSize is how many pixels every pancake pixel should take
	--First, we have to load all images and animations that are going to be used!
	pancake.addAnimation("dexter", "run", "images/animations", 100) --object name, animation name, folder where the animation is and time between frames
	pancake.addAnimation("dexter", "idle", "images/animations", 100)
	pancake.addImage("ground","images")
	pancake.addImage("grass","images")
	pancake.addImage("box","images")
	--That's all for the images! Now, we have to set up our in game objects such as player, platforms and background grass!
	player = pancake.applyPhysics(pancake.addObject({x = 0, y = 20, width = 6, height = 11, name = "dexter", colliding = true, offsetX = -5, offsetY = -2})) --Remember to set name to dexter, so that this object will find its animation
	pancake.cameraFollow = player --This tells pancake that camera should follow movement of the player. Otherwise, it would stay still. You can try it out too by deleting this line! ;)
	pancake.changeAnimation(player, "idle")
	createPlatform(0, 50)
	createPlatform(20, 35)

	pancake.debugMode = true
end

--Create a function to create a platform!
function createPlatform(x,y)
	for i = 0, 3 do
		pancake.addObject({x = x + i*8, y = y, image = "ground", colliding = true, width = 8, height = 8})
	end
end

function pancake.onCollision() --This function will be called whenever a physic object collides with a colliding object!
	--Insert your amazing code here!
end

function pancake.onLoad() -- This function will be called when pancake start up is done (after the animation)
	--Insert your amazing code here!
end

function pancake.onOverlap(object1, object2, dt) -- This function will be called every time object "collides" with a non colliding object! Parameters: object1, object2 - objects of collision, dt - time of collision
	--Insert your amazing code here!
end

function love.draw()
	pancake.draw() --Sets the canvas right! If pancake.autoDraw is set to true (which is its default state) the canvas will be automatically drawn on the window x and y
end

function love.update(dt)
	pancake.update(dt) --Passing time between frames to pancake!
end

function love.mousepressed(x,y,button)
	pancake.mousepressed(x,y,button) -- Passing your presses to pancake!
end
