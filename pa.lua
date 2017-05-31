pa = {}

function pa.load()
	pa.width = 50
	pa.height = 10
	pa.x = 0.5 * love.graphics.getWidth()
	pa.y = 0.9 * love.graphics.getHeight()
	pa.speed = 300
end

function pa.update(dt)

	if love.keyboard.isDown("left") then
		pa.x = pa.x - (pa.speed*dt)
	elseif love.keyboard.isDown("right") then
		pa.x = pa.x + (pa.speed*dt)	
	end

	-- Impede a saida da tela
	if pa.x < 16 then
		pa.x = 16
	elseif pa.x > (love.graphics.getWidth() - pa.width - 16) then
		pa.x = love.graphics.getWidth() - pa.width - 16
	end

end

function pa.draw()
	love.graphics.setColor(255, 0, 0)
	love.graphics.rectangle("fill", pa.x, pa.y, pa.width, pa.height)
end