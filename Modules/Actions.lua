local TMW 					= TMW
local CNDT 					= TMW.CNDT
local Env 					= CNDT.Env
local strlowerCache  		= TMW.strlowerCache

local A   					= Action	
local Listener				= A.Listener
local toNum 				= A.toNum
local UnitCooldown			= A.UnitCooldown
local CombatTracker			= A.CombatTracker
local Unit					= A.Unit 
local Player				= A.Player 
local LoC 					= A.LossOfControl
local MultiUnits			= A.MultiUnits
local EnemyTeam				= A.EnemyTeam
local FriendlyTeam			= A.FriendlyTeam
local TriggerGCD			= A.Enum.TriggerGCD
local GetToggle				= A.GetToggle
local BurstIsON				= A.BurstIsON
local AuraIsValid			= A.AuraIsValid

-------------------------------------------------------------------------------
-- Remap
-------------------------------------------------------------------------------
local A_GetPing, A_GetCurrentGCD, A_GetSpellInfo, A_GetSpellDescription 

Listener:Add("ACTION_EVENT_ACTIONS", "ADDON_LOADED", function(addonName) 
	if addonName == ACTION_CONST_ADDON_NAME then 
		A_GetPing 				= A.GetPing
		A_GetCurrentGCD			= A.GetCurrentGCD
		A_GetSpellInfo			= A.GetSpellInfo
		A_GetSpellDescription	= A.GetSpellDescription
		Listener:Remove("ACTION_EVENT_ACTIONS", "ADDON_LOADED")	
	end 	
end)
-------------------------------------------------------------------------------
	  
local Azerite 				= LibStub("AzeriteTraits")
local Pet					= LibStub("PetLibrary")
local SpellRange			= LibStub("SpellRange-1.0")
local IsSpellInRange 		= SpellRange.IsSpellInRange	  
local SpellHasRange			= SpellRange.SpellHasRange
local isSpellRangeException = {
	-- Chi Burst 
	[123986] 	= true,
	-- Eye Beam
	[198013] 	= true,
	-- Darkflight
	[68992] 	= true,
	-- SpatialRift
	[256948]	= true,
	-- Shadowmeld
	[58984]		= true,
	-- LightsJudgment
	[255647]	= true,
	-- EveryManforHimself
	[59752]		= true, 
	-- EscapeArtist
	[20589]		= true,
	-- Stoneform
	[20594] 	= true, 
	-- Fireblood
	[265221]	= true,
	-- Regeneratin
	[291944]	= true,
	-- WilloftheForsaken
	[7744]		= true,
	-- Berserking
	[26297]		= true,
	-- WarStomp
	[20549]		= true, 
	-- BloodFury
	[33697]		= true,
	[20572]		= true,
	[33702]		= true,	
	-- ArcanePulse
	[260364]	= true,
	-- AncestralCall
	[274738]	= true,
	-- BullRush
	[255654]	= true,
	-- ArcaneTorrent
	[28730]		= true, 
	[155145]	= true,
	[80483]		= true,
	[25046]		= true, 
	[232633]	= true,
	[50613]		= true,
	[69179]		= true,
	[202719]	= true,
	[129597]	= true,
	-- RocketBarrage 
	[69041]		= true,
	-- RocketJump
	[69070]		= true,
	-- Metamorphosis 
	[191427]	= true,
	[162264]	= true,
	[187827]	= true,
	-- Typhoon
	[132469]	= true,
}
local ItemHasRange 			= ItemHasRange
local isItemRangeException 	= {}
local isItemUseException	= {
	-- Crest of Pa'ku
	[165581] = true, 
	-- Mr. Munchykins
	[155567] = true, 
	-- Ingenious Mana Battery
	[169344] = true, 
}
local itemCategory 			= {
	[169311] = "DPS",	-- Ashvane's Razor Coral
	[167555] = "DPS",	-- Pocket-Sized Computation Device
    [165806] = "DPS", 	-- Sinister Gladiator's Maledict
	[165056] = "DEFF", 	-- Sinister Gladiator's Emblem
	[161675] = "DEFF", 	-- Dread Gladiator's Emblem
	[159618] = "DEFF", 	-- Mchimba's Ritual Bandages (Tank Item)
}

local _G, type, pairs, select, unpack, table, setmetatable, math, string = 	
	  _G, type, pairs, select, unpack, table, setmetatable, math, string 
	  
local ACTION_CONST_CACHE_DEFAULT_TIMER								= _G.ACTION_CONST_CACHE_DEFAULT_TIMER
local ACTION_CONST_EQUIPMENT_MANAGER								= _G.ACTION_CONST_EQUIPMENT_MANAGER
local ACTION_CONST_HEARTOFAZEROTH									= _G.ACTION_CONST_HEARTOFAZEROTH
local ACTION_CONST_POTION											= _G.ACTION_CONST_POTION
local ACTION_CONST_SPELLID_FREEZING_TRAP							= _G.ACTION_CONST_SPELLID_FREEZING_TRAP
local ACTION_CONST_SPELLID_STORM_BOLT								= _G.ACTION_CONST_SPELLID_STORM_BOLT
local ACTION_CONST_TRINKET1											= _G.ACTION_CONST_TRINKET1
local ACTION_CONST_TRINKET2											= _G.ACTION_CONST_TRINKET2
local ACTION_CONST_WARRIOR_FURY										= _G.ACTION_CONST_WARRIOR_FURY	  
	  	  
local tinsert 				= table.insert	  
local tsort 				= table.sort	  
local huge 					= math.huge  
local wipe 					= _G.wipe	
local strgsub				= string.gsub
local strgmatch				= string.gmatch
local strlen				= string.len

local GetNetStats 			= _G.GetNetStats	  
local GameLocale 			= _G.GetLocale()

-- Spell 
local Spell					= _G.Spell

local IsPlayerSpell, IsUsableSpell, IsHelpfulSpell, IsHarmfulSpell, IsAttackSpell, IsCurrentSpell =
	  IsPlayerSpell, IsUsableSpell, IsHelpfulSpell, IsHarmfulSpell, IsAttackSpell, IsCurrentSpell

local 	  GetSpellTexture, GetSpellLink, GetSpellInfo, GetSpellDescription, GetSpellCount,	GetSpellPowerCost, 	   CooldownDuration, GetSpellCharges, GetHaste, GetShapeshiftFormCooldown, GetSpellBaseCooldown, GetSpellAutocast = 
	  TMW.GetSpellTexture, GetSpellLink, GetSpellInfo, GetSpellDescription, GetSpellCount, 	GetSpellPowerCost, Env.CooldownDuration, GetSpellCharges, GetHaste, GetShapeshiftFormCooldown, GetSpellBaseCooldown, GetSpellAutocast

-- Item 	  
local IsUsableItem, IsHelpfulItem, IsHarmfulItem, IsCurrentItem  =
	  IsUsableItem, IsHelpfulItem, IsHarmfulItem, IsCurrentItem
  
local GetItemInfo, GetItemIcon, GetItemInfoInstant, GetItemSpell = 
	  GetItemInfo, GetItemIcon, GetItemInfoInstant, GetItemSpell	  

-- Talent	  
local     TalentMap,     PvpTalentMap 	=
	  Env.TalentMap, Env.PvpTalentMap

