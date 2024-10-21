local module = require(game.ReplicatedStorage.Questions)

script.Parent.MouseClick:Connect(function(player)

	module.nextQuestion(player)

end)

