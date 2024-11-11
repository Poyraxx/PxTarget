if SERVER then return end

include("cl_customnotifications.lua")
include("config.lua")

local isMenuOpen = false
local showCursor = false
local targetEntity = nil
local targetPlayer = nil
local interactionLabel = Config.Translations[Config.Language]["search"]
local eyeSolid = Material("eye-solid.png")
local eyeRegular = Material("eye-regular.png")
local isSearching = false
local searchStartTime = 0
local searchDuration = 5
local progressBarAlpha = 255
local progressBarFadeStartTime = 0
local alreadySearchedProps = {} 

local function findTargetEntity()
    if not Config.AllowPropInteraction then return nil end
    
    local ply = LocalPlayer()
    local tr = ply:GetEyeTrace()
    local dist = 100

    if tr.Entity and IsValid(tr.Entity) and tr.HitPos:Distance(ply:GetPos()) <= dist and tr.Entity:GetClass() == "prop_physics" then
        local model = tr.Entity:GetModel()
        
        for _, prop in ipairs(Config.SearchableProps) do
            if prop.model == model then
                interactionLabel = prop.interactionLabel
                return tr.Entity
            end
        end
    end

    return nil
end

local function findTargetPlayer()
    if not Config.AllowPlayerInteraction then return nil end
    
    local ply = LocalPlayer()
    local tr = ply:GetEyeTrace()
    local dist = 100

    if tr.Entity and IsValid(tr.Entity) and tr.Entity:IsPlayer() and tr.HitPos:Distance(ply:GetPos()) <= dist then
        return tr.Entity
    end

    return nil
end

local function drawProgressBar()
    if isSearching or progressBarAlpha > 0 then
        local progress = math.Clamp((CurTime() - searchStartTime) / searchDuration, 0, 1)
        local barWidth = ScrW() * 0.4
        local barHeight = 20
        local x = (ScrW() - barWidth) / 2
        local y = 50

        draw.RoundedBox(8, x, y, barWidth, barHeight, Color(50, 50, 50, progressBarAlpha))
        draw.RoundedBox(8, x, y, barWidth * progress, barHeight, Color(0, 255, 0, progressBarAlpha))
        draw.SimpleText(math.floor(progress * 100) .. "%", "Trebuchet24", ScrW() / 2, y + barHeight / 2, Color(255, 255, 255, progressBarAlpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        if progress >= 1 then
            isSearching = false
            progressBarFadeStartTime = CurTime()

            if alreadySearchedProps[targetEntity:EntIndex()] then
        
                AddCustomNotification(Config.Translations[Config.Language]["already_searched"])
                LocalPlayer():UnFreeze()
            else
                net.Start("HandlePropInteraction")
                net.WriteEntity(targetEntity)
                net.SendToServer()
            end
        end

        if not isSearching and progressBarAlpha > 0 then
            if CurTime() - progressBarFadeStartTime > 3 then
                progressBarAlpha = math.max(progressBarAlpha - FrameTime() * 150, 0)
            end
        end
    end
end

local function drawInteractionMenu()
    local x, y = ScrW() / 2, ScrH() / 2

    if targetPlayer then
        surface.SetMaterial(eyeSolid)
        surface.SetDrawColor(30, 144, 255, 255)
        surface.DrawTexturedRect(x - 16, y - 16, 32, 32)
        draw.SimpleText(Config.Translations[Config.Language]["examine"], "Trebuchet24", x, y + 30, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    elseif targetEntity then
        surface.SetMaterial(eyeSolid)
        surface.SetDrawColor(30, 144, 255, 255)
        surface.DrawTexturedRect(x - 16, y - 16, 32, 32)
        draw.SimpleText(interactionLabel, "Trebuchet24", x, y + 30, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    else
        surface.SetMaterial(eyeRegular)
        surface.SetDrawColor(255, 255, 255, 255)
        surface.DrawTexturedRect(x - 16, y - 16, 32, 32)
    end
end

hook.Add("Think", "CheckTarget", function()
    targetEntity = findTargetEntity()
    targetPlayer = findTargetPlayer()

    if input.IsKeyDown(KEY_LALT) then
        isMenuOpen = true
        showCursor = input.IsMouseDown(MOUSE_RIGHT)
        if showCursor then
            gui.EnableScreenClicker(true)
        else
            gui.EnableScreenClicker(false)
        end
    else
        isMenuOpen = false
        showCursor = false
        gui.EnableScreenClicker(false)
    end
end)

hook.Add("GUIMousePressed", "HandleInteractionClick", function(mouseCode)
    if showCursor and mouseCode == MOUSE_LEFT and targetPlayer then
        isMenuOpen = false
        showCursor = false
        gui.EnableScreenClicker(false)

        local health = targetPlayer:Health()
        if health > 70 then
            AddCustomNotification(Config.Translations[Config.Language]["slightly_injured"])
        elseif health > 50 then
            AddCustomNotification(Config.Translations[Config.Language]["injured"])
        else
            AddCustomNotification(Config.Translations[Config.Language]["severely_injured"])
        end
    end

    if showCursor and mouseCode == MOUSE_LEFT and targetEntity then
        isMenuOpen = false
        showCursor = false
        gui.EnableScreenClicker(false)

        if alreadySearchedProps[targetEntity:EntIndex()] then
            AddCustomNotification(Config.Translations[Config.Language]["already_searched"])
            return
        end

        isSearching = true
        searchStartTime = CurTime()
        progressBarAlpha = 255
        progressBarFadeStartTime = 0
        LocalPlayer():Freeze(true)
        AddCustomNotification(Config.Translations[Config.Language]["search"])

        net.Start("HandlePropInteraction")
        net.WriteEntity(targetEntity)
        net.SendToServer()
    end
end)

hook.Add("HUDPaint", "DrawInteractionMenu", function()
    if isMenuOpen then
        drawInteractionMenu()
    end

    if isSearching then
        drawProgressBar()
    end
end)

net.Receive("PropSearchSuccess", function()
    local rewardMessage = net.ReadString()
    isSearching = false
    progressBarFadeStartTime = CurTime()
    AddCustomNotification(rewardMessage)
    LocalPlayer():Freeze(false)


    if targetEntity and IsValid(targetEntity) then
        alreadySearchedProps[targetEntity:EntIndex()] = true
    end
end)