-- Unit 	  
local UnitAura							= UnitAura 
local UnitIsUnit, UnitIsPlayer		   	= UnitIsUnit, UnitIsPlayer

-- Empty 
local empty1, empty2 		= { 0, -1 }, { 0, 0, 0, 0, 0, 0, 0, 0 } 
local emptycreate			= {}

-- Auras
local IsBreakAbleDeBuff = {}
local IsCycloneDeBuff = {
	[GetSpellInfo(33786)] = true,
}
do 
	local tempTable = A.GetAuraList("BreakAble")	
	local tempTableInSkipID = A.GetAuraList("Rooted")
	for j = 1, #tempTable do 
		local isRoots 
		for l = 1, #tempTableInSkipID do 
			if tempTable[j] == tempTableInSkipID[l] then 
				isRoots = true 
				break 
			end 			
		end 
		
		if not isRoots then 
			IsBreakAbleDeBuff[GetSpellInfo(tempTable[j])] = true 
		end 
	end 
end 

-- Player 
local GCD_OneSecond 		= {
	[103] = true, 			-- Feral
	[259] = true, 			-- Assassination
	[260] = true, 			-- Outlaw
	[261] = true, 			-- Subtlety
	[268] = true, 			-- Brewmaster
	[269] = true 			-- Windwalker
}

local function sortByHighest(x, y)
	return x > y
end

-------------------------------------------------------------------------------
-- Global Cooldown
-------------------------------------------------------------------------------
function A.GetCurrentGCD()
	-- @return number 
	-- Current left in second time of in use (spining) GCD, 0 if GCD is not active
	return CooldownDuration("gcd") -- TMW.GCDSpell
end 
A.GetCurrentGCD = A.MakeFunctionCachedStatic(A.GetCurrentGCD)

function A.GetGCD()
	-- @return number 
	-- Summary time of GCD 
	if TMW.GCD > 0 then
		-- Depended by last used spell 
		return TMW.GCD
	else 
		if GCD_OneSecond[A.PlayerSpec] then 
			return 1
		else 
			-- Depended on current haste
			return 1.5 / (1 + GetHaste() / 100) -- 1.5 / (1 + UnitSpellHaste("player") * 0.01)
		end 
	end    
end 

function A.IsActiveGCD()
	-- @return boolean 
	return TMW.GCD ~= 0
end 

function A:IsRequiredGCD()
	-- @return boolean, number 
	-- true / false if required, number in seconds how much GCD will be used by action
	if self.Type == "Spell" and TriggerGCD[self.ID] and TriggerGCD[self.ID] > 0 then 
		return true, TriggerGCD[self.ID]
	end 
	
	return false, 0
end 

-------------------------------------------------------------------------------
-- Global Stop Conditions
-------------------------------------------------------------------------------
function A.GetPing()
	-- @return number
	return select(4, GetNetStats()) / 1000
end 
A.GetPing = A.MakeFunctionCachedStatic(A.GetPing, 0)

function A:ShouldStopByGCD()
	-- @return boolean 
	-- By Global Cooldown
	return self:IsRequiredGCD() and self.GetGCD() - self.GetPing() > 0.301 and self.GetCurrentGCD() >= self.GetPing() + 0.65
end 

function A.ShouldStop()
	-- @return boolean 
	-- By Casting
	return Unit("player"):IsCasting()
end 
A.ShouldStop = A.MakeFunctionCachedStatic(A.ShouldStop, 0)

-------------------------------------------------------------------------------
-- Spell
-------------------------------------------------------------------------------
local spellbasecache  = setmetatable({}, { __index = function(t, v)
	local cd = GetSpellBaseCooldown(v)
	if cd then
		t[v] = cd / 1000
		return t[v]
	end     
	return 0
end })

function A:GetSpellBaseCooldown()
	-- @return number (seconds)
	-- Gives the (unmodified) cooldown
	return spellbasecache[self.ID]
end 

local spellpowercache = setmetatable({}, { __index = function(t, v)
	local pwr = GetSpellPowerCost(A.GetSpellInfo(v))
	if pwr and pwr[1] then
		t[v] = { pwr[1].cost, pwr[1].type }
		return t[v]
	end     
	return empty1
end })

function A:GetSpellPowerCostCache()
	-- THIS IS STATIC CACHED, ONCE CALLED IT WILL NOT REFRESH REALTIME POWER COST
	-- @usage A:GetSpellPowerCostCache() or A.GetSpellPowerCostCache(spellID)
	-- @return cost (@number), type (@number)
	local ID = self
	if type(self) == "table" then 
		ID = self.ID 
	end
    return unpack(spellpowercache[ID]) 
end

function A.GetSpellPowerCost(self)
	-- RealTime with cycle cache
	-- @usage A:GetSpellPowerCost() or A.GetSpellPowerCost(123)
	-- @return cost (@number), type (@number)
	local name 
	if type(self) == "table" then 
		name = self:Info()
	else 
		name = A_GetSpellInfo(self)
	end 
	
	local pwr = GetSpellPowerCost(name)
	if pwr and pwr[1] then
		return pwr[1].cost, pwr[1].type
	end   	
	return 0, -1
end 
A.GetSpellPowerCost = A.MakeFunctionCachedDynamic(A.GetSpellPowerCost)

local str_null 			= ""
local str_comma			= ","
local str_point			= "."
local pattern_gmatch 	= "%f[%d]%d[.,%d]*%f[%D]"
local pattern_gsubspace	= "%s"
local descriptioncache 	= setmetatable({}, { __index = function(t, v)
	-- Stores formated string of description
	t[v] = strgsub(strgsub(v, pattern_gsubspace, str_null), str_comma, str_point)
	return t[v]
end })
local descriptiontemp	= {
	-- Stores temprorary data 
}
function A.GetSpellDescription(self)
	-- @usage A:GetSpellDescription() or A.GetSpellDescription(18)
	-- @return table array like where first index is highest number of the description
	local spellID = type(self) == "table" and self.ID or self
	local text = GetSpellDescription(spellID)
	
	if text then 
		-- The way to re-use table anyway is found now 
		if not descriptiontemp[spellID] then 
			descriptiontemp[spellID] = {}
		else 
			wipe(descriptiontemp[spellID])
		end 
		
		for value in strgmatch(descriptioncache[text], pattern_gmatch) do 
			if GameLocale == "frFR" and strlen(value) > 3 then -- French users have wierd syntax of floating dots
				tinsert(descriptiontemp[spellID], toNum[strgsub(value, str_point, str_null)])
			else 
				tinsert(descriptiontemp[spellID], toNum[value])
			end 
		end
		
		if #descriptiontemp[spellID] > 1 then
			tsort(descriptiontemp[spellID], sortByHighest)
		end 

		return descriptiontemp[spellID]
	end
	
	return empty2 
end
A.GetSpellDescription = A.MakeFunctionCachedDynamic(A.GetSpellDescription)

function A:GetSpellCastTime()
	-- @return number 
	local _,_,_, castTime = GetSpellInfo(self.ID)
	return (castTime or 0) / 1000 
end 

function A:GetSpellCastTimeCache()
	-- @usage A:GetSpellCastTimeCache() or A.GetSpellCastTimeCache(116)
	-- @return number 
	if type(self) == "table" then 
		return (select(4, self:Info()) or 0) / 1000 
	else
		return (select(4, A_GetSpellInfo(self)) or 0) / 1000
	end  
