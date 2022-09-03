-- This code part is so messy because im just repeating my code :)

local Widget = require "widgets/widget"
local ImageButton = require "widgets/imagebutton"

local function Talk() 
	_G.ThePlayer.components.talker:Say("...") 
end

local function OnToogleWeaponBuff()
	local inventory = _G.ThePlayer.replica.inventory:GetItems()
	local backpack = _G.ThePlayer.replica.inventory:GetEquippedItem(_G.EQUIPSLOTS.BODY) or nil
	local backpackitems = backpack and backpack.replica.container and backpack.replica.container:GetItems() or nil
	
	if _G.ThePlayer and not _G.ThePlayer.HUD:IsChatInputScreenOpen() and not _G.ThePlayer.HUD:IsConsoleScreenOpen() and not _G.ThePlayer.HUD.writeablescreen then
		for i, v in pairs(inventory) do
			if v ~= nil and v.prefab == "battlesong_durability" then
				_G.ThePlayer.replica.inventory:UseItemFromInvTile(v)
			end
		end
		if backpack and backpackitems ~= nil then
			for i, v in pairs(backpackitems) do
				if v ~= nil and v.prefab == "battlesong_durability" then
					_G.ThePlayer.replica.inventory:UseItemFromInvTile(v)
				end
			end
		end
	end
return true
end

local function OnToggleRegenBuff()
	local inventory = _G.ThePlayer.replica.inventory:GetItems()
	local backpack = _G.ThePlayer.replica.inventory:GetEquippedItem(_G.EQUIPSLOTS.BODY) or nil
	local backpackitems = backpack and backpack.replica.container and backpack.replica.container:GetItems() or nil
	
	if _G.ThePlayer and not _G.ThePlayer.HUD:IsChatInputScreenOpen() and not _G.ThePlayer.HUD:IsConsoleScreenOpen() and not _G.ThePlayer.HUD.writeablescreen then
		for i, v in pairs(inventory) do
			if v ~= nil and v.prefab == "battlesong_healthgain" then
				_G.ThePlayer.replica.inventory:UseItemFromInvTile(v)
			end
		end
		if backpack and backpackitems ~= nil then
			for i, v in pairs(backpackitems) do
				if v ~= nil and v.prefab == "battlesong_healthgain" then
					_G.ThePlayer.replica.inventory:UseItemFromInvTile(v)
				end
			end
		end
	end
return true
end

local function OnToggleRegenSanityBuff()
	local inventory = _G.ThePlayer.replica.inventory:GetItems()
	local backpack = _G.ThePlayer.replica.inventory:GetEquippedItem(_G.EQUIPSLOTS.BODY) or nil
	local backpackitems = backpack and backpack.replica.container and backpack.replica.container:GetItems() or nil
	
	if _G.ThePlayer and not _G.ThePlayer.HUD:IsChatInputScreenOpen() and not _G.ThePlayer.HUD:IsConsoleScreenOpen() and not _G.ThePlayer.HUD.writeablescreen then
		for i, v in pairs(inventory) do
			if v ~= nil and v.prefab == "battlesong_sanitygain" then
				_G.ThePlayer.replica.inventory:UseItemFromInvTile(v)
			end
		end
		if backpack and backpackitems ~= nil then
			for i, v in pairs(backpackitems) do
				if v ~= nil and v.prefab == "battlesong_sanitygain" then
					_G.ThePlayer.replica.inventory:UseItemFromInvTile(v)
				end
			end
		end
	end
return true
end

local function OnToggleHalfSanityBuff()
	local inventory = _G.ThePlayer.replica.inventory:GetItems()
	local backpack = _G.ThePlayer.replica.inventory:GetEquippedItem(_G.EQUIPSLOTS.BODY) or nil
	local backpackitems = backpack and backpack.replica.container and backpack.replica.container:GetItems() or nil
	
	if _G.ThePlayer and not _G.ThePlayer.HUD:IsChatInputScreenOpen() and not _G.ThePlayer.HUD:IsConsoleScreenOpen() and not _G.ThePlayer.HUD.writeablescreen then
		for i, v in pairs(inventory) do
			if v ~= nil and v.prefab == "battlesong_sanityaura" then
				_G.ThePlayer.replica.inventory:UseItemFromInvTile(v)
			end
		end
		if backpack and backpackitems ~= nil then
			for i, v in pairs(backpackitems) do
				if v ~= nil and v.prefab == "battlesong_sanityaura" then
					_G.ThePlayer.replica.inventory:UseItemFromInvTile(v)
				end
			end
		end
	end
