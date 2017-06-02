cenario = {}
tijolos = {}

function cenario.load()
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
		    table.insert(tijolos, tijolo)
		end
	end
end


function cenario.draw()
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