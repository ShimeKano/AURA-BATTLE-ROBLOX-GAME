--!strict

local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")

local Config = require(game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Config"))

local PlayerDataService = {}
local cache: {[Player]: {Aura: number}} = {}
local store = DataStoreService:GetDataStore("AURA_BATTLE_PlayerData_v1")

local function keyFor(player: Player): string
	return "player_" .. player.UserId
end

local function defaultData(): {Aura: number}
	return {
		Aura = Config.Player.StartingAura,
	}
end

function PlayerDataService:Load(player: Player): {Aura: number}
	local data = defaultData()

	local success, result = pcall(function()
		return store:GetAsync(keyFor(player))
	end)

	if success and type(result) == "table" and type(result.Aura) == "number" then
		data.Aura = math.max(Config.Aura.Minimum, math.floor(result.Aura))
	elseif not success then
		warn(string.format("[AURA BATTLE] DataStore load failed for %s; using session data", player.Name))
	end

	cache[player] = data
	return data
end

function PlayerDataService:Get(player: Player): {Aura: number}?
	return cache[player]
end

function PlayerDataService:Save(player: Player): boolean
	local data = cache[player]
	if not data then
		return true
	end

	local success, err = pcall(function()
		store:UpdateAsync(keyFor(player), function()
			return {
				Aura = math.max(Config.Aura.Minimum, math.floor(data.Aura)),
			}
		end)
	end)

	if not success then
		warn(string.format("[AURA BATTLE] DataStore save failed for %s: %s", player.Name, tostring(err)))
	end

	return success
end

function PlayerDataService:Unload(player: Player)
	cache[player] = nil
end

function PlayerDataService:Init()
	Players.PlayerAdded:Connect(function(player)
		self:Load(player)
	end)

	Players.PlayerRemoving:Connect(function(player)
		self:Save(player)
		self:Unload(player)
	end)

	for _, player in Players:GetPlayers() do
		task.spawn(function()
			self:Load(player)
		end)
	end

	game:BindToClose(function()
		for _, player in Players:GetPlayers() do
			self:Save(player)
		end
	end)
end

return PlayerDataService
