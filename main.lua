pancake =  require "pancake"
function love.load()
	pancake.init({window = {pixelSize = love.graphics.getHeight()/64}})
	player = pancake.addObject({x = 29, y = 30, width = 6, height = 11, name = "dexter", colliding = true, offsetX = -5, offsetY = -2})
	pancake.addAnimation("dexter", "idle", "images/animations", 150)
	pancake.addAnimation("dexter", "run", "images/animations", 100)
	pancake.addImage("ground","images")
	pancake.addImage("grass","images")
	pancake.addImage("box","images")
	pancake.changeAnimation(player, "idle")
	createPlatform(16, 56)
	pancake.applyPhysics(player)
	pancake.addImage("right", "images")
	pancake.addImage("right_clicked", "images")
	right = pancake.addButton({name = "right", x = 18*pancake.window.pixelSize, y = love.graphics.getHeight() - 16*pancake.window.pixelSize, width = 14, height = 14, key = "d", scale = pancake.window.pixelSize})

	pancake.addImage("left", "images")
	pancake.addImage("left_clicked", "images")
	left = pancake.addButton({name = "left", x = 2*pancake.window.pixelSize, y = love.graphics.getHeight() - 16*pancake.window.pixelSize, width = 14, height = 14, key = "a", scale = pancake.window.pixelSize})

	pancake.addImage("jump", "images")
	pancake.addImage("jump_clicked", "images")
	jump = pancake.addButton({name = "jump", x = love.graphics.getWidth() - 16*pancake.window.pixelSize, y = love.graphics.getHeight() - 16*pancake.window.pixelSize, width = 14, height = 14, key = "w", scale = pancake.window.pixelSize})
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
	if pancake.isButtonClicked(right) and pancake.facing(player).down then
		pancake.applyForce(player, {x = 200, y = 0, relativeToMass = true})
		pancake.changeAnimation(player, "run")
		player.flippedX = false
	end
	if pancake.isButtonClicked(left) and pancake.facing(player).down then
		pancake.applyForce(player, {x = -200, y = 0, relativeToMass = true})
		pancake.changeAnimation(player, "run")
		player.flippedX = true
	end
	if not pancake.isButtonClicked(right) and not pancake.isButtonClicked(left) then
		if pancake.facing(player).down then

			if player.velocityX == 0 then
				pancake.changeAnimation(player, "idle")
			else
				player.image = "dexter_idle1"
				player.animation = nil
			end
		else
			player.image = "dexter_run3"
			player.animation = nil
		end
	end
	if pancake.isButtonClicked(jump) and pancake.facing(player).down then
		pancake.applyForce(player, {x = 0, y = -70, relativeToMass = true}, 1)
		player.image = "dexter_run3"
		player.animation = nil
	end
end

function love.mousepressed(x,y,button)
	pancake.mousepressed(x,y,button) -- Passing your presses to pancake!
end
