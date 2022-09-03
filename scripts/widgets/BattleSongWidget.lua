-- This code part is so messy because im just repeating my code :)

local Widget = require "widgets/widget"
local ImageButton = require "widgets/imagebutton"

local function Talk()
    _G.ThePlayer.components.talker:Say("...")
end

local function OnToogleBuff(item)
    local inventory = _G.ThePlayer.replica.inventory:GetItems()
    local backpack = _G.ThePlayer.replica.inventory:GetOverflowContainer() or nil
    local backpackitems = backpack and backpack:GetItems() or nil

    if _G.ThePlayer and not _G.ThePlayer.HUD:IsChatInputScreenOpen() and not _G.ThePlayer.HUD:IsConsoleScreenOpen() and not _G.ThePlayer.HUD.writeablescreen then
        for i, v in pairs(inventory) do
            if v ~= nil and v.prefab == item then
                _G.ThePlayer.replica.inventory:UseItemFromInvTile(v)
            end
        end
        if backpack and backpackitems ~= nil then
            for i, v in pairs(backpackitems) do
                if v ~= nil and v.prefab == item then
                    _G.ThePlayer.replica.inventory:UseItemFromInvTile(v)
                end
            end
        end
    end
    return true
end

local function checkBuffItem(inst, self)
    local inventory = _G.ThePlayer.replica.inventory:Has(self.itemname, 1, false)
    if inventory then
        self.button:Show()
    else
        self.button:Hide()
    end
end

local BaseButton = Class(Widget, function(self, name, atlas, normal, itemname, tooltip)
    Widget._ctor(self, name)
    self.button = self:AddChild(ImageButton(atlas, normal, nil, nil, nil, nil, { 1, 1 }, { 0, 0 }))

    self:SetOnClick(OnToogleBuff)
    local scale = 50 / math.max(self.button:GetSize())
    self.button:SetScale(scale, scale, scale)
    local w, h = self.button:GetSize()
    self.width = w * scale
    self.height = h * scale

    self.itemname = itemname
    self.inst:DoPeriodicTask(0.5, checkBuffItem, nil, self)

    self.button:SetTooltip(tooltip)

    self.drag_tolerance = 4
    self:SetOnDragFinish(nil)
    self:SetDraggable(true)
end)

function BaseButton:SetDraggable(bool)
    self.draggable = bool
end

function BaseButton:SetOnDragFinish(fn)
    self.ondragfinish = fn
end

function BaseButton:SetOnClick(fn)
    self.onclick = fn
end

function BaseButton:OnControl(control, down)
    Widget.OnControl(self, control, down)

    --print(control, down)
    if control == CONTROL_ACCEPT then
        if down then
            if self.draggable then
                self:BeginDrag()
            end
        else
            --print(self:HasMoved())
            if not self:HasMoved() then
                if self.onclick then
                    self.onclick(self.itemname)
                end
            end
            self:EndDrag()
        end
    end
end

function BaseButton:OnGainFocus()
    --mprint("gained focus")
end

function BaseButton:OnLoseFocus()
    if self:IsDragging() then
        self:EndDrag()
        --mprint('still dragging')
    end
    --mprint("lost focus")
end

function BaseButton:HasMoved()
    if self._drag_origin == nil then
        return false
    end

    local bx, by, bz = self._drag_origin:Get()
    local x, y, z = self:GetPosition():Get()

    if math.abs(x - bx) + math.abs(y - by) >= self.drag_tolerance then
        return true
    end

    return false
end

function BaseButton:IsDragging()
    return self._draghandler ~= nil
end

function BaseButton:BeginDrag()
    if self:IsDragging() then
        dprint("ALREADY DRAGGING")
        return
    end

    --print(self:GetPosition(), self:GetWorldPosition())
    self._drag_origin = self:GetPosition()
    local pos = self._drag_origin

    self._draghandler = TheInput:AddMoveHandler(function(x, y)
        local deltax = x - (TheFrontEnd.lastx or x)
        local deltay = y - (TheFrontEnd.lasty or y)

        local scale = self:GetScale()
        local screen_width, screen_height = TheSim:GetScreenSize()
        screen_width = screen_width / scale.x
        screen_height = screen_height / scale.y

        deltax = deltax / scale.x
        deltay = deltay / scale.y

        local nx = pos.x + deltax
        local ny = pos.y + deltay

        --print(ny)

        local a, b = self.button:GetSize()

        nx = math.clamp(nx, -screen_width + a / 2, -a / 2) -- 0,0 is bottom right of screen
        ny = math.clamp(ny, b / 2, screen_height - b / 2)


        --print(ny, h)

        pos = Vector3(nx, ny, pos.z)
        self:SetPosition(pos)
    end)
end

function BaseButton:EndDrag()
    if not self:IsDragging() then
        -- checks self._draghandler
        return
    end

    self._draghandler:Remove()

    if self.ondragfinish and self:HasMoved() then
        self.ondragfinish(self._dragorigin, self:GetPosition())
    end

    self._dragorigin = nil
    self._draghandler = nil
end

local ButtonWeapon = Class(BaseButton, function(self, inst)
    BaseButton._ctor(self, "ButtonWeapon", "images/Weaponized_Warble.xml", "Weaponized_Warble.tex", "battlesong_durability",
            "Weapon durability drains 25% slower")
end)

local ButtonRegen = Class(BaseButton, function(self, inst)
    BaseButton._ctor(self, "ButtonRegen", "images/Heartrending_Ballad.xml", "Heartrending_Ballad.tex", "battlesong_healthgain",
            "Grants +1 Health per attack for nearby players / +0.5 for Wigfrid")
end)

local ButtonRegenSanity = Class(BaseButton, function(self, inst)
    BaseButton._ctor(self, "ButtonRegenSanity", "images/Clear_Minded_Cadenza.xml", "Clear_Minded_Cadenza.tex", "battlesong_sanitygain",
            "+1 Sanity per hit landed on enemies")
end)

local ButtonHalfSanity = Class(BaseButton, function(self, inst)
    BaseButton._ctor(self, "ButtonHalfSanity", "images/Bel_Canto_of_Courage.xml", "Bel_Canto_of_Courage.tex", "battlesong_sanityaura",
            "Halves negative sanity drain auras")
end)

local ButtonTauntEnemy = Class(BaseButton, function(self, inst)
    BaseButton._ctor(self, "ButtonTauntEnemy", "images/Rude_Interlude.xml", "Rude_Interlude.tex", "battlesong_instant_taunt",
            "Taunt nearby enemies, cost 16 inspiration to sing")
end)

local ButtonRepelEnemy = Class(BaseButton, function(self, inst)
    BaseButton._ctor(self, "ButtonRepelEnemy", "images/Startling_Soliloquy.xml", "Startling_Soliloquy.tex", "battlesong_instant_panic",
            "Makes nearby enemies panic, cost 16 inspiration to sing")
end)

local ButtonFireproof = Class(BaseButton, function(self, inst)
    BaseButton._ctor(self, "ButtonFireproof", "images/Fireproof_Falsetto.xml", "Fireproof_Falsetto.tex", "battlesong_fireresistance",
            "Reduces fire damage by 33%")
end)

return { ButtonWeapon, ButtonRegen, ButtonRegenSanity, ButtonHalfSanity, ButtonTauntEnemy, ButtonRepelEnemy, ButtonFireproof }