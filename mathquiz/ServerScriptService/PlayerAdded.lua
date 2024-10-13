local function onPlayerAdded(player)

	print("A player has entered: " .. player.Name)

	local folder = Instance.new("Folder")
	folder.Name = "leaderstats" --must be that name!
	folder.Parent = player

	local Question = Instance.new("IntValue")
	Question.Name = "Question"
	Question.Parent = folder

	local Points = Instance.new("IntValue")
	Points.Name = "Points"
	Points.Parent = folder
	--Points.Value = 6
end

game.Players.PlayerAdded:Connect(onPlayerAdded)