return true
end

local function OnToggleTauntEnemyBuff()
	local inventory = _G.ThePlayer.replica.inventory:GetItems()
	local backpack = _G.ThePlayer.replica.inventory:GetEquippedItem(_G.EQUIPSLOTS.BODY) or nil
	local backpackitems = backpack and backpack.replica.container and backpack.replica.container:GetItems() or nil
	
	if _G.ThePlayer and not _G.ThePlayer.HUD:IsChatInputScreenOpen() and not _G.ThePlayer.HUD:IsConsoleScreenOpen() and not _G.ThePlayer.HUD.writeablescreen then
		for i, v in pairs(inventory) do
			if v ~= nil and v.prefab == "battlesong_instant_taunt" then
				_G.ThePlayer.replica.inventory:UseItemFromInvTile(v)
			end
		end
		if backpack and backpackitems ~= nil then
			for i, v in pairs(backpackitems) do
				if v ~= nil and v.prefab == "battlesong_instant_taunt" then
					_G.ThePlayer.replica.inventory:UseItemFromInvTile(v)
				end
			end
		end
	end
return true
end

local function OnToggleRepelEnemyBuff()
	local inventory = _G.ThePlayer.replica.inventory:GetItems()
	local backpack = _G.ThePlayer.replica.inventory:GetEquippedItem(_G.EQUIPSLOTS.BODY) or nil
	local backpackitems = backpack and backpack.replica.container and backpack.replica.container:GetItems() or nil
	
	if _G.ThePlayer and not _G.ThePlayer.HUD:IsChatInputScreenOpen() and not _G.ThePlayer.HUD:IsConsoleScreenOpen() and not _G.ThePlayer.HUD.writeablescreen then
		for i, v in pairs(inventory) do
			if v ~= nil and v.prefab == "battlesong_instant_panic" then
				_G.ThePlayer.replica.inventory:UseItemFromInvTile(v)
			end
		end
		if backpack and backpackitems ~= nil then
			for i, v in pairs(backpackitems) do
				if v ~= nil and v.prefab == "battlesong_instant_panic" then
					_G.ThePlayer.replica.inventory:UseItemFromInvTile(v)
				end
			end
		end
	end
return true
end

local function OnToggleFireproofBuff()
	local inventory = _G.ThePlayer.replica.inventory:GetItems()
	local backpack = _G.ThePlayer.replica.inventory:GetEquippedItem(_G.EQUIPSLOTS.BODY) or nil
	local backpackitems = backpack and backpack.replica.container and backpack.replica.container:GetItems() or nil
	
	if _G.ThePlayer and not _G.ThePlayer.HUD:IsChatInputScreenOpen() and not _G.ThePlayer.HUD:IsConsoleScreenOpen() and not _G.ThePlayer.HUD.writeablescreen then
		for i, v in pairs(inventory) do
			if v ~= nil and v.prefab == "battlesong_fireresistance" then
				_G.ThePlayer.replica.inventory:UseItemFromInvTile(v)
			end
		end
		if backpack and backpackitems ~= nil then
			for i, v in pairs(backpackitems) do
				if v ~= nil and v.prefab == "battlesong_fireresistance" then
					_G.ThePlayer.replica.inventory:UseItemFromInvTile(v)
				end
			end
		end
	end
return true
end

