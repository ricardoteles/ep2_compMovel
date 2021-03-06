require("pontuacao")
require("menu")

bola = {}

function bola.load()
	objetos.bola = {}
	objetos.bola.body = love.physics.newBody(world, 0.5 * love.graphics.getWidth(), (0.9 * love.graphics.getHeight())-10, "dynamic")
	objetos.bola.shape = love.physics.newCircleShape(5) 
	objetos.bola.fixture = love.physics.newFixture(objetos.bola.body, objetos.bola.shape, 1)
	objetos.bola.fixture:setRestitution(1)
	objetos.bola.fixture:setUserData("Bola")

	speed = 200
	objetos.bola.body:setLinearVelocity( speed*math.sin(math.pi/8), (-1)*speed*math.abs(math.cos(math.pi/8)) )

end

function bola.update(dt)
  -- detecta se a bola bateu na parte inferior
  if objetos.bola.body:getY() > 595 then
  	fimDeJogo()
  end

  

  -- evita que a bola fique muito rapida
  velX, velY = objetos.bola.body:getLinearVelocity()
  
  if velX > 200 then 
	objetos.bola.body:setLinearVelocity( speed*math.sin(math.pi/8), velY)
  end
  if velY > 200 then
	objetos.bola.body:setLinearVelocity( velX, speed*math.abs(math.cos(math.pi/8)) )
  elseif velY > 0 and velY < 50 then
	objetos.bola.body:setLinearVelocity( velX, speed*math.abs(math.cos(math.pi/8)) )
  end 

end

function bola.draw()
	love.graphics.setColor(255, 255, 0)
	love.graphics.circle("fill", objetos.bola.body:getX(), objetos.bola.body:getY(), objetos.bola.shape:getRadius())
end

function resetGame()
    objetos.bola.body:setPosition(0.5 * love.graphics.getWidth(), (0.9 * love.graphics.getHeight())-10)
    objetos.bola.body:setLinearVelocity(speed*math.sin(math.pi/8), (-1)*speed*math.abs(math.cos(math.pi/8)))
end

function fimDeJogo()
	fim = true
 	atualizaPontuacaoEmCache()
	menu.draw()
end