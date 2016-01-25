WindowSize = {800,800} 

love.load = function()
	love.window.setMode(WindowSize[1], WindowSize[2])
end

love.update = function(dt)
end

love.draw = function()
	love.graphics.clear()
	love.graphics.setColor(128,255,64)

	love.graphics.rectangle("fill",390,390,20,20)
end