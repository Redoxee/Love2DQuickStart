WindowSize = {800,800} 

love.load = function()
	love.window.setMode(WindowSize[1], WindowSize[2])
end

getCameraPosition = function(px,py)
	return px, py*-1+WindowSize[2]
end

posX = 400
posY = 400
side = 20

velocityY = 0
gravity = -100

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

	velocityY = velocityY + gravity * dt

	if love.keyboard.isDown("up") and (posY == side/2)then
		velocityY = 70
	end

	posY = posY + velocityY * 10 * dt	
	if posY < side/2 then
		posY = side/2
	end
end

love.draw = function()
	love.graphics.clear()
	love.graphics.setColor(128,255,64)
	
	local px,py = getCameraPosition(posX,posY)

	love.graphics.rectangle("fill",px - side / 2,py - side /2,side,side)
end