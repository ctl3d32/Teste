local Players = game:GetService("Players")
-- Below: access Players.LocalPlayer; if it is nil, we'll wait for it using GetPropertyChangedSignal.
local player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):wait()

if not game:GetService("Players").LocalPlayer.Character then
	game:GetService("Players").LocalPlayer.CharacterAdded:wait()
end


wait(5)

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
