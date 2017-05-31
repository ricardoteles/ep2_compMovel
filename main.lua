require("pa")
require("cenario")
require("bola")
require("pontuacao")
score = 0

world = love.physics.newWorld(0, 0, true)
objetos = {}

function love.load()
	-- love.graphics.setBackgroundColor(5,70,110)
    cenario.load()
    bola.load()
    pa.load()
end

function love.update(dt)
	world:update(dt)

	bola.update(dt)
	pa.update(dt)
   
end

-- apenas para teste
function love.keypressed(key, unicode)
	 if key == "a" then
		score = score + 10	
	end
end

function love.draw()
	-- height = love.graphics.getHeight()
	-- width = love.graphics.getWidth()
    cenario.draw()
    bola.draw()
    pa.draw()
    pontuacao.draw()
end