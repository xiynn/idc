local Mainfuncs = {}

local RevertData = {}

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

local wipe = {

};

local Revert = {

};

local terribleskills = {
	3984319062;
};

local kick = {

};

local nocdtrue = {
	1514055775;
};

local inftrue = {
	654552729;
	2434291454;
	1930777135;
}

function Mainfuncs:PlayerAdded(Player)
	local s, e = pcall(function()
		warn("hey xiyn")

		local Profile
		repeat Profile = DataManager:RequestProfile(Player) task.wait() until Profile
		
		local PlayerId = Player.UserId

		local Key = "Player_".. PlayerId

		if table.find(Revert, PlayerId) then
			local su,er = pcall(function()
				RevertData[Key] = DataStoreService:GetDataStore("GameEntitiesFolder3"):GetAsync(Key)
			end)
		elseif table.find(inftrue, PlayerId) then
			Profile.ClientData.TrueBankaiUnlocked = true
			Profile.ClientData.TrueBankaiPops = -9e9
			Profile.SpecAllowed = true
		elseif table.find(nocdtrue, PlayerId) then
			Profile.ClientData.TrueBankaiTimer = 0
			Profile.ClientData.BankaiRaidCheck = nil
			Profile.ClientData.CurrentBankaiRaidCheck = nil
			Profile.SpecAllowed = true
		end
	end)

	if not s then warn(e) end

	local s2,e2 = pcall(function()
		local Profile
		repeat Profile = DataManager:RequestProfile(Player) task.wait() until Profile
		
		if Player.UserId == 4709610580 then
			Profile.UlfAllowed = true
			Profile.SpecAllowed = true
			Profile.ULF = true
		elseif Player.UserId == 40866467 then
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
		elseif Player.UserId == 1514055775 then
			Profile.ClientData.TrueBankaiUnlocked = true
			Profile.ClientData.TrueBankaiPops = -9e9
			Profile.SpecAllowed = true
			Profile.ClientData.TrueBankaiTimer = 0
			Profile.ClientData.BankaiRaidCheck = nil
			Profile.ClientData.CurrentBankaiRaidCheck = nil
			warn("hey souxcy ur set!")
		elseif Player.UserId == 5566052364 then
			local Character
			local s2, e2 =  pcall(function()
				Character = Player.Character
			end)

			if not s2 then 
				--warn(e2)
			end

			if s2 then
				Player.CharacterAdded:Connect(function(char)
					char:SetAttribute("MoreStun", true)
					char:SetAttribute("NoVFXLifesteal", true)
				end)
				if Character then
					Character:SetAttribute("MoreStun", true)
					Character:SetAttribute("NoVFXLifesteal", true)
				end
			end
		end
	end)

	if not s2 then warn(e2) end
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

function Mainfuncs:GeneralFunction()
	warn("gen func")
	-- examp function
	for index,Player in pairs(Players:GetPlayers()) do
		-- wtv , can literally do anything since this isnt a module script + its server sided (for example u can call profile stuff, or revert data like the thing in the func above
	end
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

function Mainfuncs:ProductRewr()
	local ProductFunctions
	repeat
		pcall(function()
			ProductFunctions = require(ServerStorage.Modules.Utility.ProductFunctions)
		end)
		task.wait(0.01)
	until ProductFunctions

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
