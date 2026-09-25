--!strict

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Shared = ReplicatedStorage:WaitForChild("Shared")
local Config = require(Shared:WaitForChild("Config"))
local PlayerDataService = require(script.Parent.Services:WaitForChild("PlayerDataService"))
local AuraService = require(script.Parent.Services:WaitForChild("AuraService"))

print(string.format("[AURA BATTLE] ServerMain started - v%s", Config.Version))

PlayerDataService:Init()

local function setupPlayer(player: Player)
	local data = PlayerDataService:Get(player)
	if not data then
		return
	end

	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local aura = Instance.new("IntValue")
	aura.Name = "Aura"
	aura.Value = AuraService:Get(player)
	aura.Parent = leaderstats

	local function syncAura()
		aura.Value = AuraService:Get(player)
	end

	player:SetAttribute("Aura", aura.Value)
	aura:GetPropertyChangedSignal("Value"):Connect(function()
		player:SetAttribute("Aura", aura.Value)
	end)

	print(string.format("[AURA BATTLE] %s joined with %d Aura", player.Name, aura.Value))

	task.spawn(function()
		while player.Parent do
			task.wait(1)
			syncAura()
		end
	end)
end

Players.PlayerAdded:Connect(setupPlayer)

for _, player in Players:GetPlayers() do
	task.spawn(setupPlayer, player)
end
