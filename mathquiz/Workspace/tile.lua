local stop = false
script.Parent.Touched:Connect(function(hit)
	if hit.Parent:WaitForChild("Humanoid") then
		if stop == false then
			stop = true
			wait(2)
			for i=0,1,0.1 do
				script.Parent.Transparency=i
				wait(0.1)
			end
			script.Parent.CanCollide = false
			for i=1,0,-0.1 do
				script.Parent.Transparency=i
				wait(0.1)
			end
			script.Parent.CanCollide = true
			stop = false
		end
	end
end)