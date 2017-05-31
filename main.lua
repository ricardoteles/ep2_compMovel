require("pa")
require("cenario")
require("bola")
score = 0

function love.load()
	-- love.graphics.setBackgroundColor(5,70,110)
    cenario.load()
    pa.load()
    bola.load()
  
end

function love.update(dt)
	pa.update(dt)
	bola.update(dt)
   
end

function love.keypressed(key, unicode)
	 if key == "a" then
		score = score + 10	
	end
end

function love.draw()
    height = love.graphics.getHeight()
	width = love.graphics.getWidth()

    cenario.draw()
    pa.draw()
    bola.draw()
end