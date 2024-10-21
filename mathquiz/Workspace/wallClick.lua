
local sound = game.SoundService

local button = workspace.Q.button
local bX = button.Position.X
local bY = button.Position.Y
local bZ = button.Position.Z

local wall = workspace.Q.wall
local wX = wall.Position.X
local wY = wall.Position.Y
local wZ = wall.Position.Z

button.ClickDetector.MouseClick:Connect(function(player)
	
	local module = require(game.ReplicatedStorage.LeaderstatsCheck)

	-- at least 5 Points is needed for the next level
	local c = module.check(player, 5) 
	--print(c)

	if c then

		-- move the button
		for i = bZ, bZ - 2, -0.2 do
			button.Position = Vector3.new(bX,bY,i)
			wait(0.01)
		end
		wait(1)
		button:Destroy()

		-- move the wall
		sound.move:Play()
		for i = wY, wY + 10, 0.3 do
			wall.Position = Vector3.new(wX,i,wZ)
			wait(0.1)
		end
		for i = 0, 1, 0.1  do
			wall.Transparency = i
			wait(0.1)
		end
		wall:Destroy()
		game.ReplicatedStorage.SpawnLocation2.Parent = workspace
	else
		-- message to player (:
		game.StarterGui:SetCore("SendNotification", {
			Title = "Message",
			Text = "Solve more quizzes",
			Duration = 2
		})
		sound.noaccess:Play()
	end	
end)