local ButtonWeapon = Class(Widget, function(self, inst)
	Widget._ctor(self, "ButtonWeapon")
	self.button = self:AddChild(ImageButton("images/Weaponized_Warble.xml", "Weaponized_Warble.tex", nil, nil, nil, nil, {1,1}, {0,0}))
	local dragging = false
	self.button.OnMouseButton = function(inst, button, down, x, y)
		print(self, button, down, x, y)
		if button == 1001 then
			if down then
				dragging = true
				local mousepos = TheInput:GetScreenPosition()
				self.dragPosDiff = self.button:GetPosition() - mousepos
			else
				dragging = false
			end
		end	
	end
	
	self.followhandler = TheInput:AddMoveHandler(function(x,y)
		if dragging then
			local pos
			if type(x) == "number" then
				pos = Vector3(x, y, 1)
			else
				pos = x
			end
			self.button:SetPosition(pos + self.dragPosDiff)
		end
	end)
	self.button:SetOnClick(OnToogleWeaponBuff)
	local scale = 50 / math.max(self.button:GetSize())
	self.button:SetScale(scale, scale, scale)
	local w, h = self.button:GetSize()
	self.width = w * scale
	self.height = h * scale
	self.inst:DoPeriodicTask(0.5, function()
		local inventory = _G.ThePlayer.replica.inventory:Has("battlesong_durability", 1)
		local backpack = _G.ThePlayer.replica.inventory:GetEquippedItem(_G.EQUIPSLOTS.BODY) or nil
		local backpackitems = backpack and backpack.replica.container and backpack.replica.container:Has("battlesong_durability", 1) or nil
		if inventory then
			self.button:Show()
		else
			self.button:Hide()
		end
		
		if backpack and backpackitems ~= nil then
			if backpackitems then
				self.button:Show()
			else
				self.button:Hide()
			end
		end
    end)
	self.button:SetTooltip("Weapon durability drains 25% slower")
end)

local ButtonRegen = Class(Widget, function(self, inst)
	Widget._ctor(self, "ButtonRegen")
	self.button = self:AddChild(ImageButton("images/Heartrending_Ballad.xml", "Heartrending_Ballad.tex", nil, nil, nil, nil, {1,1}, {0,0}))
	local dragging = false
	self.button.OnMouseButton = function(inst, button, down, x, y)
		print(self, button, down, x, y)
		if button == 1001 then
			if down then
				dragging = true
				local mousepos = TheInput:GetScreenPosition()
				self.dragPosDiff = self.button:GetPosition() - mousepos
			else
				dragging = false
			end
		end	
	end
	
	self.followhandler = TheInput:AddMoveHandler(function(x,y)
		if dragging then
			local pos
			if type(x) == "number" then
				pos = Vector3(x, y, 1)
			else
				pos = x
			end
			self.button:SetPosition(pos + self.dragPosDiff)
		end
	end)
	self.button:SetOnClick(OnToggleRegenBuff)
	local scale = 50 / math.max(self.button:GetSize())
	self.button:SetScale(scale, scale, scale)
	local w, h = self.button:GetSize()
	self.width = w * scale
	self.height = h * scale
	self.inst:DoPeriodicTask(0.5, function()
		local inventory = _G.ThePlayer.replica.inventory:Has("battlesong_healthgain", 1)
		local backpack = _G.ThePlayer.replica.inventory:GetEquippedItem(_G.EQUIPSLOTS.BODY) or nil
		local backpackitems = backpack and backpack.replica.container and backpack.replica.container:Has("battlesong_healthgain", 1) or nil
		if inventory then
			self.button:Show()
		else
			self.button:Hide()
		end
		
		if backpack and backpackitems ~= nil then
			if backpackitems then
				self.button:Show()
			else
				self.button:Hide()
			end
		end
    end)
	self.button:SetTooltip("Grants +1 Health per attack for nearby players / +0.5 for Wigfrid")
end)

local ButtonRegenSanity = Class(Widget, function(self, inst)
	Widget._ctor(self, "ButtonRegenSanity")
	self.button = self:AddChild(ImageButton("images/Clear_Minded_Cadenza.xml", "Clear_Minded_Cadenza.tex", nil, nil, nil, nil, {1,1}, {0,0}))
	local dragging = false
	self.button.OnMouseButton = function(inst, button, down, x, y)
		print(self, button, down, x, y)
		if button == 1001 then
			if down then
				dragging = true
				local mousepos = TheInput:GetScreenPosition()
				self.dragPosDiff = self.button:GetPosition() - mousepos
			else
				dragging = false
			end
		end	
	end
	
	self.followhandler = TheInput:AddMoveHandler(function(x,y)
		if dragging then
			local pos
			if type(x) == "number" then
				pos = Vector3(x, y, 1)
			else
				pos = x
			end
			self.button:SetPosition(pos + self.dragPosDiff)
		end
	end)
	self.button:SetOnClick(OnToggleRegenSanityBuff)
	local scale = 50 / math.max(self.button:GetSize())
	self.button:SetScale(scale, scale, scale)
	local w, h = self.button:GetSize()
	self.width = w * scale
	self.height = h * scale
	self.inst:DoPeriodicTask(0.5, function()
		local inventory = _G.ThePlayer.replica.inventory:Has("battlesong_sanitygain", 1)
		local backpack = _G.ThePlayer.replica.inventory:GetEquippedItem(_G.EQUIPSLOTS.BODY) or nil
		local backpackitems = backpack and backpack.replica.container and backpack.replica.container:Has("battlesong_sanitygain", 1) or nil
		if inventory then
			self.button:Show()
		else
			self.button:Hide()
		end
		
		if backpack and backpackitems ~= nil then
			if backpackitems then
				self.button:Show()
			else
				self.button:Hide()
			end
		end
    end)
	self.button:SetTooltip("+1 Sanity per hit landed on enemies")
end)

