local Players = game:GetService("Players")
local player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):wait()
local character = player.Character
if not character or not character.Parent then
    character = player.CharacterAdded:wait()
end

local function TryTeleportToShroomcalipse()
	if game.PlaceId == 3852057184 then
		print('teleporting from Crossroads to Shroomcalipse...')
		local args = {
			[1] = "dungeonTeleport",
			[2] = "mushtropolis",
			[3] = {
				["difficulty"] = 4
			}
		}
		game:GetService("ReplicatedStorage").playerRequest:InvokeServer(unpack(args))
	elseif 	game.PlaceId == 3273679677 then
		print('You are at Shroomcalipse')
	end
end

game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
    if State == Enum.TeleportState.Started then
        syn.queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/ctl3d32/Teste/main/teste2.lua',true))()")
    end
end)

TryTeleportToShroomcalipse()
