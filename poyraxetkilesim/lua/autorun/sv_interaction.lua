if CLIENT then return end

AddCSLuaFile("config.lua")
include("config.lua")

util.AddNetworkString("PropSearchSuccess")
util.AddNetworkString("HandlePropInteraction")

local searchedProps = {}

net.Receive("HandlePropInteraction", function(len, ply)
    local prop = net.ReadEntity()
    if not IsValid(prop) or prop:GetClass() ~= "prop_physics" then return end

    local propID = prop:EntIndex()

    if searchedProps[propID] then

        net.Start("PropSearchSuccess")
        net.WriteString(Config.Translations[Config.Language]["already_searched"])
        net.Send(ply)
        return
    end


    searchedProps[propID] = true

    local reward = Config.Rewards[math.random(#Config.Rewards)]

    ply:Freeze(true)

    timer.Simple(5, function()
        if IsValid(ply) then
            ply:Freeze(false)

            if reward.type == "money" then
                ply:addMoney(reward.amount)
            elseif reward.type == "weapon" then
                ply:Give(reward.class)
            end

            net.Start("PropSearchSuccess")
            net.WriteString(reward.message)
            net.Send(ply)
        end
    end)
end)