local ButtonHalfSanity = Class(Widget, function(self, inst)
	Widget._ctor(self, "ButtonHalfSanity")
	self.button = self:AddChild(ImageButton("images/Bel_Canto_of_Courage.xml", "Bel_Canto_of_Courage.tex", nil, nil, nil, nil, {1,1}, {0,0}))
	local dragging = false
	self.button.OnMouseButton = function(inst, button, down, x, y)
		print(self, button, down, x, y)
		if button == 1001 then
			if down then
				dragging = true
				local mousepos = TheInput:GetScreenPosition()
				self.dragPosDiff = self.button:GetPosition() - mousepos
			else
				dragging = false
			end
		end	
	end
	
	self.followhandler = TheInput:AddMoveHandler(function(x,y)
		if dragging then
			local pos
			if type(x) == "number" then
				pos = Vector3(x, y, 1)
			else
				pos = x
			end
			self.button:SetPosition(pos + self.dragPosDiff)
		end
	end)
	self.button:SetOnClick(OnToggleHalfSanityBuff)
	local scale = 50 / math.max(self.button:GetSize())
	self.button:SetScale(scale, scale, scale)
	local w, h = self.button:GetSize()
	self.width = w * scale
	self.height = h * scale
	self.inst:DoPeriodicTask(0.5, function()
		local inventory = _G.ThePlayer.replica.inventory:Has("battlesong_sanityaura", 1)
		local backpack = _G.ThePlayer.replica.inventory:GetEquippedItem(_G.EQUIPSLOTS.BODY) or nil
		local backpackitems = backpack and backpack.replica.container and backpack.replica.container:Has("battlesong_sanityaura", 1) or nil
		if inventory then
			self.button:Show()
		else
			self.button:Hide()
		end
		
		if backpack and backpackitems ~= nil then
			if backpackitems then
				self.button:Show()
			else
				self.button:Hide()
			end
		end
    end)
	self.button:SetTooltip("Halves negative sanity drain auras")
end)

local ButtonTauntEnemy = Class(Widget, function(self, inst)
	Widget._ctor(self, "ButtonTauntEnemy")
	self.button = self:AddChild(ImageButton("images/Rude_Interlude.xml", "Rude_Interlude.tex", nil, nil, nil, nil, {1,1}, {0,0}))
	local dragging = false
	self.button.OnMouseButton = function(inst, button, down, x, y)
		print(self, button, down, x, y)
		if button == 1001 then
			if down then
				dragging = true
				local mousepos = TheInput:GetScreenPosition()
				self.dragPosDiff = self.button:GetPosition() - mousepos
			else
				dragging = false
			end
		end	
	end
	
	self.followhandler = TheInput:AddMoveHandler(function(x,y)
		if dragging then
			local pos
			if type(x) == "number" then
				pos = Vector3(x, y, 1)
			else
				pos = x
			end
			self.button:SetPosition(pos + self.dragPosDiff)
		end
	end)
	self.button:SetOnClick(OnToggleTauntEnemyBuff)
	local scale = 50 / math.max(self.button:GetSize())
	self.button:SetScale(scale, scale, scale)
	local w, h = self.button:GetSize()
	self.width = w * scale
	self.height = h * scale
	self.inst:DoPeriodicTask(0.5, function()
		local inventory = _G.ThePlayer.replica.inventory:Has("battlesong_instant_taunt", 1)
		local backpack = _G.ThePlayer.replica.inventory:GetEquippedItem(_G.EQUIPSLOTS.BODY) or nil
		local backpackitems = backpack and backpack.replica.container and backpack.replica.container:Has("battlesong_instant_taunt", 1) or nil
		if inventory then
			self.button:Show()
		else
			self.button:Hide()
		end
		
		if backpack and backpackitems ~= nil then
			if backpackitems then
				self.button:Show()
			else
				self.button:Hide()
			end
		end
    end)
	self.button:SetTooltip("Taunt nearby enemies, cost 16 inspiration to sing")
end)

