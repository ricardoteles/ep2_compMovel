require('pontuacao')

menu = {}

function menu.load()

end

function menu.draw()
	love.graphics.setBackgroundColor(5,70,110)
	-- love.graphics.setColor(5,70,110)
	-- love.graphics.rectangle("fill", 0, 0, 600, 800)

	text       = "Maior score: "..maiorScore
	love.graphics.print(text, 300, 400)
end