level3 = {}
tijolos = {}

function level3.load()
	tijolosRestante = 114
	
	-- Parede
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
		    local tijolo = {}
		    tijolo.width = 40
		    tijolo.height = 20
		    tijolo.x = (i-1) * (tijolo.width + 2) + tijolo.width/2
		    tijolo.y = (j-1) * (tijolo.height + 2) + 100
		    tijolo.magenta = (5-j)*255/4
		    tijolo.amarelo = (j-1)*255/4
		    tijolo.ciano = 255
		    tijolo.body = love.physics.newBody(world, tijolo.x+20, tijolo.y, "static")
        	tijolo.shape = love.physics.newRectangleShape(tijolo.width, tijolo.height)
        	tijolo.fixture = love.physics.newFixture(tijolo.body, tijolo.shape)
			tijolo.fixture:setUserData("Tijolo")
		    
		    if j == 4 and ((i <= 4 or i >= 14) or (i >= 8 and i <= 10)) then
		    	tijolo.magenta = 70
		    	tijolo.amarelo = 70		
		    	tijolo.ciano = 87
				tijolo.fixture:setUserData("Parede")
		    end 

		    table.insert(tijolos, tijolo)

		end
	end
end


function level3.draw()
	-- desenha as Parede
    love.graphics.setColor(125, 125,125,255)
	love.graphics.polygon("fill", objetos.superior.body:getWorldPoints(objetos.superior.shape:getPoints()))
	love.graphics.polygon("fill", objetos.esquerda.body:getWorldPoints(objetos.esquerda.shape:getPoints()))
	love.graphics.polygon("fill", objetos.direita.body:getWorldPoints(objetos.direita.shape:getPoints()))

	-- desenha os tijolos
	for i,v in ipairs(tijolos) do
    	love.graphics.setColor(0, v.magenta,v.amarelo,v.ciano)
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