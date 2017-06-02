pontuacao = {}
score = 0
maiorScore = 0

function pontuacao.draw()
    love.graphics.setColor(255,255,0,255)
    love.graphics.setNewFont(20)
    love.graphics.print("Score: "..score, 600, 20)
end

function atualizaPontuacaoEmCache()
	if love.filesystem.exists("teste.txt") then
		maiorScore = love.filesystem.read("teste.txt")
	end
	
	if score > tonumber(maiorScore) then
		file = love.filesystem.write("teste.txt", score)
		maiorScore = score
	end
	print("maiorScore: "..maiorScore)
	print("scoreAtual: "..score)

	pause = true
end