end 

function A:GetSpellCharges()
	-- @return number
	local charges = GetSpellCharges(self:Info())
	if not charges then 
		charges = 0
	end 
	
	return charges
end

function A:GetSpellChargesMax()
	-- @return number
	local _, max_charges = GetSpellCharges(self:Info())
	if not max_charges then 
		max_charges = 0
	end 
	
	return max_charges	
end

function A:GetSpellChargesFrac()
	-- @return number	
	local charges, maxCharges, start, duration = GetSpellCharges(self:Info())
	if charges == maxCharges then 
		return maxCharges
	end
	
	return charges + ((TMW.time - start) / duration)  
end

function A:GetSpellChargesFullRechargeTime()
	-- @return number
	local _, _, _, duration = GetSpellCharges(self:Info())
	return duration and self:GetSpellChargesMax() - self:GetSpellChargesFrac() * duration or 0
end 

function A:GetSpellTimeSinceLastCast()
	-- @return number (seconds after last time casted - during fight)
	return CombatTracker:GetSpellLastCast("player", self:Info())
end 

function A:GetSpellCounter()
	-- @return number (total count casted of the spell - during fight)
	return CombatTracker:GetSpellCounter("player", self:Info())
end 

function A:GetSpellAmount(unitID, X)
	-- @return number (taken summary amount of the spell - during fight)
	-- X during which lasts seconds 
	if X then 
		return CombatTracker:GetSpellAmountX(unitID or "player", self:Info(), X)
	else 
		return CombatTracker:GetSpellAmount(unitID or "player", self:Info())
	end 
end 

function A:GetSpellAbsorb(unitID)
	-- @return number (taken current absort amount of the spell - during fight)
	return CombatTracker:GetAbsorb(unitID or "player", self:Info())
end 

function A:GetSpellAutocast()
	-- @return boolean, boolean 
	-- Returns autocastable, autostate 
	return GetSpellAutocast(self:Info())
end 

function A:IsSpellLastGCD(byID)
	-- @return boolean
	return (byID and self.ID == A.LastPlayerCastID) or (not byID and self:Info() == A.LastPlayerCastName)
end 

function A:IsSpellLastCastOrGCD(byID)
	-- @return boolean
	return self:IsSpellLastGCD(byID) or self:IsSpellInCasting()
end 

function A:IsSpellInFlight()
	-- @return boolean
	return UnitCooldown:IsSpellInFly("player", self.ID) -- Retail ID
end 

function A:IsSpellInRange(unitID)
	-- @usage A:IsSpellInRange() or A.IsSpellInRange(spellID, unitID)
	-- @return boolean
	local ID, Name
	if type(self) == "table" then 
		ID = self.ID 
		Name = self:Info()
	else 
		ID = self 
		Name = A_GetSpellInfo(ID)
	end		
	return IsSpellInRange(Name, unitID) == 1 or (Pet:IsActive() and Pet:IsInRange(ID, unitID))  
end 

function A:IsSpellInCasting()
	-- @return boolean 
	return Unit("player"):IsCasting() == self:Info()
end 

function A:IsSpellCurrent()
	-- @return boolean
	return IsCurrentSpell(self:Info())
end 

function A:CanSafetyCastHeal(unitID, offset)
	-- @return boolean 
	local castTime = self:GetSpellCastTime()
	return castTime and (castTime == 0 or castTime > Unit(unitID):TimeToDie() + self.GetCurrentGCD() + (offset or self.GetGCD())) or false 
end 

-------------------------------------------------------------------------------
-- Talent 
-------------------------------------------------------------------------------
function A:IsSpellLearned()
	-- @usage A:IsSpellLearned() or A.IsSpellLearned(spellID)
	-- @return boolean about selected or not (talent or pvptalent)	
	local ID, Name
	if type(self) == "table" then 
		ID = self.ID 
		Name = self:Info()
	else 
		ID = self 
		Name = A_GetSpellInfo(ID)
	end	
	local lowerName = strlowerCache[Name]
	return TalentMap[lowerName] or (A.IsInPvP and (not A.IsInDuel or A.IsInWarMode) and PvpTalentMap[lowerName]) or Azerite:IsLearnedByConflictandStrife(Name) or false 
end

-------------------------------------------------------------------------------
-- Determine
-------------------------------------------------------------------------------
function A.DetermineHealObject(unitID, skipRange, skipLua, skipShouldStop, skipUsable, ...)
	-- @return object or nil 
	-- Note: :PredictHeal(unitID) must be only ! Use self.ID or self:Info() inside to determine by that which spell is it 
	for i = 1, select("#", ...) do 
		local object = select(i, ...)
		if object:IsReady(unitID, skipRange, skipLua, skipShouldStop, skipUsable) and object:PredictHeal(unitID) then 
			return object
		end 
	end 
end 

function A.DetermineUsableObject(unitID, skipRange, skipLua, skipShouldStop, skipUsable, ...)
	-- @return object or nil 
	for i = 1, select("#", ...) do 
		local object = select(i, ...)
		if object:IsReady(unitID, skipRange, skipLua, skipShouldStop, skipUsable) then 
			return object
		end 
	end 
end 

function A.DetermineIsCurrentObject(...)
	-- @return object or nil 
	for i = 1, select("#", ...) do 
		local object = select(i, ...)
		if object:IsCurrent() then 
			return object
		end 
	end 
end 

function A.DetermineCountGCDs(...)
	-- @return number, count of required summary GCD times to use all in vararg
	local count = 0
	for i = 1, select("#", ...) do 
		local object = select(i, ...)		
		if (not object.isStance or A.PlayerClass ~= "WARRIOR") and object:IsRequiredGCD() and not object:IsBlocked() and not object:IsBlockedBySpellLevel() and (not object.isTalent or object:IsSpellLearned()) and object:GetCooldown() <= A_GetPing() + ACTION_CONST_CACHE_DEFAULT_TIMER + A_GetCurrentGCD() then 
			count = count + 1
		end 
	end 	
	return count
end 

function A.DeterminePowerCost(...)
	-- @return number (required power to use all varargs actions)
	local total = 0
	for i = 1, select("#", ...) do 
		local object = select(i, ...)
		if object and object:IsReadyToUse(nil, true, true) then 
			total = total + object:GetSpellPowerCostCache()
		end 
	end 
	return total
end 

function A.DetermineCooldown(...)
	-- @return number (required summary cooldown time to use all varargs actions)
	local total = 0
	for i = 1, select("#", ...) do 
		local object = select(i, ...)
		if object then 
			total = total + object:GetCooldown()
		end 
	end 
	return total
end 

function A.DetermineCooldownAVG(...)
	-- @return number (required AVG cooldown to use all varargs actions)
	local total, count = 0, 0
	for i = 1, select("#", ...) do 
		local object = select(i, ...)
		if object then 
			total = total + object:GetCooldown()
			count = count + 1
		end 
	end 
	if count > 0 then 
		return total / count
	else 
		return 0 
	end 
end 

-------------------------------------------------------------------------------
-- Azerite 
-------------------------------------------------------------------------------
function A:GetAzeriteRank()
	-- @return number (0 - is not exists)
	return Azerite:GetRank(self.ID)
end 

