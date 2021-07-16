local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Typing = false
local KillAllKey = Enum.KeyCode.E

UserInputService.TextBoxFocused:Connect(function()
    Typing = true
end)

UserInputService.TextBoxFocusReleased:Connect(function()
    Typing = false
end)

UserInputService.InputBegan:Connect(function(Input)
	if Input.KeyCode == KillAllKey and Typing == false then
		for _, v in next, Players:GetPlayers() do
			if v.Name ~= Players.LocalPlayer.Name then
				if v.TeamColor ~= Players.LocalPlayer.TeamColor then
					if v.Character ~= nil and v.Character.Humanoid.Health ~= 0 then
						local Arguments = {
							PartHit = workspace[v.Name].HeadHB, -- Part that the bullet hit.
							HitPos = workspace[v.Name].HeadHB.Position, -- 3D Position of where the bullet hit.
							WeaponName = "AWP", -- Change to a weapon (must be valid) if you want. I use AWP because it deals the most damage.
							Number = 4096,
							GunInstance = nil,
							Nothing = nil,
							Nothing2 = nil,
							Number2 = 1,
							Boolean = false,
							Headshot = true, -- Whether or not the shot was a headshot.
							VectorPosition = Vector3.new(0, 0, 0), -- Where the bullet comes from.
							Number3 = 41022,
							Normal = Vector3.new(0, 0, 0) -- The bullet mark's orientation (Third argument of a raycast).
						}

						for i = 1, 5 do
							game:GetService("ReplicatedStorage").Events.HitPart:FireServer(unpack(Arguments))
						end
					end
				end
			end
		end
	end
end)
