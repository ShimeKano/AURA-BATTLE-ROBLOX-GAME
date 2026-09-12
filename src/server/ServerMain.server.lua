--!strict

local Players = game:GetService("Players")

print("[AURA BATTLE] ServerMain started")

Players.PlayerAdded:Connect(function(player)
	print(string.format("[AURA BATTLE] Player joined: %s", player.Name))
end)
