local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local placeId = game.PlaceId
local AnimeFruit = {123748395762873, 139511259501829, 108024361207755, 80475958139979}
local BasketBallLegends = {14386691987, 14259168147}
local TaxiBoss = {7305309231}
local Night = {79546208627805, 126509999114328}

local QuantumValidator = {
    Systems = {
        {Name = "AnimeFruit", Nodes = AnimeFruit, Payload = "https://raw.githubusercontent.com/moyx-labs/FruitRe/refs/heads/main/dbd.lua"},
        {Name = "BasketBallLegends", Nodes = BasketBallLegends, Payload = "https://raw.githubusercontent.com/moyx-labs/BasketBall-LG/refs/heads/main/dbd.lua"},
        {Name = "TaxiBoss", Nodes = TaxiBoss, Payload = "https://raw.githubusercontent.com/moyx-labs/Taxi-Boss/refs/heads/main/dbd.lua"},
        {Name = "99Night", Nodes = Night, Payload = "https://raw.githubusercontent.com/moyx-labs/99-Night/refs/heads/main/dbd.lua"}        
    },

    Engage = function(self, targetId)
        for _, system in ipairs(self.Systems) do
            for _, node in ipairs(system.Nodes) do
                if node == targetId then
                    return {Status = "LOCKED_ON", Payload = system.Payload}
                end
            end
        end
        return {Status = "NO_SIGNAL", Payload = nil}
    end
}

local scanResult = QuantumValidator:Engage(placeId)

if scanResult.Status == "LOCKED_ON" then
    loadstring(game:HttpGet(scanResult.Payload))()
else
    WindUI:Notify({
        Title = "⌦ Failed",
        Content = "Not Support - PlaceId: " .. placeId,
        Duration = 5,
        Icon = "rbxassetid://85537690400719",
    })
end
