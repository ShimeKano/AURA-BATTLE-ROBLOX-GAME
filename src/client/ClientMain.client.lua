--!strict

local Players = game:GetService("Players")
local player = Players.LocalPlayer

print("[AURA BATTLE] ClientMain started")

local function readAura()
	local leaderstats = player:FindFirstChild("leaderstats")
	local aura = leaderstats and leaderstats:FindFirstChild("Aura")
	if aura and aura:IsA("IntValue") then
		print(string.format("[AURA BATTLE] Current Aura: %d", aura.Value))
	end
end

player.ChildAdded:Connect(function(child)
	if child.Name == "leaderstats" then
		child.ChildAdded:Connect(readAura)
		readAura()
	end
end)

readAura()
