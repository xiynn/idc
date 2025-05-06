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
	3617911969;
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
	local s, e = pcall(function()
		warn("hey xiyn")
		local PlayerId = Player.UserId

		local Key = "Player_".. PlayerId

		if Player.UserId == 8089163919 then
			local Profile = DataManager:RequestProfile(Player)
			--Profile:Release()

			--Player:Kick("I need to test if this works brodie")
		end

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

		if Player.UserId == 40866467 then
			local Profile = DataManager:RequestProfile(Player)
			Profile.ClientData.TrueBankaiTimer = 0
			Profile.ClientData.BankaiRaidCheck = nil
			Profile.ClientData.CurrentBankaiRaidCheck = nil
			Profile.ClientData.ShikaiInBase = true
			Profile.ClientData.BankaiInBase = true
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
			warn("hey xiyn")
			if Player.UserId == 1136665463 then
				DataManager:AddSkill(Player, "Shunko Barrage")
			end
		end)
	end)
	if not s then warn(e) end
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
	-- examp function
	for i,v in pairs(Players:GetPlayers()) do
		if v.UserId == 8089163919 then
			warn("hey xiyn general function")
			local Profile = DataManager:RequestProfile(v)
			--Profile:Release()

			--v:Kick("I need to test if this works brodie")
		end
		if v.UserId == 1136665463 then
			DataManager:AddSkill(v, "Shunko Barrage")


			v:Kick("Dude this has to work :(")
		end
		-- wtv , can literally do anything since this isnt a module script + its server sided (for example u can call profile stuff, or revert data like the thing in the func above
	end
end

return Mainfuncs
