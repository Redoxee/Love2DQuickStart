WindowSize = {800,800} 

love.load = function()
	love.window.setMode(WindowSize[1], WindowSize[2])
end
posX = 400
posY = 400
side = 20

time = 0

love.update = function(dt)
	time = time + dt
	posX = 400 + math.sin(time) * 125	
	--posY = 400 + math.cos(time) * 125	
end

love.draw = function()
	love.graphics.clear()
	love.graphics.setColor(128,255,64)

	love.graphics.rectangle("fill",posX - side / 2,posY - side /2,side,side)
end