-------------------------------------------------------------------------------
-- Racial (template)
-------------------------------------------------------------------------------	 
local Racial = {
	GetRaceBySpellName 										= {
		-- Darkflight
		[Spell:CreateFromSpellID(68992):GetSpellName()] 	= "Worgen",
		-- SpatialRift
		[Spell:CreateFromSpellID(256948):GetSpellName()] 	= "VoidElf", 				-- NO API 
		-- Shadowmeld
		[Spell:CreateFromSpellID(58984):GetSpellName()] 	= "NightElf",
		-- LightsJudgment
		[Spell:CreateFromSpellID(255647):GetSpellName()] 	= "LightforgedDraenei",
		-- Haymaker
		[Spell:CreateFromSpellID(287712):GetSpellName()] 	= "KulTiran",
		-- EveryManforHimself
		[Spell:CreateFromSpellID(59752):GetSpellName()] 	= "Human", 					-- ThinHuman (? wut)
		-- EscapeArtist
		[Spell:CreateFromSpellID(20589):GetSpellName()] 	= "Gnome",
		-- Stoneform
		[Spell:CreateFromSpellID(20594):GetSpellName()] 	= "Dwarf",
		-- GiftoftheNaaru
		[Spell:CreateFromSpellID(121093):GetSpellName()] 	= "Draenei",
		-- Fireblood
		[Spell:CreateFromSpellID(265221):GetSpellName()] 	= "DarkIronDwarf", 
		-- QuakingPalm
		[Spell:CreateFromSpellID(107079):GetSpellName()] 	= "Pandaren",
		-- Regeneratin
		[Spell:CreateFromSpellID(291944):GetSpellName()] 	= "ZandalariTroll",
		-- WilloftheForsaken
		[Spell:CreateFromSpellID(7744):GetSpellName()] 		= "Scourge", 				-- (this is confirmed) Undead 
		-- Berserking
		[Spell:CreateFromSpellID(26297):GetSpellName()] 	= "Troll",
		-- WarStomp
		[Spell:CreateFromSpellID(20549):GetSpellName()] 	= "Tauren",
		-- BloodFury
		[Spell:CreateFromSpellID(33697):GetSpellName()] 	= "Orc",
		-- ArcanePulse
		[Spell:CreateFromSpellID(260364):GetSpellName()] 	= "Nightborne",
		-- AncestralCall
		[Spell:CreateFromSpellID(274738):GetSpellName()] 	= "MagharOrc",
		-- BullRush
		[Spell:CreateFromSpellID(255654):GetSpellName()] 	= "HighmountainTauren",
		-- ArcaneTorrent
		[Spell:CreateFromSpellID(28730):GetSpellName()] 	= "BloodElf",	
		-- RocketJump
		[Spell:CreateFromSpellID(69070):GetSpellName()] 	= "Goblin",					-- NO API - Should we add RocketBarrage (?) or it's crap damaged spell	
		-- RocketBarrage
		-- NO API
	},
	Temp													= {
		TotalAndMagic 										= {"TotalImun", "DamageMagicImun"},
		TotalAndPhysAndCC									= {"TotalImun", "DamagePhysImun", "CCTotalImun"},
		TotalAndPhysAndCCAndStun							= {"TotalImun", "DamagePhysImun", "CCTotalImun", "StunImun"},
	},
	-- Functions	
	CanUse 													= function(this, self, unitID)
		-- @return boolean 
		A.PlayerRace = this.GetRaceBySpellName[self:Info()]
		
		-- Damage  
		if A.PlayerRace == "LightforgedDraenei" then 
			return 	LoC:Get("SCHOOL_INTERRUPT", "HOLY") == 0 and 
					LoC:IsMissed("SILENCE") and 
					(
						(
							unitID and 	
							Unit(unitID):IsEnemy() and 
							Unit(unitID):GetRange() <= 5  and 
							self:AbsentImun(unitID, this.Temp.TotalAndMagic) 
						) or 						
						MultiUnits:GetByRange(5, 1) >= 1						
					) and 
					(
						not A.IsInPvP or 
						not EnemyTeam("HEALER"):IsBreakAble(5)
					)	
		end 
		
		if A.PlayerRace == "Nightborne" then
			return	LoC:Get("SCHOOL_INTERRUPT", "ARCANE") == 0 and 
					LoC:IsMissed("SILENCE") and		
					(
						(
							unitID and 	
							Unit(unitID):IsEnemy() and 
							Unit(unitID):GetRange() <= 5 and 
							self:AbsentImun(unitID, this.Temp.TotalAndMagic)
						) or 
						(
							(
								not unitID or 
								not Unit(unitID):IsEnemy() 
							) and 
							MultiUnits:GetByRange(5, 3) >= 3
						)
					) and 
					(
						not A.IsInPvP or 
						not EnemyTeam("HEALER"):IsBreakAble(5)
					)	
		end 
		
		-- Purge 
		if A.PlayerRace == "BloodElf" then 
			return 	LoC:Get("SCHOOL_INTERRUPT", "ARCANE") == 0 and 
					LoC:IsMissed("SILENCE") 
		end 
		
		-- Healing 
		if A.PlayerRace == "Draenei" then 
			if not unitID or Unit(unitID):IsEnemy() then 
				unitID = "player" 
			end 
			
			return  LoC:Get("SCHOOL_INTERRUPT", "HOLY") == 0 and 
					LoC:IsMissed("SILENCE") and 
					self:AbsentImun(unitID)
		end 
		
		if A.PlayerRace == "ZandalariTroll" then 
			return 	LoC:Get("SCHOOL_INTERRUPT", "NATURE") == 0 and 
					LoC:IsMissed("SILENCE") and 
					Unit("player"):GetStayTime() > 0 
		end 
		
		-- Iterrupts 
		if A.PlayerRace == "Pandaren" then 
			return 	unitID and 		
					Unit(unitID):IsControlAble("incapacitate") and 
					self:AbsentImun(unitID, this.Temp.TotalAndPhysAndCC, true)
		end 
		
		if A.PlayerRace == "KulTiran" then 
			return 	unitID and 
					Unit(unitID):IsControlAble("stun") and 
					self:AbsentImun(unitID, this.Temp.TotalAndPhysAndCC, true)
		end 
		
		if A.PlayerRace == "Tauren" then 
			return 	Player:IsStaying() and 
					(
						(
							unitID and 	
							Unit(unitID):IsEnemy() and 
							Unit(unitID):GetRange() <= 8 and 					
							Unit(unitID):IsControlAble("stun") and 
							self:AbsentImun(unitID, this.Temp.TotalAndPhysAndCCAndStun, true)
						) or 
						(
							(
								not unitID or 
								not Unit(unitID):IsEnemy() 
							) and 
							MultiUnits:GetByRange(8, 1) >= 1
						)
					)	
		end 
		
		if A.PlayerRace == "HighmountainTauren" then 
			return	unitID and 
					Unit(unitID):GetRange() <= 6 and 
					self:AbsentImun(unitID, this.Temp.TotalAndPhysAndCCAndStun, true)
		end 
		
		-- [NO LOGIC - ALWAYS TRUE] 
		return true 		 			
	end,
	CanAuto													= function(this, self, unitID)
		-- Loss Of Control 
		local LOC = LoC.GetExtra[A.PlayerRace]
		if LOC and LoC:IsValid(LOC.Applied, LOC.Missed) then 
			return true 
		end 	
	
		-- Damaging   
		if A.PlayerRace == "LightforgedDraenei" then 
			return true 
		end 
		
		if A.PlayerRace == "Nightborne" then 
			return unitID and Unit(unitID):GetCurrentSpeed() >= 100 
		end 	
		
		-- Purge 
		if A.PlayerRace == "BloodElf" then
			return  (
						A.IsInPvP and 
						FriendlyTeam():ArcaneTorrentMindControl()
					) or 				 
					(
						unitID and 
						(not Unit(unitID):IsEnemy() or Unit(unitID):InGroup()) and 
						Unit(unitID):GetRange() <= 8 and 
						AuraIsValid(unitID, "UsePurge", "PurgeFriendly")					
					) or 
					(
						unitID and 
						Unit(unitID):IsEnemy() and 
						Unit(unitID):GetRange() <= 8 and 
						AuraIsValid(unitID, "UsePurge", "PurgeHigh")
					)
		end 
		
		-- Healing 
		if A.PlayerRace == "Draenei"  then 
			return BurstIsON(unitID) and Unit(unitID):Health() >= Unit("player"):HealthMax() * 0.2 + (Unit(unitID):GetHEAL() * 5) + Unit(unitID):GetIncomingHeals() - (Unit(unitID):GetDMG() * 5) 
		end 

		if A.PlayerRace == "ZandalariTroll" then 
			return  Unit("player"):GetDMG() == 0 or 
					(
						A.PlayerClass == "PALADIN" and 
						Unit("player"):HasBuffs(642, true) >= (100 - Unit("player"):HealthPercent()) * 6 / 100
					) or 
					(
						A.PlayerClass == "HUNTER" and 
						Unit("player"):HasBuffs(186265, true) >= (100 - Unit("player"):HealthPercent()) * 6 / 100
					)			
		end 
				
		-- Iterrupts 
		if A.PlayerRace == "Pandaren" then 
			return Unit(unitID):IsCastingRemains() > self.GetCurrentGCD() + 0.1		  
		end 

		if A.PlayerRace == "KulTiran" then  	
			return Unit(unitID):IsCastingRemains() > self.GetCurrentGCD() + 1.1			  
		end 	
		
		if A.PlayerRace == "Tauren" then 
			return  (
						unitID and 					
						Unit(unitID):IsCastingRemains() > self.GetCurrentGCD() + 0.7
					) or 
					(
						(
							not unitID or 
							not Unit(unitID):IsEnemy() 
						) and 
						MultiUnits:GetCasting(8, 1) >= 1
					)			  
		end 		

		-- Custom GCD
		if A.PlayerRace == "HighmountainTauren" then 
			return Unit(unitID):IsCastingRemains() > self.GetCurrentGCD() + 0.3			  
		end 	
	
		-- Control Avoid 
		if A.PlayerRace == "NightElf" then 
			-- Check Freezing Trap 
			if 	UnitCooldown:GetCooldown("arena", ACTION_CONST_SPELLID_FREEZING_TRAP) > UnitCooldown:GetMaxDuration("arena", ACTION_CONST_SPELLID_FREEZING_TRAP) - 2 and 
				UnitCooldown:IsSpellInFly("arena", ACTION_CONST_SPELLID_FREEZING_TRAP) and 
				Unit("player"):GetDR("incapacitate") > 0 
			then 
				local Caster = UnitCooldown:GetUnitID("arena", ACTION_CONST_SPELLID_FREEZING_TRAP)
				if Caster and not Player:IsStealthed() and Unit(Caster):GetRange() <= 40 and (Unit("player"):GetDMG() == 0 or not Unit("player"):IsFocused("DAMAGER")) then 
					return true 
				end 
			end 
				
			-- Check Storm Bolt 
			if 	UnitCooldown:GetCooldown("arena", ACTION_CONST_SPELLID_STORM_BOLT) > UnitCooldown:GetMaxDuration("arena", ACTION_CONST_SPELLID_STORM_BOLT) - 2 and 
				UnitCooldown:IsSpellInFly("arena", ACTION_CONST_SPELLID_STORM_BOLT) and 
				Unit("player"):GetDR("stun") > 25 -- don't waste on short durations by diminishing
			then 
				local Caster = UnitCooldown:GetUnitID("arena", ACTION_CONST_SPELLID_STORM_BOLT)
				if Caster and not Player:IsStealthed() and Unit(Caster):GetRange() <= 20 then 
					return true 
				end 
			end 
		end 			
		
		-- Sprint
		if A.PlayerRace == "Worgen" then  
			return Unit(unitID):IsMovingOut()
		end 
		
		-- Bursting 
		if ( A.PlayerRace == "DarkIronDwarf" or A.PlayerRace == "Troll" or A.PlayerRace == "Orc" or A.PlayerRace == "MagharOrc" ) then 
			return BurstIsON(unitID)
		end 	
		
		-- [NO LOGIC - ALWAYS FALSE] 
		--if A.PlayerRace == "VoidElf" or A.PlayerRace == "Goblin" then 
			return false 
		--end 		
	end, 
}

