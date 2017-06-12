require('pontuacao')

menu = {}

function menu.load()

end

function menu.draw()
	love.graphics.setBackgroundColor(5,70,110)
	love.graphics.setColor(255,255,0)
	-- love.graphics.rectangle("fill", 0, 0, 600, 800)

	text       = "Fim de Jogo!!!\n\n"
	text       = text.."Maior score: "..maiorScore
	-- love.graphics.print(text, 300, 400)
end