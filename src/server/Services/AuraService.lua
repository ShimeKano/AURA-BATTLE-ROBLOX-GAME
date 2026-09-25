--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Config = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Config"))
local PlayerDataService = require(script.Parent:WaitForChild("PlayerDataService"))

local AuraService = {}

function AuraService:Get(player: Player): number
	local data = PlayerDataService:Get(player)
	return data and data.Aura or Config.Player.StartingAura
end

function AuraService:Set(player: Player, amount: number): number
	local data = PlayerDataService:Get(player)
	if not data or typeof(amount) ~= "number" then
		return self:Get(player)
	end

	data.Aura = math.max(Config.Aura.Minimum, math.floor(amount))
	return data.Aura
end

function AuraService:Add(player: Player, amount: number): number
	if typeof(amount) ~= "number" or amount <= 0 then
		return self:Get(player)
	end

	return self:Set(player, self:Get(player) + math.floor(amount))
end

function AuraService:Remove(player: Player, amount: number): number
	if typeof(amount) ~= "number" or amount <= 0 then
		return self:Get(player)
	end

	return self:Set(player, self:Get(player) - math.floor(amount))
end

return AuraService
