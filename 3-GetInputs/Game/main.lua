WindowSize = {800,800} 

love.load = function()
	love.window.setMode(WindowSize[1], WindowSize[2])
end
posX = 400
posY = 400
side = 20

love.update = function(dt)
	if love.keyboard.isDown("escape") then
  		love.event.push('quit')
	end

	local v = 0
	if love.keyboard.isDown("right") then
		v = 1
	end
	if love.keyboard.isDown("left") then
		v = v - 1
	end

	posX = posX + v * 150 * dt	
end

love.draw = function()
	love.graphics.clear()
	love.graphics.setColor(128,255,64)

	love.graphics.rectangle("fill",posX - side / 2,posY - side /2,side,side)
end