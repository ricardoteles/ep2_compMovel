animacao = {}

require('lib/anAL')

function animacao.load()
   local img  = love.graphics.newImage("img/explosion1.png")
   anim = newAnimation(img, 96, 96, 0.1, 0)
end
 
function animacao.update(dt)
   -- Updates the animation. (Enables frame changes)
   anim:update(dt)   
end
 
function animacao.draw(x,y)
   -- Draw the animation at (100, 100).
   anim:draw(x,y) 
end