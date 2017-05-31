bola = {}

function bola.load()
	bola.raio = 5
	bola.x = 0.5 * love.graphics.getWidth()
	bola.y = 0.7 * love.graphics.getHeight()
	pa.speed = 100
end

function bola.update(dt)
	bola.y = bola.y + (pa.speed*dt)	

	-- Impede a saida da tela
	if bola.y > (love.graphics.getHeight() - 10) then
		bola.y = love.graphics.getHeight() - 10
	end
end

function bola.draw()
	love.graphics.setColor(255, 255, 0)
	love.graphics.circle("fill", bola.x, bola.y, bola.raio)
end