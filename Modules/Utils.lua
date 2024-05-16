local ExPack = LibStub("AceAddon-3.0"):GetAddon("ExPack")
local Utils = ExPack:NewModule("Utils")

local L = LibStub("AceLocale-3.0"):GetLocale("ExPack")

--https://wowpedia.fandom.com/wiki/API_GetContainerItemID
GetContainerItemID = nil
--https://wowpedia.fandom.com/wiki/API_GetContainerNumSlots
GetContainerNumSlots = nil
--https://wowpedia.fandom.com/wiki/API_GetContainerItemLink
GetContainerItemLink = nil
--https://wowpedia.fandom.com/wiki/API_GetContainerItemInfo
GetContainerItemInfo = nil
--https://wowpedia.fandom.com/wiki/API_GetContainerNumFreeSlots
GetContainerNumFreeSlots = nil
--https://wowpedia.fandom.com/wiki/API_GetContainerItemCooldown
GetContainerItemCooldown = nil

if C_Container then
	GetContainerItemID = C_Container.GetContainerItemID
	GetContainerNumSlots = C_Container.GetContainerNumSlots
	GetContainerItemLink = C_Container.GetContainerItemLink
	GetContainerItemInfo = C_Container.GetContainerItemInfo
	GetContainerNumFreeSlots = C_Container.GetContainerNumFreeSlots
	GetContainerItemCooldown = C_Container.GetContainerItemCooldown
else
	GetContainerNumSlots = _G.GetContainerNumSlots
	GetContainerItemID = _G.GetContainerItemID
	GetContainerItemLink = _G.GetContainerItemLink
	GetContainerItemInfo = _G.GetContainerItemInfo
	GetContainerNumFreeSlots = _G.GetContainerNumFreeSlots
	GetContainerItemCooldown = _G.GetContainerItemCooldown
end

---

function Utils:GetTooltipItemID()
	local _itemName, itemLink = GameTooltip:GetItem()
	return self:ItemLinkToItemID(itemLink)
end

function Utils:ItemLinkToItemID(itemLink)
	if itemLink == nil then return nil end
	return tonumber(string.match(itemLink, "item:(%d+):"))
end

function Utils:GetEquipmentSetItemIDs()
	local equipmentSetItemIds = {}

	for setID = 0, C_EquipmentSet.GetNumEquipmentSets() do
		local itemArray = C_EquipmentSet.GetItemIDs(setID)
		for itemIndex = 1, 19 do
			if itemArray and itemArray[itemIndex] then
				equipmentSetItemIds[itemArray[itemIndex]] = true
			end
		end
	end

	return equipmentSetItemIds
end

function Utils:GetSlotsByBagID(plugin)
	local slotsByBagID = {}
  if (plugin == nul) then
		ExPack.logger:Warn("GetSlotsByBagID; no plugin loaded")
		return
	end
	local total_num_bags_slots = NUM_TOTAL_EQUIPPED_BAG_SLOTS+NUM_BANKBAGSLOTS
	ExPack.logger:Debug("GetSlotsByBagID; ", total_num_bags_slots)
	for bagID = 0, total_num_bags_slots do
		slotsByBagID[bagID] = {}
		for slotIndex = 1, GetContainerNumSlots(bagID) do
			if GetContainerItemID(bagID, slotIndex) then
				local slotFrame = plugin:GetSlotFrame(bagID, slotIndex)
				tinsert(slotsByBagID[bagID], slotFrame)
			end
		end
	end

	return slotsByBagID
end

---

function Utils:IsClassic()
	return WOW_PROJECT_ID == WOW_PROJECT_WRATH_CLASSIC
end

---

function Utils:IsConsumable(classID, subclassID)
	if (classID == 15) then -- Miscellaneous
		return (subclassID == 1) -- Reagent
	else
		return (classID == 0) -- Consumable
	end
end

function Utils:IsArmory(classID, subclassID)
	if (classID == 2) then -- Weapon
		return true
	elseif (classID == 4) then -- Armor
		return true
	else
		return false
	end
end

function Utils:IsTradegoods(classID, subclassID)
	return (classID == 7) -- Tradegoods
end

function Utils:IsQuestitem(classID, subclassID)
	return (classID == 12) -- QuestItem
end

function Utils:IsJunk(classID, subclassID)
	if (classID == 15) then -- Miscellaneous
		return (subclassID == 0) -- Junk
	else
		return false
	end
end