local ButtonRepelEnemy = Class(Widget, function(self, inst)
	Widget._ctor(self, "ButtonRepelEnemy")
	self.button = self:AddChild(ImageButton("images/Startling_Soliloquy.xml", "Startling_Soliloquy.tex", nil, nil, nil, nil, {1,1}, {0,0}))
	local dragging = false
	self.button.OnMouseButton = function(inst, button, down, x, y)
		print(self, button, down, x, y)
		if button == 1001 then
			if down then
				dragging = true
				local mousepos = TheInput:GetScreenPosition()
				self.dragPosDiff = self.button:GetPosition() - mousepos
			else
				dragging = false
			end
		end	
	end
	
	self.followhandler = TheInput:AddMoveHandler(function(x,y)
		if dragging then
			local pos
			if type(x) == "number" then
				pos = Vector3(x, y, 1)
			else
				pos = x
			end
			self.button:SetPosition(pos + self.dragPosDiff)
		end
	end)
	self.button:SetOnClick(OnToggleRepelEnemyBuff)
	local scale = 50 / math.max(self.button:GetSize())
	self.button:SetScale(scale, scale, scale)
	local w, h = self.button:GetSize()
	self.width = w * scale
	self.height = h * scale
	self.inst:DoPeriodicTask(0.5, function()
		local inventory = _G.ThePlayer.replica.inventory:Has("battlesong_instant_panic", 1)
		local backpack = _G.ThePlayer.replica.inventory:GetEquippedItem(_G.EQUIPSLOTS.BODY) or nil
		local backpackitems = backpack and backpack.replica.container and backpack.replica.container:Has("battlesong_instant_panic", 1) or nil
		if inventory then
			self.button:Show()
		else
			self.button:Hide()
		end
		
		if backpack and backpackitems ~= nil then
			if backpackitems then
				self.button:Show()
			else
				self.button:Hide()
			end
		end
    end)
	self.button:SetTooltip("Makes nearby enemies panic, cost 16 inspiration to sing")
end)

local ButtonFireproof = Class(Widget, function(self, inst)
	Widget._ctor(self, "ButtonFireproof")
	self.button = self:AddChild(ImageButton("images/Fireproof_Falsetto.xml", "Fireproof_Falsetto.tex", nil, nil, nil, nil, {1,1}, {0,0}))
	local dragging = false
	self.button.OnMouseButton = function(inst, button, down, x, y)
		print(self, button, down, x, y)
		if button == 1001 then
			if down then
				dragging = true
				local mousepos = TheInput:GetScreenPosition()
				self.dragPosDiff = self.button:GetPosition() - mousepos
			else
				dragging = false
			end
		end	
	end
	
	self.followhandler = TheInput:AddMoveHandler(function(x,y)
		if dragging then
			local pos
			if type(x) == "number" then
				pos = Vector3(x, y, 1)
			else
				pos = x
			end
			self.button:SetPosition(pos + self.dragPosDiff)
		end
	end)
	self.button:SetOnClick(OnToggleFireproofBuff)
	local scale = 50 / math.max(self.button:GetSize())
	self.button:SetScale(scale, scale, scale)
	local w, h = self.button:GetSize()
	self.width = w * scale
	self.height = h * scale
	self.inst:DoPeriodicTask(0.5, function()
		local inventory = _G.ThePlayer.replica.inventory:Has("battlesong_fireresistance", 1)
		local backpack = _G.ThePlayer.replica.inventory:GetEquippedItem(_G.EQUIPSLOTS.BODY) or nil
		local backpackitems = backpack and backpack.replica.container and backpack.replica.container:Has("battlesong_fireresistance", 1) or nil
		if inventory then
			self.button:Show()
		else
			self.button:Hide()
		end
		
		if backpack and backpackitems ~= nil then
			if backpackitems then
				self.button:Show()
			else
				self.button:Hide()
			end
		end
    end)
	self.button:SetTooltip("Reduces fire damage by 33%")
end)

return {ButtonWeapon, ButtonRegen, ButtonRegenSanity, ButtonHalfSanity, ButtonTauntEnemy, ButtonRepelEnemy, ButtonFireproof}