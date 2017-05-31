cenario = {}

function cenario.load()
	blocks = {}
	for i=1,18 do
		for j=1,5 do
		    local block = {}
		    block.width = 40
		    block.height = 20
		    block.x = (i-1) * (block.width + 2) + block.width/2
		    block.y = (j-1) * (block.height + 2) + 100
		    block.magenta = (5-j)*255/4
		    block.yellow = (j-1)*255/4
		    table.insert(blocks, block)
		end
	end
end


function cenario.draw()
	desenhaParedes()
	desenhaTijolos()
	desenhaScore()
end

function desenhaScore()
    love.graphics.setColor(255,255,0,255)
    love.graphics.setNewFont(20)
    love.graphics.print("Score: "..score, 600, 20)
end

function desenhaTijolos()
	for i,v in ipairs(blocks) do
	    love.graphics.setColor(0, v.magenta,v.yellow,255)
	    love.graphics.rectangle("fill", v.x, v.y, v.width, v.height)
	end
end

function desenhaParedes()
    love.graphics.setColor(125, 125,125,255)
    love.graphics.rectangle("fill", 8, 8, 8, 600)			-- esquerda
    love.graphics.rectangle("fill", 784, 8, 8, 600)			-- direita
    love.graphics.rectangle("fill", 8, 8, 784, 40)			-- cima
end