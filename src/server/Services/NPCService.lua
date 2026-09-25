--!strict

local AuraService = require(script.Parent:WaitForChild("AuraService"))
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Config = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Config"))

local NPCService = {}

function NPCService:RewardPlayer(player: Player, amount: number?): number
	local reward = amount or Config.NPC.DefaultReward
	return AuraService:Add(player, reward)
end

return NPCService
