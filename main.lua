require("pa")
require("cenario")
require("bola")
require("audio")


world = love.physics.newWorld(0, 0, true)
objetos = {}
pause = false

function love.load()
    text       = ""

	-- love.graphics.setBackgroundColor(5,70,110)
	world:setCallbacks(beginContact, endContact, preSolve, postSolve)
		
    audio.load()
    cenario.load()
    bola.load()
    pa.load()
    menu.load()
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

	local bBody = b:getBody()
	local aBody = a:getBody()
    local bVelX, bVelY = bBody:getLinearVelocity()

    -- -- apenas para teste
	-- x, y = bBody:getLinearVelocity()
	-- print ("Velx "..b:getUserData().." : ".. x)
	-- print ("Vely "..b:getUserData().." : ".. y.."\n")

	bBody:applyAngularImpulse(10*math.random(-10,10))
end
 
function endContact(a, b, coll)
	if a:getUserData() == "Tijolo" then
	    a:setUserData("Bateu")
		score = score + 10
	end 
end

-- function preSolve(a, b, coll)
 
-- end
 
-- function postSolve(a, b, coll, normalimpulse, tangentimpulse)
 
-- endContact