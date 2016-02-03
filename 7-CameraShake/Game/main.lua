WindowSize = {800,800} 

love.load = function()
	love.window.setMode(WindowSize[1], WindowSize[2])
end

getCameraPosition = function(px,py)
	return px + shakeX, py*-1+WindowSize[2] + shakeY
end

shakeTime = false
shakeX,shakeY = 0,0
shakeSpeed = 15
shakeForce = 5
updateCameraShake = function(dt)
	if love.keyboard.isDown(" ") then
		if not shakeTime then 
			shakeTime = 0 
		end	
		shakeTime = shakeTime + dt
		shakeX = math.cos(shakeTime * shakeSpeed * 11) * shakeForce
		shakeY = math.sin(shakeTime * shakeSpeed * 17) * shakeForce
	else
		shakeTime = false
		shakeX,shakeY = 0,0
	end
end

love.update = function(dt)
	if love.keyboard.isDown("escape") then
  		love.event.push('quit')
	end

	updateCameraShake(dt)
end

love.draw = function()
	love.graphics.clear()
	love.graphics.setColor(255,255,255)

	local px,py = getCameraPosition(300, 550)
	love.graphics.circle("fill", px,py, 30)
	px,py = getCameraPosition(500, 550)
	love.graphics.circle("fill", px,py, 30)
	px,py = getCameraPosition(320,400)
	love.graphics.rectangle("fill",px,py,160,40)
end