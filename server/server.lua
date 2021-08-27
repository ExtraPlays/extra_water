local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

server = {}

Tunnel.bindInterface("extra_water", server)

function server.inWater()    

    local source = source
    local user_id = vRP.getUserId(source)

    for k,v in pairs(Config.Items) do
        
        local item = v.item
        local qtd = vRP.getInventoryItemAmount(user_id, item)                

        if vRP.tryGetInventoryItem(user_id, item, qtd) then
            TriggerClientEvent("Notify", source, "sucesso", "Você se molhou e perdeu " .. qtd .. "x " .. item)            
        end
    end
end