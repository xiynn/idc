local Mainfuncs = {}

local wipe = {
	4185818672;
}

local Revert = {
	--7129257981;
	--8089163919;
	--4407961133;
}

local terribleskills = {
	7129257981;
	8089163919;
}

local DataStoreService = game:GetService("DataStoreService")

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
				char:SetAttribute("CatDamage", -0.3)
				char:SetAttribute("CatDefense", 1.2)
			end)
			if Character then
				Character:SetAttribute("CatDamage", -0.3)
				Character:SetAttribute("CatDefense", 1.2)
			end
		end
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

function Mainfuncs:GeneralFunction()

end

return Mainfuncs
