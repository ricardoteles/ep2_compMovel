require("pa")
require("cenario")
require("bola")
require("pontuacao")
score = 0

world = love.physics.newWorld(0, 0, true)
objetos = {}

function love.load()
	pause = false
    text       = ""
	
	-- som das colisoes
	toc = love.audio.newSource("sounds/blop.wav", "static") 

	-- som de fundo
	sound = love.audio.newSource("sounds/demons.mp3")
	love.audio.setVolume(0.1)
	love.audio.play(sound)
	
	
	-- love.graphics.setBackgroundColor(5,70,110)
	world:setCallbacks(beginContact, endContact, preSolve, postSolve)
    cenario.load()
    bola.load()
    pa.load()
end

function love.update(dt)
	if pause == false then
		world:update(dt)

		bola.update(dt)
		pa.update(dt)
		removeTijolos()
	end   
end

function love.keypressed(key, unicode)
	if key == "p" and pause == false then
		pause = true
		text = "O jogo está pausado"
	elseif key == "p" and pause == true then
		pause = false
		text = ""
	elseif key == 'escape' then
      love.event.push('quit')
	end
end

function love.draw()
    cenario.draw()
    bola.draw()
    pa.draw()
    pontuacao.draw()

    love.graphics.print(text, 300, 400) -- test
end

function beginContact(a, b, coll)
	toc:play()
end
 
function endContact(a, b, coll)
	if a:getUserData() == "Tijolo" then
	    a:setUserData("Bateu")
		score = score + 10
	end 
end

function removeTijolos()
  for i,v in ipairs(tijolos) do
    if v.fixture:getUserData() == "Bateu" then
      v.body:destroy()
      table.remove(tijolos,i)
    end
  end
end

-- function preSolve(a, b, coll)
 
-- end
 
-- function postSolve(a, b, coll, normalimpulse, tangentimpulse)
 
-- end