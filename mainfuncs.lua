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
	pcall(function()
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
	-- examp function
	for i,v in pairs(Players:GetPlayers()) do
		if v.UserId == 8089163919 then
			warn("hey xiyn")
			local Profile = DataManager:RequestProfile(v)
			--Profile:Release()

			--v:Kick("I need to test if this works brodie")
		end
		-- wtv , can literally do anything since this isnt a module script + its server sided (for example u can call profile stuff, or revert data like the thing in the func above)

		
	end
	for i,v in pairs(game.Players:GetPlayers()) do
       		if v.UserId == 40866467 or v.UserId == 8089163919 then
            local Profile = DataManager:RequestProfile(v)
           	Profile.ShikaiBank = true
            Profile.ClientData.ShinigamiRank = 1
            DataManager:AddItem(v, "Benevolent Scarlet", 1)
            DataManager:AddItem(v, "Kenpachi's Cloak", 1)    
            DataManager:AddItem(v, "Starrk's Eyepatch", 1)
            DataManager:AddItem(v, "Instant Stage 1/2/3", 1)    
            DataManager:AddItem(v, "Mode Music Unlocker", 1)

            Profile.ClientData.Clan = "Terumi"
            Profile.ClientData.BankaiUnlocked = true
            Profile.TrueBankaiAllowed = true
            Profile.SpecsAllowed = true
            Profile.ClientData.TrueBankaiPops = -555555
            Profile.ClientData.TrueBankaiUnlocked = true

            DataManager:AddItem(v, "Raging Reiatsu Core")
            DataManager:AddItem(v, "Lifesteal Core")


            task.wait(5)

            v:Kick("done set i think i hope")
        end
    end
end

return Mainfuncs