function A:IsRacialReady(unitID, skipRange, skipLua, skipShouldStop)
	-- @return boolean 
	-- For [3-4, 6-8]
	return self:RacialIsON() and self:IsReady(unitID, isSpellRangeException[self.ID] or skipRange, skipLua, skipShouldStop) and Racial:CanUse(self, unitID) 
end 

function A:IsRacialReadyP(unitID, skipRange, skipLua, skipShouldStop)
	-- @return boolean 
	-- For [1-2, 5]
	return self:RacialIsON() and self:IsReadyP(unitID, isSpellRangeException[self.ID] or skipRange, skipLua, skipShouldStop) and Racial:CanUse(self, unitID) 
end 

function A:AutoRacial(unitID, skipRange, skipLua, skipShouldStop)
	-- @return boolean 
	return self:IsRacialReady(unitID, skipRange, skipLua, skipShouldStop) and Racial:CanAuto(self, unitID)
end 

-------------------------------------------------------------------------------
-- Item (provided by TMW)
-------------------------------------------------------------------------------	  
function A.GetItemDescription(self)
	-- @usage A:GetItemDescription() or A.GetItemDescription(18)
	-- @return table 
	-- Note: It returns correct value only if item holds spell 
	local _, spellID = GetItemSpell(type(self) == "table" and self.ID or self)
	if spellID then 
		return A_GetSpellDescription(spellID)
	end 
	
	return empty2
end
A.GetItemDescription = A.MakeFunctionCachedDynamic(A.GetItemDescription)

function A:GetItemCooldown()
	-- @return number
	local start, duration, enable = self.Item:GetCooldown()
	return enable ~= 0 and (duration == 0 and 0 or duration - (TMW.time - start)) or huge
end 

function A:GetItemCategory()
	-- @return string 
	-- Note: Only for Type "TrinketBySlot"
	return itemCategory[self.ID]
end 

function A:IsItemCurrent()
	-- @return boolean
	return IsCurrentItem(self:Info())
end 

-- Next works by TMW components
-- A:IsInRange(unitID) (in Shared)
-- A:GetCount() (in Shared)
-- A:GetEquipped() 
-- A:GetCooldown() (in Shared)
-- A:GetCooldownDuration() 
-- A:GetCooldownDurationNoGCD() 
-- A:GetID() 
-- A:GetName() 
-- A:HasUseEffect() 

