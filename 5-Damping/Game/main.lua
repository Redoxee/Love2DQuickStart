WindowSize = {800,800} 

love.load = function()
	love.window.setMode(WindowSize[1], WindowSize[2])
end

getCameraPosition = function(px,py)
	return px, py*-1+WindowSize[2]
end

damping = function(f,p,t,dt)
    return p + ((t - p) / f * dt)
end

posX = 400
posY = 400
side = 20

love.update = function(dt)
	if love.keyboard.isDown("escape") then
  		love.event.push('quit')
	end

	local mouseX,mouseY = getCameraPosition(love.mouse.getX(),love.mouse.getY())
	posX = damping(.75,posX,mouseX,dt)
	posY = damping(.75,posY,mouseY,dt)
end

love.draw = function()
	love.graphics.clear()
	love.graphics.setColor(128,255,64)
	
	local px,py = getCameraPosition(posX,posY)

	love.graphics.rectangle("fill",px - side / 2,py - side /2,side,side)
end