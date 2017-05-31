pontuacao = {}

function pontuacao.draw()
    love.graphics.setColor(255,255,0,255)
    love.graphics.setNewFont(20)
    love.graphics.print("Score: "..score, 600, 20)

    love.graphics.print("Bolas: ", 20, 20)
    love.graphics.circle("fill", 100 , 32 , 5)
    love.graphics.circle("fill", 115 , 32 , 5)
    love.graphics.circle("fill", 130 , 32 , 5)
end