-------------------------------------------------------------------------------
-- Shared
-------------------------------------------------------------------------------	  
function A:IsExists()   
	-- @return boolean
	if self.Type == "Spell" then 
		-- DON'T USE HERE A.GetSpellInfo COZ IT'S CACHE WHICH WILL WORK WRONG DUE RACE CHANGES
		local spellID = select(7, GetSpellInfo(self:Info())) -- Small trick, it will be nil in case of if it's not a player's spell 
		return type(spellID) == "number" and (IsPlayerSpell(spellID) or (Pet:IsActive() and Pet:IsSpellKnown(spellID)))
	end 
	
	if self.Type == "SwapEquip" then 
		return self.Equip1() or self.Equip2()
	end 
	
	return self:GetEquipped() or self:GetCount() > 0	
end

function A:IsUsable(extraCD, skipUsable)
	-- @return boolean 
	-- skipUsable can be number to check specified power
	
	if self.Type == "Spell" then 
		-- Works for pet spells 01/04/2019
		return (skipUsable or (type(skipUsable) == "number" and Unit("player"):Power() >= skipUsable) or IsUsableSpell(self:Info())) and self:GetCooldown() <= self.GetPing() + ACTION_CONST_CACHE_DEFAULT_TIMER + (self:IsRequiredGCD() and self.GetCurrentGCD() or 0) + (extraCD or 0)
	end 
	
	return not isItemUseException[self.ID] and (skipUsable or (type(skipUsable) == "number" and Unit("player"):Power() >= skipUsable) or IsUsableItem(self:Info())) and self:GetItemCooldown() <= self.GetPing() + ACTION_CONST_CACHE_DEFAULT_TIMER + (self:IsRequiredGCD() and self.GetCurrentGCD() or 0) + (extraCD or 0)
end

function A:IsHarmful()
	-- @return boolean 
	if self.Type == "Spell" then 
		return IsHarmfulSpell(self:Info()) or IsAttackSpell(self:Info())
	end 
	
	return IsHarmfulItem(self:Info())
end 

function A:IsHelpful()
	-- @return boolean 
	if self.Type == "Spell" then 
		return IsHelpfulSpell(self:Info())
	end 
	
	return IsHelpfulItem(self:Info())
end 

function A:IsInRange(unitID)
	-- @return boolean
	local unitID = unitID or "target"
	
	if UnitIsUnit("player", unitID) then 
		return true 
	end 
	
	if self.Type == "Spell" then 
		return self:IsSpellInRange(unitID)
	end 
	
	return self.Item:IsInRange(unitID)
end 

function A:IsCurrent()
	-- @return boolean
	-- Note: Only Spell, Item, Trinket 
	return (self.Type == "Spell" and self:IsSpellCurrent()) or ((self.Type == "Item" or self.Type == "Trinket") and self:IsItemCurrent()) or false 
end 

function A:HasRange()
	-- @return boolean 
	if self.Type == "Spell" then 
		return not isSpellRangeException[self.ID] and SpellHasRange(self:Info())
	end 
	
	return not isItemRangeException[self:GetID()] and ItemHasRange(self:Info())
end 

function A:GetCooldown()
	-- @return number
	if self.Type == "SwapEquip" then 
		return (Player:IsSwapLocked() and huge) or 0
	end 
	
	if self.Type == "Spell" then 
		if self.isStance then 
			local start, duration = GetShapeshiftFormCooldown(self.isStance)
			if start and start ~= 0 then
				return (duration == 0 and 0) or (duration - (TMW.time - start))
			end
			
			return 0
		else 
			return CooldownDuration(self:Info())
		end 
	end 
	
	return self:GetItemCooldown()
end 

function A:GetCount()
	-- @return number
	if self.Type == "Spell" then 
		return GetSpellCount(self.ID) or 0
	end 
	
	return self.Item:GetCount() or 0
end 

function A:AbsentImun(unitID, imunBuffs, skipKarma)
	-- @return boolean 
	-- Note: Checks for friendly / enemy Imun auras and compares it with remain duration 
	if not unitID or UnitIsUnit(unitID, "player") then 
		return true 
	else 
		local isTable = type(self) == "table"
		local isEnemy = Unit(unitID):IsEnemy()
		local isStopAtBreakAble = A.IsInitialized and GetToggle(1, "StopAtBreakAble")
		
		-- Super trick for Queue System, it will save in cache imunBuffs on first entire call by APL and Queue will be allowed to handle cache to compare Imun 
		if isTable and not self.AbsentImunQueueCache and imunBuffs then 
			self.AbsentImunQueueCache = imunBuffs
		end 	
		
		local MinDur = ((not isTable or self.Type ~= "Spell") and 0) or self:GetSpellCastTime()
		if MinDur > 0 then 
			MinDur = MinDur + (self:IsRequiredGCD() and self.GetCurrentGCD() or 0)
		end
		
		local debuffName, expirationTime, remainTime, _
		for i = 1, huge do			
			debuffName, _, _, _, _, expirationTime = UnitAura(unitID, i, "HARMFUL")
			if not debuffName then
				break 
			elseif IsCycloneDeBuff[debuffName] or (isStopAtBreakAble and isEnemy and IsBreakAbleDeBuff[debuffName]) then 
				remainTime = expirationTime == 0 and huge or expirationTime - TMW.time
				if remainTime > MinDur then 
					return false 
				end 
			end 
		end 
		
		if A.IsInPvP and imunBuffs and UnitIsPlayer(unitID) then  
			-- Light and faster check Fury Warriors
			if type(imunBuffs) == "table" then 				
				for i = 1, #imunBuffs do 
					if imunBuffs[i] == "Freedom" and Unit(unitID):HasSpec(ACTION_CONST_WARRIOR_FURY) then 
						return false 
					end 
				end 
			elseif imunBuffs == "Freedom" and Unit(unitID):HasSpec(ACTION_CONST_WARRIOR_FURY) then
				return false  								
			end 
			
			-- Check remain things
			 if Unit(unitID):HasBuffs(imunBuffs) > MinDur then 
				return false 
			end 
		end 
		
		if not skipKarma and isEnemy and not Unit(unitID):WithOutKarmed() then 
			return false 
		end 

		return true
	end 
end 

function A:IsBlockedByAny()
	-- @return boolean
	return self:IsBlocked() or self:IsBlockedByQueue() or (self.Type == "Spell" and (self:IsBlockedBySpellLevel() or (self.isTalent and not self:IsSpellLearned()))) or (self.Type ~= "Spell" and self.Type ~= "SwapEquip" and self:GetCount() == 0 and not self:GetEquipped())
end 

