pa = {}

function pa.load()
	objetos.pa = {}
	objetos.pa.body = love.physics.newBody(world, 0.5 * love.graphics.getWidth(), 0.9 * love.graphics.getHeight())
	objetos.pa.shape = love.physics.newRectangleShape(50, 10)
	objetos.pa.fixture = love.physics.newFixture(objetos.pa.body, objetos.pa.shape)
	objetos.pa.speed = 300
	objetos.pa.fixture:setUserData("Pa")

end

function pa.update(dt)
	-- movimentacao horizontal da pa
    if love.keyboard.isDown("left") then
	    objetos.pa.body:setPosition(objetos.pa.body:getX() - objetos.pa.speed*dt, objetos.pa.body:getY())
	elseif love.keyboard.isDown("right") then
		objetos.pa.body:setPosition(objetos.pa.body:getX() + objetos.pa.speed*dt, objetos.pa.body:getY())
	end

	-- impede que a pa saia da tela
	if objetos.pa.body:getX() < 37 then
		objetos.pa.body:setPosition(37, objetos.pa.body:getY())
	elseif objetos.pa.body:getX() > (love.graphics.getWidth() - 45) then
  		objetos.pa.body:setPosition((love.graphics.getWidth() - 45), objetos.pa.body:getY())
  	end
end

function pa.draw()
	love.graphics.setColor(255, 0, 0)
  	love.graphics.polygon("fill", objetos.pa.body:getWorldPoints(objetos.pa.shape:getPoints()))
end