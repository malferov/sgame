local sound = game.SoundService
local player = game.Players.LocalPlayer
local questions = require(game.ReplicatedStorage.Questions)

function wrong()

	local banner = player.PlayerGui.quiz.frame.banner
	local text = banner.Text

	sound.wrong:Play()
	banner.Text = "Wrong!"
	task.wait(2)
	banner.Text = text
end

function right()

	local frame = player.PlayerGui.quiz.frame

	frame.banner.Text = "Well done!!!"
	sound.tada:Play()
	wait(2)

	player.leaderstats.Points.Value += 2
	frame.Visible = false
end

function answerCheck(answer)
	if questions.checkQuestion(player, answer) then
		right()
	else
		wrong()
	end
end

return answerCheck