function A:IsCastable(unitID, skipRange, skipShouldStop, isMsg, skipUsable)
	-- @return boolean
	-- Checks toggle, cooldown and range 
	
	if isMsg or ((skipShouldStop or not self.ShouldStop()) and not self:ShouldStopByGCD()) then 
		if 	self.Type == "Spell" and 
			not self:IsBlockedBySpellLevel() and 	
			( not self.isTalent or self:IsSpellLearned() ) and 
			self:IsUsable(nil, skipUsable) and 
			( skipRange or not unitID or not self:HasRange() or self:IsInRange(unitID) ) and 
			-- Patch 8.2
			-- 1518 is The Eternal Palace - The Queen's Court 
			-- 301244 is Repeat Performance (DeBuff)
			( A.ZoneID ~= 1518 or Unit("player"):HasDeBuffs(301244) == 0 or (A.LastPlayerCastName ~= self:Info() and Player:CastRemains(self.ID) == 0) )
		then 
			return true 				
		end 
		
		if 	self.Type == "Trinket" then 
			local ID = self.ID		
			if 	ID ~= nil and 
				-- This also checks equipment (in idea because slot return ID which we compare)
				( A.Trinket1.ID == ID and GetToggle(1, "Trinkets")[1] or A.Trinket2.ID == ID and GetToggle(1, "Trinkets")[2] ) and 
				self:IsUsable(nil, skipUsable) and 
				( skipRange or not unitID or not self:HasRange() or self:IsInRange(unitID) )
			then 
				return true 
			end 
		end 
		
		if 	self.Type == "Potion" and 
			not A.IsInPvP and 
			GetToggle(1, "Potion") and 
			BurstIsON(unitID or A.IamHealer and "targettarget" or "target") and 
			self:GetCount() > 0 and 
			self:GetItemCooldown() == 0 
		then
			return true 
		end 
		
		if  self.Type == "Item" and 
			( self:GetCount() > 0 or self:GetEquipped() ) and 
			self:GetItemCooldown() == 0 and 
			( skipRange or not unitID or not self:HasRange() or self:IsInRange(unitID) )
		then
			return true 
		end 
	end 
	
	return false 
end

function A:IsReady(unitID, skipRange, skipLua, skipShouldStop, skipUsable)
	-- @return boolean
	-- For [3-4, 6-8]
    return 	not self:IsBlocked() and 
			not self:IsBlockedByQueue() and 
			self:IsCastable(unitID, skipRange, skipShouldStop, nil, skipUsable) and 
			( skipLua or self:RunLua(unitID) )
end 

function A:IsReadyP(unitID, skipRange, skipLua, skipShouldStop, skipUsable)
	-- @return boolean
	-- For [1-2, 5]
    return 	self:IsCastable(unitID, skipRange, skipShouldStop, nil, skipUsable) and (skipLua or self:RunLua(unitID))
end 

function A:IsReadyM(unitID, skipRange, skipUsable)
	-- @return boolean
	-- For MSG System or bypass ShouldStop with GCD checks and blocked conditions 
	if unitID == "" then 
		unitID = nil 
	end 
    return 	self:IsCastable(unitID, skipRange, nil, true, skipUsable) and self:RunLua(unitID)
end 

function A:IsReadyByPassCastGCD(unitID, skipRange, skipLua, skipUsable)
	-- @return boolean
	-- For [3-4, 6-8]
    return 	not self:IsBlocked() and 
			not self:IsBlockedByQueue() and 
			self:IsCastable(unitID, skipRange, nil, true, skipUsable) and 
			( skipLua or self:RunLua(unitID) )
end 

function A:IsReadyByPassCastGCDP(unitID, skipRange, skipLua, skipUsable)
	-- @return boolean
	-- For [1-2, 5]
    return 	self:IsCastable(unitID, skipRange, nil, true, skipUsable) and (skipLua or self:RunLua(unitID))
end 

function A:IsReadyToUse(unitID, skipShouldStop, skipUsable)
	-- @return boolean 
	-- Note: unitID is nil here always 
	return 	not self:IsBlocked() and 
			not self:IsBlockedByQueue() and 
			self:IsCastable(nil, true, skipShouldStop, nil, skipUsable)
end 

-------------------------------------------------------------------------------
-- Misc
-------------------------------------------------------------------------------
-- KeyName
local function tableSearch(self, array)
	for k, v in pairs(array) do 
		if type(v) == "table" and self == v then 
			return k 
		end 
	end 
end 

function A:GetKeyName()
	-- Returns @nil or @string as key name in the table
	return tableSearch(self, A[A.PlayerSpec]) or tableSearch(self, A)
end 

-- Spell  
local spellinfocache = setmetatable({}, { __index = function(t, v)
    local a = { GetSpellInfo(v) }
    if a[1] then
        t[v] = a
    end
    return a
end })

function A:GetSpellInfo()
	local ID = self
	if type(self) == "table" then 
		ID = self.ID 
	end
	
	if ID then 
		return unpack(spellinfocache[ID])
	end 
end

function A:GetSpellLink()
	local ID = self
	if type(self) == "table" then 
		ID = self.ID 
	end
    return GetSpellLink(ID) or ""
end 

function A:GetSpellIcon()
	return select(3, self:GetSpellInfo())
end

function A:GetSpellTexture(custom)
	if self.SubType == "HeartOfAzeroth" then 
		return "texture", ACTION_CONST_HEARTOFAZEROTH
	end
    return "texture", GetSpellTexture(custom or self.ID)
end 

--- Spell Colored Texturre
function A:GetColoredSpellTexture(custom)
    return "state; texture", {Color = A.Data.C[self.Color] or self.Color, Alpha = 1, Texture = ""}, GetSpellTexture(custom or self.ID)
end 

-- SingleColor
function A:GetColorTexture()
    return "state", {Color = A.Data.C[self.Color] or self.Color, Alpha = 1, Texture = "ERROR"}
end 

-- Item
local iteminfocache = setmetatable({}, { __index = function(t, v)	
    local a = { GetItemInfo(v) }
    if a[1] then
        t[v] = a
    end
    return a
end })

function A:GetItemInfo()
	local ID = self
	if type(self) == "table" then 
		ID = self.ID 
	end
	
	if ID then 
		return unpack(iteminfocache[ID]) or self:GetKeyName()
	end 
end

function A:GetItemLink()
    return select(2, self:GetItemInfo()) or ""
end 

function A:GetItemIcon()
	return select(10, self:GetItemInfo()) or select(5, GetItemInfoInstant(self.ID))
end

function A:GetItemTexture(custom)
	local texture
	if self.Type == "Trinket" then 
		if A.Trinket1.ID == self.ID then 
			texture = ACTION_CONST_TRINKET1
		else 
			texture = ACTION_CONST_TRINKET2
		end
	elseif self.Type == "Potion" then 
		texture = ACTION_CONST_POTION
	else 
		texture = (custom and select(10, self.GetItemInfo(custom))) or self:GetItemIcon()
	end
	
    return "texture", texture
end 

-- Item Colored Texture
function A:GetColoredItemTexture(custom)
    return "state; texture", {Color = A.Data.C[self.Color] or self.Color, Alpha = 1, Texture = ""}, (custom and GetItemIcon(custom)) or self:GetItemIcon()
end 

