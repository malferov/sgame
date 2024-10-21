function explode()
	local e = Instance.new("Explosion", workspace)
	e.Position = game.Players.LocalPlayer:GetMouse().Hit.Position
end

script.Parent.Activated:Connect(explode)
