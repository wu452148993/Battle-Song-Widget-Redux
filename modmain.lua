Assets = {
	Asset("ATLAS", "images/Weaponized_Warble.xml"),
	Asset("IMAGE", "images/Weaponized_Warble.tex"),
	Asset("ATLAS", "images/Heartrending_Ballad.xml"),
	Asset("IMAGE", "images/Heartrending_Ballad.tex"),
	Asset("ATLAS", "images/Clear_Minded_Cadenza.xml"),
	Asset("IMAGE", "images/Clear_Minded_Cadenza.tex"),
	Asset("ATLAS", "images/Bel_Canto_of_Courage.xml"),
	Asset("IMAGE", "images/Bel_Canto_of_Courage.tex"),
	Asset("ATLAS", "images/Rude_Interlude.xml"),
	Asset("IMAGE", "images/Rude_Interlude.tex"),
	Asset("ATLAS", "images/Startling_Soliloquy.xml"),
	Asset("IMAGE", "images/Startling_Soliloquy.tex"),
	Asset("ATLAS", "images/Fireproof_Falsetto.xml"),
	Asset("IMAGE", "images/Fireproof_Falsetto.tex"),
}

local _G = GLOBAL
local require = _G.require
local TheSim = _G.TheSim

local buttons = require("widgets/BattleSongWidget")
local backpack = GetModConfigData("backpack")

local WeaponDurabilityHUD = buttons[1]
local HealthRegenHUD = buttons[2]
local SanityRegenHUD = buttons[3]
local HalfSanityHUD = buttons[4]
local TauntEnemyHUD = buttons[5]
local RepelEnemyHUD = buttons[6]
local FireproofHUD = buttons[7]

local function WidgetPosition(self)
	if backpack == 1 then
		if self.buttonWeapon then
			self.buttonWeapon:SetPosition(-250, 100)
		end
		if self.buttonRegen then
			self.buttonRegen:SetPosition(-190, 100)
		end
		if self.buttonRegenSanity then
			self.buttonRegenSanity:SetPosition(-130, 100)
		end
		if self.buttonHalfSanity then
			self.buttonHalfSanity:SetPosition(-70, 100)
		end
		if self.buttonTauntEnemy then
			self.buttonTauntEnemy:SetPosition(-250, 160)
		end
		if self.buttonRepelEnemy then
			self.buttonRepelEnemy:SetPosition(-190, 160)
		end
		if self.buttonFireproof then
			self.buttonFireproof:SetPosition(-130, 160)
		end
		
	elseif backpack == 2 then
		if self.buttonWeapon then
			self.buttonWeapon:SetPosition(-250, 150)
		end
		if self.buttonRegen then
			self.buttonRegen:SetPosition(-190, 150)
		end
		if self.buttonRegenSanity then
			self.buttonRegenSanity:SetPosition(-130, 150)
		end
		if self.buttonHalfSanity then
			self.buttonHalfSanity:SetPosition(-70, 150)
		end
		if self.buttonTauntEnemy then
			self.buttonTauntEnemy:SetPosition(-250, 210)
		end
		if self.buttonRepelEnemy then
			self.buttonRepelEnemy:SetPosition(-190, 210)
		end
		if self.buttonFireproof then
			self.buttonFireproof:SetPosition(-130, 210)
		end
	end
end

local function BattleSongsControl(self)
local HUD_Status = true
	if _G.ThePlayer.prefab ~= "wathgrithr" then
		return
	end
if GetModConfigData("shortcut_key") and GetModConfigData("shortcut_key") then
	_G.TheInput:AddKeyDownHandler(GetModConfigData("shortcut_key"),function()
	if HUD_Status == true and _G.ThePlayer.prefab == "wathgrithr" and not _G.ThePlayer.HUD:IsChatInputScreenOpen() and not _G.ThePlayer.HUD:IsConsoleScreenOpen() and not _G.ThePlayer.HUD.writeablescreen then
	_G.ThePlayer.components.talker:Say("Battle Song Widget : Hide") 
		self.buttonWeapon:Hide()
		self.buttonRegen:Hide()
		self.buttonRegenSanity:Hide()
		self.buttonHalfSanity:Hide()
		self.buttonTauntEnemy:Hide()
		self.buttonRepelEnemy:Hide()
		self.buttonFireproof:Hide()
		HUD_Status = false
	elseif HUD_Status == false and _G.ThePlayer.prefab == "wathgrithr" and not _G.ThePlayer.HUD:IsChatInputScreenOpen() and not _G.ThePlayer.HUD:IsConsoleScreenOpen() and not _G.ThePlayer.HUD.writeablescreen then
	_G.ThePlayer.components.talker:Say("Battle Song Widget : Show") 
		self.buttonWeapon:Show()
		self.buttonRegen:Show()
		self.buttonRegenSanity:Show()
		self.buttonHalfSanity:Show()
		self.buttonTauntEnemy:Show()
		self.buttonRepelEnemy:Show()
		self.buttonFireproof:Show()
		HUD_Status = true
	end
	end)
end
	self.buttonWeapon = self.bottom_root:AddChild(WeaponDurabilityHUD())
	self.buttonRegen = self.bottom_root:AddChild(HealthRegenHUD())
	self.buttonRegenSanity = self.bottom_root:AddChild(SanityRegenHUD())
	self.buttonHalfSanity = self.bottom_root:AddChild(HalfSanityHUD())
	self.buttonTauntEnemy = self.bottom_root:AddChild(TauntEnemyHUD())
	self.buttonRepelEnemy = self.bottom_root:AddChild(RepelEnemyHUD())
	self.buttonFireproof = self.bottom_root:AddChild(FireproofHUD())
	WidgetPosition(self)
	self.owner.HUD.inst:ListenForEvent("refreshhudsize", function(_self, scale) WidgetPosition(self) end)
end

AddClassPostConstruct("widgets/controls", BattleSongsControl)