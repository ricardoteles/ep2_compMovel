require("pa")
require("bola")
require("audio")
require("animacao")

require("level")
require("level1")
require("level2")
require("level3")
require("level4")
require("level5")

world = love.physics.newWorld(0, 0, true)
objetos = {}

pause = true
colisao = false
fim = false
levelAtual = 0
tijolosRestante = 0
tijolosQuebrados = 0

colisaoX,colisaoY = 0, 0
text       = ""

function love.load()
    tempoExplosao = 1

	-- love.graphics.setBackgroundColor(5,70,110)
	loadLevel()
	world:setCallbacks(beginContact, endContact, preSolve, postSolve)
		
    audio.load()
    bola.load()
    pa.load()
    menu.load()
    animacao.load()
end

function love.update(dt)

	if pause == false and fim == false then
		world:update(dt)

		bola.update(dt)
		pa.update(dt)
		removeTijolos()
		animacao.update(dt)
		tempoExplosao = tempoExplosao - dt

		if levelAtual == 4 then
    		level4.update(dt)
    	elseif levelAtual == 5 then
    		level5.update(dt)
    	end
	end
end

function love.keypressed(key, unicode)
	if key == "p" and pause == false and fim == false then
		pause = true
		text = "O jogo está pausado"
	elseif key == "p" and pause == true and fim == false then
		pause = false
		text = ""
	elseif key == 'escape' then	
		love.event.push('quit')
	
	-- reseta a posicao da bola (teste)
  	elseif key == "r" and fim == false then
  		resetGame()
	end
end

function love.draw()
	if fim == false then 
	    drawLevel()
	    bola.draw()
	    pa.draw()
    	pontuacao.draw()
	end

    love.graphics.print(text, 300, 300) -- test

    if colisao == true and (tijolosQuebrados % 15) == 0 then
		animacao.draw(colisaoX, colisaoY)
		explosao:play()

		if tempoExplosao < 0 then
			colisao = false
		end
    end

    if tijolosRestante == 0 then
    	levelAtual = levelAtual + 1
    	inicioLevel()
    end

end

function inicioLevel()
	pause = true
    loadLevel()
    bola.load()
    pa.load()
end

function beginContact(a, b, coll)
	toc:play()

	local bBody = b:getBody()
    local bVelX, bVelY = bBody:getLinearVelocity()

	bBody:applyAngularImpulse(10*math.random(-10,10))
end
 
function endContact(a, b, coll)
	if a:getUserData() == "Tijolo" then
		local aBody = a:getBody()
		colisaoX, colisaoY = aBody:getX()-40, aBody:getY()-40   
	    a:setUserData("Bateu")
		score = score + 10
		colisao = true
		tempoExplosao = 1
		-- explosao:play()
		tijolosRestante = tijolosRestante - 1 
		tijolosQuebrados = tijolosQuebrados + 1
	end
end

function loadLevel()
	if levelAtual == 0 then
		level.load()
		text = "\t\t\tLevel 0!\n"
		text = text.."(Toque na tela para iniciar)"
	elseif levelAtual == 1 then 
		level1.load()
		text = "\t\t\tLevel 1!"
	elseif levelAtual == 2 then 
		text = "\t\t\tLevel 2!"
		level2.load()
	elseif levelAtual == 3 then 
		text = "\t\t\tLevel 3!"
		level3.load()
	elseif levelAtual == 4 then 
		text = "\t\t\tLevel 4!"
		level4.load()
	elseif levelAtual == 5 then 
		text = "Último Level!"
		level5.load()
	end
end

function drawLevel()
	if levelAtual == 0 then
		level.draw()
	elseif levelAtual == 1 then 
		level1.draw()
	elseif levelAtual == 2 then 
		level2.draw()
	elseif levelAtual == 3 then 
		level3.draw()
	elseif levelAtual == 4 then 
		level4.draw()
	elseif levelAtual == 5 then 
		level5.draw()
	end
end

-- function preSolve(a, b, coll)
 
-- end
 
-- function postSolve(a, b, coll, normalimpulse, tangentimpulse)
 
-- endContact