audio = {}

function audio.load()
		-- som das colisoes
	love.audio.setVolume(0.1)
	toc = love.audio.newSource("sounds/blop.wav", "static") 
	explosao = love.audio.newSource("sounds/Explosao.mp3", "static") 

	-- -- som de fundo
	-- sound = love.audio.newSource("sounds/demons.mp3")
	-- love.audio.setVolume(0.1)
	-- love.audio.play(sound)
end