-------------------------------------------------------------------------------
-- UI: Create
-------------------------------------------------------------------------------
function A.Create(arg)
	--[[@usage: arg (table)
		Required: 
			Type (@string)	- Spell|SpellSingleColor|Item|ItemSingleColor|Potion|Trinket|TrinketBySlot|HeartOfAzeroth|SwapEquip (TrinketBySlot is only in CORE!)
			ID (@number) 	- spellID | itemID | textureID (textureID only for Type "SwapEquip")
			Color (@string) - only if type is Spell|SpellSingleColor|Item|ItemSingleColor|SwapEquip, this will set color which stored in A.Data.C[Color] or here can be own hex 
	 	Optional: 
			Desc (@string) uses in UI near Icon tab (usually to describe relative action like Penance can be for heal and for dps and it's different actions but with same name)
			QueueForbidden (@boolean) uses to preset for action fixed queue valid 
			BlockForbidden (@boolean) uses to preset for action fixed block valid 
			Texture (@number) valid only if Type is Spell|Item|Potion|Trinket|HeartOfAzeroth|SwapEquip
			MetaSlot (@number) allows set fixed meta slot use for action whenever it will be tried to set in queue 
			Hidden (@boolean) allows to hide from UI this action 
			isTalent (@boolean) will check in :IsCastable method condition through :IsSpellLearned(), only if Type is Spell|SpellSingleColor|HeartOfAzeroth
			isStance (@number) will check in :GetCooldown cooldown timer by GetShapeshiftFormCooldown function instead of default
			Equip1, Equip2 (@function) between which equipments do swap, used in :IsExists method, only if Type is SwapEquip
	]]
	local attributes = arg or emptycreate
	local s = {
		ID = attributes.ID,
		SubType = attributes.Type,
		Desc = attributes.Desc or "",
		BlockForbidden = attributes.BlockForbidden, 
		QueueForbidden = attributes.QueueForbidden, 
		MetaSlot = attributes.MetaSlot,
		Hidden = attributes.Hidden,		
	}
	if attributes.Type == "Spell" or attributes.Type == "HeartOfAzeroth" then 
		s = setmetatable(s, {__index = A})	
		s.Type = "Spell"		
		-- Methods (metakey:Link())			
		s.Info = A.GetSpellInfo
		s.Link = A.GetSpellLink		
		s.Icon = A.GetSpellIcon
		if attributes.Color then 
			s.Color = attributes.Color
			if attributes.Texture then 
				s.Texture = function()
					return A.GetColoredSpellTexture(s, attributes.Texture)
				end 
			else 
				s.Texture = A.GetColoredSpellTexture
			end 		
		else 
			if attributes.Texture then 
				s.Texture = function()
					return A.GetSpellTexture(s, attributes.Texture)
				end 
			else 
				s.Texture = A.GetSpellTexture	
			end
		end 
		-- Power 
		s.PowerCost, s.PowerType = s:GetSpellPowerCostCache()
		-- Talent 
		s.isTalent = attributes.isTalent
		-- Stance 
		s.isStance = attributes.isStance
	elseif attributes.Type == "SpellSingleColor" then 
		s = setmetatable(s, {__index = A})	
		s.Type = "Spell"
		s.Color = attributes.Color
		-- Methods (metakey:Link())	
		s.Info = A.GetSpellInfo
		s.Link = A.GetSpellLink		
		s.Icon = A.GetSpellIcon
		-- This using static and fixed only color so no need texture
		s.Texture = A.GetColorTexture			
		-- Power 
		s.PowerCost, s.PowerType = s:GetSpellPowerCostCache()	
		-- Talent 
		s.isTalent = attributes.isTalent
		-- Stance 
		s.isStance = attributes.isStance
	elseif attributes.Type == "Trinket" or attributes.Type == "Potion" or attributes.Type == "Item" then 
		s = setmetatable(s, {
				__index = function(self, key)
					if A[key] then
						return A[key]
					else
						return self.Item[key]
					end
				end
		})
		s.Type = attributes.Type
		-- Methods (metakey:Link())	
		s.Info = A.GetItemInfo
		s.Link = A.GetItemLink		
		s.Icon = A.GetItemIcon
		if attributes.Color then 
			s.Color = attributes.Color
			if attributes.Texture then 
				s.Texture = function()
					return A.GetColoredItemTexture(s, attributes.Texture)
				end 
			else 
				s.Texture = A.GetColoredItemTexture
			end 		
		else 		
			if attributes.Texture then 
				s.Texture = function()
					return A.GetItemTexture(s, attributes.Texture)
				end 
			else 
				s.Texture = A.GetItemTexture
			end 
		end	
		-- Misc
		s.Item = TMW.Classes.ItemByID:New(attributes.ID)
		GetItemInfoInstant(attributes.ID) -- must be here as request limited data from server 	
	elseif attributes.Type == "TrinketBySlot" then 
		s = setmetatable(s, {
				__index = function(self, key)
					if key == "ID" then 
						return self.Item:GetID()
					end 
					
					if A[key] then
						return A[key]
					else
						return self.Item[key]
					end
				end
		})
		s.Type = "Trinket"		
		-- Methods (metakey:Link())	
		s.Info = A.GetItemInfo
		s.Link = A.GetItemLink		
		s.Icon = A.GetItemIcon
		if attributes.Color then 
			s.Color = attributes.Color
			if attributes.Texture then 
				s.Texture = function()
					return A.GetColoredItemTexture(s, attributes.Texture)
				end 
			else 
				s.Texture = A.GetColoredItemTexture
			end 		
		else 		
			if attributes.Texture then 
				s.Texture = function()
					return A.GetItemTexture(s, attributes.Texture)
				end 
			else 
				s.Texture = A.GetItemTexture
			end 
		end	
		-- Misc
		s.Item = TMW.Classes.ItemBySlot:New(attributes.ID)			
		local isEquiped = s.Item:GetID()
		if isEquiped then 
			GetItemInfoInstant(isEquiped) -- must be here as request limited data from server
		end 
		s.ID = nil
	elseif attributes.Type == "ItemSingleColor" then
		s = setmetatable(s, {
				__index = function(self, key)
					if A[key] then
						return A[key]
					else
						return self.Item[key]
					end
				end
		})
		s.Type = "Item" 
		s.Color = attributes.Color
		-- Methods (metakey:Link())	
		s.Info = A.GetItemInfo
		s.Link = A.GetItemLink		
		s.Icon = A.GetItemIcon
		-- This using static and fixed only color so no need texture
		s.Texture = A.GetColorTexture		
		-- Misc 
		s.Item = TMW.Classes.ItemByID:New(attributes.ID)
		GetItemInfoInstant(attributes.ID) -- must be here as request limited data from server	
	elseif attributes.Type == "SwapEquip" then 
		s = setmetatable(s, {__index = A})	
		s.Type = attributes.Type
		-- Methods (metakey:Link())	
		s.Info = function()
			return ACTION_CONST_EQUIPMENT_MANAGER
		end 
		s.Link = s.Info		
		s.Icon = function()
			return attributes.ID 
		end 
		if attributes.Color then 
			s.Color = attributes.Color
			if attributes.Texture then 
				s.Texture = function()
					return A.GetColoredSwapTexture(s, attributes.Texture)
				end 
			elseif attributes.FixedTexture then 
				s.Texture = function()
					return "texture", attributes.FixedTexture
				end 				
			else 
				s.Texture = A.GetColoredSwapTexture
			end 		
		else 		
			if attributes.Texture then 
				s.Texture = function()
					return "texture", attributes.Texture
				end 
			elseif attributes.FixedTexture then 
				s.Texture = function()
					return "texture", attributes.FixedTexture
				end 				
			else 
				s.Texture = function()
					return "texture", attributes.ID
				end 
			end 
		end	
		-- Equip 
		s.Equip1 = attributes.Equip1
		s.Equip2 = attributes.Equip2	
	else 
		s = setmetatable(s, {__index = A})	
		s.Hidden = true 
	end 
	return s
end 