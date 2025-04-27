local Mainfuncs = {}

local wipe = {
	--4185818672;
}

local Revert = {
	--7129257981;
	--8089163919;
	--4407961133;
}

local terribleskills = {
	--[[7129257981;
	8089163919;
	4407961133;
	392709538;]]
}

local kick = {
	--4407961133;
	--4174514982;
}

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local MessagingService = game:GetService("MessagingService")
local TeleportService = game:GetService("TeleportService")
local DataStoreService = game:GetService("DataStoreService")
local TextService = game:GetService("TextService")

local DataManager = require(ServerStorage.Modules.Managers.DataManager)

local RevertData = {}

--[[function Mainfuncs:CharAdded(Player)
	Player.CharacterAdded:Connect(function(char)
		char:SetAttribute("CatDamage", -0.3)
		char:SetAttribute("CatDefense", 1.2)
	end)
end]]

function Mainfuncs:PlayerAdded(Player)
	pcall(function()
		local PlayerId = Player.UserId

		local Key = "Player_".. PlayerId

		if table.find(kick, PlayerId) then
			Player:Kick()
		end

		if PlayerId == 0 then
			DataManager:AddSkill(Player, "Shunko Barrage")
		end

		if table.find(wipe, PlayerId) then
			local s, e = pcall(function()
				Player:Kick()

				DataStoreService:GetDataStore("GameEntitiesFolder3"):SetAsync(Key, {});
			end)

			if not s then 
				--warn(e)
			end
		end

		if table.find(Revert, PlayerId) then
			local s, e = pcall(function()
				RevertData[Key] = DataStoreService:GetDataStore("GameEntitiesFolder3"):GetAsync(Key)

				--print(RevertData[Key])
			end)

			if not s then 
				--warn(e)
			end
		end

		if table.find(terribleskills, PlayerId) then
			local Character
			local s, e =  pcall(function()
				Character = Player.Character
			end)

			if not s then 
				--warn(e)
			end

			Player.CharacterAdded:Connect(function(char)
				char:SetAttribute("CatDamage", -0.5)
				char:SetAttribute("CatDefense", 1.75)
				char:SetAttribute("LessDamageDealt", 0.5)
				char:SetAttribute("MoreDamageTaken", 2)
			end)
			if Character then
				Character:SetAttribute("CatDamage", -0.5)
				Character:SetAttribute("CatDefense", 1.75)
				Character:SetAttribute("LessDamageDealt", 0.5)
				Character:SetAttribute("MoreDamageTaken", 2)	
			end
		end
		task.delay(5, function()
			if Player.UserId == 262503178 then
				DataManager:AddSkill(Player, "Crippling Storm")
				DataManager:AddSkill(Player, "Vanishing Cero")
			end
			if Player.UserId == 40866467 then
				local Profile = DataManager:RequestProfile(Player)
				Profile.ClientData.TrueBankaiTimer = 0
				Profile.ClientData.BankaiRaidCheck = nil
				Profile.ClientData.CurrentBankaiRaidCheck = nil
			end
			if Player.UserId == 8089163919 then
				local Profile = DataManager:RequestProfile(Player)
				Profile.ClientData.TrueBankaiTimer = 0
				Profile.ClientData.BankaiRaidCheck = nil
				Profile.ClientData.CurrentBankaiRaidCheck = nil
			end
		end)
	end)
end

function Mainfuncs:PlayerRemoving(Player)
	pcall(function()
		local PlayerId = Player.UserId

		local Key = "Player_".. PlayerId

		if table.find(Revert, PlayerId) and RevertData[Key] then
			--print(RevertData[Key])
			Player:Kick()

			DataStoreService:GetDataStore("GameEntitiesFolder3"):SetAsync(Key, RevertData[Key]);
		end
	end)
end

local BladeDancerSkills = {
	"Bladerunner";
	"Piercing Slash";
	"Windcutter";
	"Updraft";
	"Reishi Blade";
	"Perfect Guard";
	"Sweeping Slashes";
	"Bubble Breaker";
	"Opening Act";
	"Heaven Piercer";
	"Blitz";
	"Final Dance";
	"FLowing Strikes";
	"Closing Performance";
	"Trick";
	"True Trick";
}

function Mainfuncs:GeneralFunction()
	--[[for i,v in pairs(Players:GetPlayers()) do
		if v.UserId == 409505760 then	
			local Profile = DataManager:RequestProfile(v)
			local Title = Profile.ClientData.Title
			if Title ~= "Seraphic" then
				Profile.ClientData.Title = "Seraphic"
			end
		end
	end]]
	for i,v in pairs(Players:GetPlayers()) do

		if v.UserId == 1384609275 then
			local Profile = DataManager:RequestProfile(v)
			Profile.ClientData.Title = "Seraphic"
		end
		if v.UserId == 40866467 or v.UserId == 8089163919 then
			local Profile = DataManager:RequestProfile(v)
			Profile.SpecsAllowed = true
			Profile.ClientData.TrueBankaiPops = -9e9
			Profile.ClientData.TrueBankaiUnlocked = true
			for _, Skill in pairs(BladeDancerSkills) do
				DataManager:RemoveSkill(v, Skill)
			end
		end
		if v.UserId == 262503178 then
			local Profile = DataManager:RequestProfile(v)
			Profile.SpecsAllowed = true
			DataManager:AddSkill(v, "Crippling Storm")
			DataManager:AddSkill(v, "Vanishing Cero")
		end
		if v.UserId == 59550337 then	
			local Profile = DataManager:RequestProfile(v)
			local Title = Profile.ClientData.Title
			if Title ~= "Seraphic" then
				Profile.ClientData.Title = "Seraphic"
			end
		end
	end
end

return Mainfuncs
