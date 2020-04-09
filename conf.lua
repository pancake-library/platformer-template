function love.conf (t)
	t.window.borderless = true -- Remove all border visuals from the window (boolean)
	t.window.resizable = false -- Let the window be user-resizable (boolean)
	t.window.fullscreen = true -- Enable fullscreen (boolean)
	t.window.fullscreentype = "desktop"
end
--[[
Error

pancake.lua:934: stack overflow


Traceback

pancake.lua:934: in function 'isObjectColliding'
pancake.lua:961: in function 'getSurfaceContact'
pancake.lua:613: in function 'getStats'
pancake.lua:525: in function 'getPressure'
pancake.lua:529: in function 'getPressure'
pancake.lua:529: in function 'getPressure'
pancake.lua:529: in function 'getPressure'
pancake.lua:529: in function 'getPressure'
pancake.lua:529: in function 'getPressure'
...
pancake.lua:755: in function 'getCollisionForces'
pancake.lua:716: in function 'collide'
pancake.lua:827: in function 'collideMultiple'
pancake.lua:911: in function 'move'
pancake.lua:501: in function 'updateObjects'
pancake.lua:406: in function 'update'
main.lua:74: in function 'update'
[C]: in function 'xpcall']]--
