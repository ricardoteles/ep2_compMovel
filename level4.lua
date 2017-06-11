level4 = {}
tijolos = {}

sentido = 'dir'

function level4.load()
	tijolosRestante = 75
	
	-- paredes
	objetos.superior = {}
	objetos.superior.body = love.physics.newBody(world, 400, 30)
	objetos.superior.shape = love.physics.newRectangleShape(775, 40)
	objetos.superior.fixture = love.physics.newFixture(objetos.superior.body, objetos.superior.shape)
	objetos.superior.fixture:setUserData("Parede")

	objetos.esquerda = {}
	objetos.esquerda.body = love.physics.newBody(world, 8, 305)
	objetos.esquerda.shape = love.physics.newRectangleShape(8, 590)
	objetos.esquerda.fixture = love.physics.newFixture(objetos.esquerda.body, objetos.esquerda.shape)
	objetos.esquerda.fixture:setUserData("Parede")

	objetos.direita = {}
	objetos.direita.body = love.physics.newBody(world, 784, 305)
	objetos.direita.shape = love.physics.newRectangleShape(8, 590)
	objetos.direita.fixture = love.physics.newFixture(objetos.direita.body, objetos.direita.shape)
	objetos.direita.fixture:setUserData("Parede")

	-- tijolos
	for i=1,18 do
		for j=1,7 do
			if (j % 2 == 1) or (j % 2 == 0 and i == 1)  then
			    local tijolo = {}
			    tijolo.width = 40
			    tijolo.height = 20
			    tijolo.x = (i-1) * (tijolo.width + 2) + tijolo.width/2
			    tijolo.y = (j-1) * (tijolo.height + 2) + 100
			    tijolo.magenta = (5-j)*255/4
			    tijolo.yellow = (j-1)*255/4
			    tijolo.body = love.physics.newBody(world, tijolo.x+20, tijolo.y, "static")
	        	tijolo.shape = love.physics.newRectangleShape(tijolo.width, tijolo.height)
	        	tijolo.fixture = love.physics.newFixture(tijolo.body, tijolo.shape)
				tijolo.fixture:setUserData("Tijolo")
				tijolo.speedX = 0

				if (j % 2 == 0 and i == 1)  then
					tijolo.speedX = 100
				end

			    table.insert(tijolos, tijolo)
			end
		end
	end
end

function level4.update(dt)
	for i,v in ipairs(tijolos) do
		if v.speedX ~= 0 then 
			if v.body:getX() >= 750 and sentido == 'dir' and v.speedX then
			 	sentido = 'esq' 
	 		elseif v.body:getX() <= 50 and sentido == 'esq' then
				sentido = 'dir' 
			end
				 
			-- print(sentido.. " ".. v.body:getX())

			if sentido == 'dir' then
				v.body:setPosition(v.body:getX() + v.speedX*dt, v.body:getY())
			elseif sentido == 'esq' then
				v.body:setPosition(v.body:getX() - v.speedX*dt, v.body:getY())
			end
		end
	end
end


function level4.draw()
	-- desenha as paredes
    love.graphics.setColor(125, 125,125,255)
	love.graphics.polygon("fill", objetos.superior.body:getWorldPoints(objetos.superior.shape:getPoints()))
	love.graphics.polygon("fill", objetos.esquerda.body:getWorldPoints(objetos.esquerda.shape:getPoints()))
	love.graphics.polygon("fill", objetos.direita.body:getWorldPoints(objetos.direita.shape:getPoints()))

	-- desenha os tijolos
	for i,v in ipairs(tijolos) do
    	love.graphics.setColor(0, v.magenta,v.yellow,255)
        love.graphics.polygon("fill", v.body:getWorldPoints(v.shape:getPoints()))
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