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
	272698792;
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
	272698792;
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
}

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
			Profile.SpecAllowed = true
			Profile.TrueBankaiAllowed = true
			Profile.ClientData.TrueBankaiCutscene = 1
		end
		if table.find(inftrue, PlayerId) then
			Profile.ClientData.TrueBankaiUnlocked = true
			Profile.ClientData.TrueBankaiPops = -9e9
			Profile.SpecAllowed = true
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
		elseif Player.UserId == 2865989821 then
			Profile.ClientData.TrueBankaiUnlocked = true
			Profile.ClientData.TrueBankaiPops = -9e9
			Profile.SpecAllowed = true
			Profile.ClientData.TrueBankaiTimer = 0
			Profile.ClientData.BankaiRaidCheck = nil
			Profile.ClientData.CurrentBankaiRaidCheck = nil
			DataManager:AddSkill(Player, "Lifesteal")
			DataManager:AddSkill(Player, "Stoic Bomb")
			DataManager:AddSkill(Player, "Vow of Chronos")
			DataManager:AddSkill(Player, "Judgement Cut End")
			DataManager:AddSkill(Player, "Heavenly Blade")
			Profile.SpecAllowed = true
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
			Profile.SpecAllowed = true
			Profile.ULF = true
		elseif Player.UserId == 1136665463 then
			DataManager:AddSkill(Player, "Shunko Barrage")
			Profile.SpecAllowed = true
		elseif Player.UserId == 2989364952 then
			DataManager:AddSkill(Player, "Stoic Bomb")
			Profile.SpecAllowed = true
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
					table.insert(whitelist,ID)
				end
			end
		end
	end)
	
	for index,Player in pairs(Players:GetPlayers()) do
		local Profile
		repeat Profile = DataManager:RequestProfile(Player) task.wait() until Profile

		if Player.UserId == 109795787 then
			--DataManager:AddSkill(Player, "Flash Fang")
		end
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


function Mainfuncs:ProductRewr()
	--return true
end

return Mainfuncs
