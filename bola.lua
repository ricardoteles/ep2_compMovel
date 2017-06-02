bola = {}

function bola.load()
	objetos.bola = {}
	objetos.bola.body = love.physics.newBody(world, 0.5 * love.graphics.getWidth(), 0.7 * love.graphics.getHeight(), "dynamic")
	objetos.bola.shape = love.physics.newCircleShape(5) 
	objetos.bola.fixture = love.physics.newFixture(objetos.bola.body, objetos.bola.shape, 1)
	objetos.bola.fixture:setRestitution(1)
	objetos.bola.fixture:setUserData("Bola")

	speed = 200
	objetos.bola.body:setLinearVelocity( speed*math.sin(math.pi/8), speed*math.abs(math.cos(math.pi/8)) )

end

function bola.update(dt)
  -- impede que a bola saia da tela
  if objetos.bola.body:getY() > 595 then
	objetos.bola.body:setPosition(objetos.bola.body:getX(), 595)
  	objetos.bola.body:setLinearVelocity(0,0)
  end

  -- reseta a posicao da bola
  if love.keyboard.isDown("r") then
  	resetGame()
  end
	
end

function bola.draw()
	love.graphics.setColor(255, 255, 0)
	love.graphics.circle("fill", objetos.bola.body:getX(), objetos.bola.body:getY(), objetos.bola.shape:getRadius())
end

function resetGame()
    objetos.bola.body:setPosition(0.5 * love.graphics.getWidth(), 0.7 * love.graphics.getHeight())
    objetos.bola.body:setLinearVelocity(speed*math.sin(math.pi/8), speed*math.abs(math.cos(math.pi/8)))
end