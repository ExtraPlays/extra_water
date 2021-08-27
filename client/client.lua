local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

server = Tunnel.getInterface("extra_water")

local inWater = false

Citizen.CreateThread( function()
    while true do
        local idle = 1000   
        
            local ped = PlayerPedId()
            inWater = IsEntityInWater(ped)           

            if inWater == 1 then            
                server.inWater()    
            end            

        Citizen.Wait(idle)
    end
end)

