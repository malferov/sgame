local answerCheck = require(game.ReplicatedStorage.Answers)

function click()
	answerCheck(4)
end

script.Parent.MouseButton1Click:Connect(click)
