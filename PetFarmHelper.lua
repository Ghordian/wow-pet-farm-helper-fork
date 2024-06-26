local addonName, addon = ...

LibStub('AceAddon-3.0'):NewAddon(addon, addonName, 'AceEvent-3.0', 'AceTimer-3.0', "AceHook-3.0")

local L = LibStub('AceLocale-3.0'):GetLocale(addonName)
local LBB = LibStub('LibBabble-Boss-3.0'):GetUnstrictLookupTable()
local LBZ = LibStub('LibBabble-SubZone-3.0'):GetUnstrictLookupTable()

local qtip = LibStub('LibQTip-1.0')

local TOOLTIP_SEPARATOR     = { 1, 1, 1, 1, 0.5 }

local COLOR_DUNGEON         = { 1, 1, 0, 1 }
local COLOR_CURRENT_ZONE    = { 0, 1, 0, 1 }
local COLOR_COMMENT         = { 0, 1, 0, 1 }

local COLOR_COUNT_NONE      = { 1, 0, 0, 1 }
local COLOR_COUNT_MAX       = { 0, 1, 0, 1 }
local COLOR_COUNT_NORMAL    = { 1, 1, 0, 1 }

local COLOR_MODE_TEXT = 'ff00ff00'

local COLOR_ITEM_TOOLTIP            = { 1, 1, 1 }
local COLOR_ITEM_TOOLTIP_SOURCE     = { 1, 1, 0 }
local COLOR_ITEM_TOOLTIP_SOURCE_2L  = { 1, 1, 0, 0, 1, 0 }

local PET_JOURNAL_FLAGS = { LE_PET_JOURNAL_FILTER_COLLECTED, LE_PET_JOURNAL_FILTER_NOT_COLLECTED }

local function OnTooltipSetItem(self)
--print("OnTooltipSetItem")
	addon:OnGameTooltipSetItem(self)
end

function addon:OnInitialize()

		self.version = "v10.02.07.001";

		self.config = self:GetModule("Config")
		self.logger = self:GetModule("Logger")

		self.config:Init(self)
		self.logger:Init(self.config)

		self.ldb = self.config.LDB;
		self.profile = self.config.db.profile;

--[[ moved to Modules\Config
--	self.icon = LibStub('LibDBIcon-1.0')
--	self.icon:Register(addonName, self.ldb, self.profile.minimap)
--]]

		self:RegisterEvent('COMBAT_LOG_EVENT_UNFILTERED', function(...)
				addon:OnCombatEvent(...)
		end)

		self:RegisterEvent('PLAYER_LOGIN', function(...)
				if not PetJournal_OnLoad then
						UIParentLoadAddOn('Blizzard_Collections')
				end
		end)

		GameTooltip:HookScript('OnTooltipCleared', function(self)
				addon:OnGameTooltipCleared(self)
		end)

--[[ DRAGONFLIGHT CHANGES
		GameTooltip:HookScript('OnTooltipSetItem', function(self)
				addon:OnGameTooltipSetItem(self)
		end)
--]]
		TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, OnTooltipSetItem)

		self.trackNpc = {}

		local itemId, itemData
		for itemId, itemData in pairs(PFH_DB_PETS) do
				GetItemInfo(itemId)

				local itemSource
				if itemData.from then
						for _, itemSource in pairs(itemData.from) do
								if itemSource.npc_id and itemSource.npc_id > 0 then
										self:GetNpcName(itemSource.npc_id)

										if itemSource.type == 'raid' or (itemSource.type == 'dungeon' and itemSource.subtype) and not itemSource.dont_autoupdate then
												self.trackNpc[itemSource.npc_id] = 1
										end
								end
						end
				else
						-- database incomplete
					self.logger.Warn("WARN; database incomplete itemId; "..itemId);
				end
		end

		addon:BuildPetDataTable()
end

function addon:GetNpcName(npcId)
		local tooltip = self.scanTooltip

		if not tooltip then
				tooltip = CreateFrame('GameTooltip', 'PFH_SCAN_TOOLTIP', UIParent, 'GameTooltipTemplate')
				self.scanTooltip = tooltip
		end

		tooltip:SetOwner(UIParent, 'ANCHOR_NONE')
		tooltip:SetHyperlink(string.format('unit:Creature-0-0-0-0-%d:0000000000', npcId))

		local npcName = _G[tooltip:GetName() .. 'TextLeft1']:GetText()

		if not npcName then
				if PFH_DB_BOSSES[npcId] and PFH_DB_BOSSES[npcId].name then
						npcName = LBB[PFH_DB_BOSSES[npcId].name] or PFH_DB_BOSSES[npcId].name
				else
						npcName = string.format('npc#%d', npcId)
				end
		end

		return npcName
end

function addon:OnCombatEvent(event, timeStamp, logEvent, hideCaster,
		sourceGuid, sourceName, sourceFlags, sourceFlags2,
		destGuid, destName, destFlags, destFlags2, ...
)
		if destGuid then
				local type, id = UnitInfoFromGuid(destGuid)

				if type == 'Creature' or type == 'Vehicle' then
						if (logEvent == 'UNIT_DIED' or logEvent == 'PARTY_KILL') and self.trackNpc[id] then
								RequestRaidInfo()

								self:ScheduleTimer(function()
										RequestRaidInfo()
								end, 5)
						end
				end
		end
end

function addon:ShowTooltip(anchor)
--print("ShowTooltip");
		if not (InCombatLockdown() or (self.tooltip and self.tooltip:IsShown())) then
				if not (qtip:IsAcquired(addonName) and self.tooltip) then
						self.tooltip = qtip:Acquire(addonName, 6, 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'RIGHT')

						self.tooltip.OnRelease = function()
								self.tooltip = nil
						end
				end

				if anchor then
						self.tooltip:SmartAnchorTo(anchor)
						self.tooltip:SetAutoHideDelay(0.05, anchor)
				end

				self:UpdateTooltip(self.tooltip)
		end
end

-- WOW API - https://warcraft.wiki.gg/wiki/Category:API_namespaces/C_Map
local GetMapInfo = C_Map.GetMapInfo
local IsQuestFlaggedCompleted = C_QuestLog and C_QuestLog.IsQuestFlaggedCompleted or IsQuestFlaggedCompleted

-- Streamlined interface for working with Blizzard's UI map system (world map, zone queries, etc.)
local MapInfo = {}

-- https://wago.tools/db2/UiMap
-- Helper function (to look up map names more easily)
-- Returns the localized map name, or nil if the uiMapID is invalid
function MapInfo.GetMapNameByID(uiMapID)
	local UiMapDetails = GetMapInfo(uiMapID)
	return UiMapDetails and UiMapDetails.name
end

function addon:GetItemSourceInfo(itemSource)
	--self.logger.Trace("GetItemSourceInfo", itemSource)

		local zoneName = MapInfo.GetMapNameByID(itemSource.zone_id)
		if not zoneName then
			-- subzone id ?
			zoneName = C_Map.GetAreaInfo(itemSource.zone_id)
		end
		if not zoneName then
			zoneName = tostring(itemSource.zone_id)
		end
	--print("GetItemSourceInfo; "..zoneName)

		local npcName
		if itemSource.type == 'special' then
				npcName = L['special_' .. itemSource.subtype]
		else
				npcName = self:GetNpcName(itemSource.npc_id)
		end

		local raidSaveZone = PFH_DB_ZONES[itemSource.zone_id] and PFH_DB_ZONES[itemSource.zone_id].raid and LBZ[PFH_DB_ZONES[itemSource.zone_id].raid] or zoneName
		local raidSaveBoss = PFH_DB_BOSSES[itemSource.npc_id] and PFH_DB_BOSSES[itemSource.npc_id].raid and LBB[PFH_DB_BOSSES[itemSource.npc_id].raid] or npcName

		local comment
		if itemSource.subtype and itemSource.type ~= 'special' then
				comment = L['type_' .. itemSource.subtype]
		end
		if itemSource.cond then
				comment = (comment and (comment .. ' + ') or '') .. L['cond_' .. itemSource.cond]
		end

		return zoneName, npcName, comment, raidSaveZone, raidSaveBoss
end

function addon:GetPlayerItems()
	--self.logger.Trace("GetPlayerItems")

		local playerItems, petJournalInfo = {}, {}

		local saved = self:SavePetJournalFilters()

		C_PetJournal.ClearSearchFilter()

		C_PetJournal.SetFilterChecked(LE_PET_JOURNAL_FILTER_COLLECTED, true)
		C_PetJournal.SetFilterChecked(LE_PET_JOURNAL_FILTER_NOT_COLLECTED, true)

		C_PetJournal.SetAllPetSourcesChecked(true)
		C_PetJournal.SetAllPetTypesChecked(true)

		local count = 0
		for i = 1, C_PetJournal:GetNumPets() do
				local itemId, speciesId, isCollected, _, _, _, _, _, _, _, npcId, _, _, _, _, isTradeable, isUnique = C_PetJournal.GetPetInfoByIndex(i)

				petJournalInfo[npcId] = { speciesId = speciesId, maxCount = isUnique and 1 or 3, isTradeable = isTradeable }

				if isCollected then
						if not playerItems[npcId] then
								playerItems[npcId] = { itemId = itemId, count = 0 }
						end

						playerItems[npcId].count = playerItems[npcId].count + 1
					count = count + 1
				end
		end

	--self.logger.Trace("count; "..count);

		self:RestorePetJournalFilters(saved)

		return playerItems, petJournalInfo
end

function addon:BuildTooltipData()
	--self.logger.Trace("BuildTooltipData");

		local i, j

		local playerItems, petJournalInfo = self:GetPlayerItems()

		local savedRaids = {}
		for i = 1, GetNumSavedInstances() do
				local raidName, _, _, _, locked, extended, _, _, _, _, numBosses = GetSavedInstanceInfo(i)
				if locked and not extended then
						savedRaids[raidName] = {}

						local numRemains = 0

						for j = 1, numBosses do
								local bossName, _, killed = GetSavedInstanceEncounterInfo(i, j)
								if killed then
										savedRaids[raidName][bossName] = 1
								else
										numRemains = numRemains + 1
								end
						end

						if numRemains < 1 then
								savedRaids[raidName] = 1
						end
				end
		end

		local playerFaction = string.lower(UnitFactionGroup('player'))
		local playerLevel = UnitLevel('player') or 0
		local playerZoneName = GetRealZoneText() or ""

	--self.logger.Trace("player; "..playerFaction.."; "..playerLevel .."; "..playerZoneName);

		local normalItems, raidItems, worldItems, questItems = {}, {}, {}, {}

		local itemId, itemData
		local itemCount = 0
		for itemId, itemData in pairs(PFH_DB_PETS) do
				itemCount = itemCount + 1
				if (not playerItems[itemData.npc_id] 
						or (not self.profile.hide_collected
								and (playerItems[itemData.npc_id].count < petJournalInfo[itemData.npc_id].maxCount or petJournalInfo[itemData.npc_id].isTradeable)))
						and (not itemData.faction or itemData.faction == playerFaction)
				then
						local itemName, itemLink = GetItemInfo(itemId)
						local dispName = (itemLink and itemLink:gsub('%[', ''):gsub('%]', ''):sub(1)) or itemName or string.format('item#%d', itemId)

						local itemSource
						if not itemData.from then
							self.logger.Error("itemData incompleted; itemId; "..itemId.."; "..dispName)
							break
						end
						for _, itemSource in pairs(itemData.from) do
								if not itemSource.faction or itemSource.faction == playerFaction then
										if (itemSource.level <= playerLevel) or true then

												local zoneName, npcName, comment, raidSaveZone, raidSaveBoss = self:GetItemSourceInfo(itemSource)

												local add
												if itemSource.type == 'dungeon' and not itemSource.subtype then
														add = 1
												elseif itemSource.type == 'dungeon' or itemSource.type == 'raid' then
														add = not(savedRaids[raidSaveZone] and (type(savedRaids[raidSaveZone]) ~= 'table' or savedRaids[raidSaveZone][raidSaveBoss]))
												elseif itemSource.quest_id then
														add = not IsQuestFlaggedCompleted(itemSource.quest_id)
												elseif itemSource.type == 'world' then
														add = 1
												end

												if add then
														local zoneData = {
																items = {}, sort = itemSource.for_sort,
																isCurrent = playerZoneName == (PFH_DB_ZONES[itemSource.zone_id] and PFH_DB_ZONES[itemSource.zone_id].map and LBZ[PFH_DB_ZONES[itemSource.zone_id].map] or zoneName),
														}

														if itemSource.type == 'dungeon' and not itemSource.subtype then
																if normalItems[zoneName] then
																		zoneData = normalItems[zoneName]
																else
																		normalItems[zoneName] = zoneData
																end
														elseif itemSource.type == 'dungeon' or itemSource.type == 'raid' then
																if raidItems[zoneName] then
																		zoneData = raidItems[zoneName]
																else
																		raidItems[zoneName] = zoneData
																end
														elseif itemSource.type == 'world' then
																if worldItems[zoneName] then
																		zoneData = worldItems[zoneName]
																else
																		worldItems[zoneName] = zoneData
																end
														else
																if questItems[zoneName] then
																		zoneData = questItems[zoneName]
																else
																		questItems[zoneName] = zoneData
																end
														end

														zoneData.sort = min(zoneData.sort, itemSource.for_sort)

														local npcData = zoneData.items[npcName] or { items = {}, sort = itemSource.for_sort }
														zoneData.items[npcName] = npcData

														npcData.sort = min(zoneData.sort, itemSource.for_sort)

														if playerItems[itemData.npc_id] then
																table.insert(npcData.items, {
																		name = dispName, itemId = playerItems[itemData.npc_id].itemId, comment = comment,
																		count = playerItems[itemData.npc_id].count, maxCount = petJournalInfo[itemData.npc_id].maxCount,
																})
														elseif (itemData.npc_id > 0) then
																local petInfo = petJournalInfo[itemData.npc_id];
																if petInfo then
																	table.insert(npcData.items, {
																			name = dispName, speciesId = petInfo.speciesId, comment = comment,
																			count = 0, maxCount = petInfo.maxCount,
																	})
																end
														end
												end
										end
								end
						end
				end
		end

		return {
				{ items = normalItems, title = 'normal' },
				{ items = raidItems  , title = 'raid'   },
				{ items = worldItems , title = 'world'  },
				{ items = questItems , title = 'quest'  },
		}
end

function addon:BuildAltCraftList()
		local list, added = {}, {}

		local playerItems, petJournalInfo = self:GetPlayerItems()
		local playerFaction = string.lower(UnitFactionGroup('player'))

		local itemId, itemData
		for itemId, itemData in pairs(PFH_DB_PETS) do
				if (not playerItems[itemData.npc_id]
						or (playerItems[itemData.npc_id].count < petJournalInfo[itemData.npc_id].maxCount or petJournalInfo[itemData.npc_id].isTradeable))
						and (not itemData.faction or itemData.faction == playerFaction)
				then
						local name, link, icon = table.s2k_select({ GetItemInfo(itemId) }, 1, 2, 10 )

						local itemSource
						for _, itemSource in pairs(itemData.from) do
								if not itemSource.faction or itemSource.faction == playerFaction then
										local zoneName, npcName, comment = self:GetItemSourceInfo(itemSource)

										if added[itemId] then
												table.insert(added[itemId].sources, {
														zone    = zoneName,
														source  = npcName,
														comment = comment,
														sort    = itemSource.for_sort,
												})

												table.sort(added[itemId].sources, function(a, b) return a.sort < b.sort end)

												added[itemId].sort = added[itemId].sources[1].sort
										else
												added[itemId] = {
														itemId      = itemId,
														name        = name,
														link        = link,
														icon        = icon,
														sort        = itemSource.for_sort,
														sources     = {{
																zone        = zoneName,
																source      = npcName,
																comment     = comment,
																sort        = itemSource.for_sort,
														}},
														count       = playerItems[itemData.npc_id] and playerItems[itemData.npc_id].count or 0,
														maxCount    = petJournalInfo[itemData.npc_id].maxCount,
												}

												table.insert(list, added[itemId])
										end
								end
						end
				end
		end

		table.sort(list, function(a, b) return a.sort < b.sort end)

		return list
end

function addon:UpdateTooltip(tooltip)
	--self.logger.Trace("UpdateTooltip");

		tooltip:Clear()

		local lineNo, itemTable

		lineNo = tooltip:AddLine()
		tooltip:SetCell(lineNo, 1, string.format('%s: |c%s%s|r', L.title_mode,
				COLOR_MODE_TEXT,
				self.profile.hide_collected and L.mode_collector or L.mode_trader
		), nil, nil, 5)

		tooltip:SetLineScript(lineNo, 'OnMouseUp', function()
				self.profile.hide_collected = not self.profile.hide_collected
				self:UpdateTooltip(tooltip)
		end)

	--self.logger.Trace("BuildTooltipData");

		for _, itemTable in pairs(self:BuildTooltipData()) do
				if not table.s2k_is_empty(itemTable.items) then
						tooltip:AddSeparator(unpack(TOOLTIP_SEPARATOR))

						if self.profile['hide_' .. itemTable.title] then
								lineNo = tooltip:AddLine()
								tooltip:SetCell(lineNo, 1, '|TInterface\\Buttons\\UI-PlusButton-Up:16|t' .. L['title_' .. itemTable.title], nil, nil, 5)

								tooltip:SetLineScript(lineNo, 'OnMouseUp', function()
										self.profile['hide_' .. itemTable.title] = false
										self:UpdateTooltip(tooltip)
								end)
						else
								lineNo = tooltip:AddLine()
								tooltip:SetCell(lineNo, 1, '|TInterface\\Buttons\\UI-MinusButton-Up:16|t' .. L['title_' .. itemTable.title], nil, nil, 5)

								tooltip:SetLineScript(lineNo, 'OnMouseUp', function()
										self.profile['hide_' .. itemTable.title] = true
										self:UpdateTooltip(tooltip)
								end)

								local firstSorted, firstName = {}

								for firstName in pairs(itemTable.items) do
										table.insert(firstSorted, firstName)
								end

								table.sort(firstSorted, function(a, b)
										if itemTable.items[a].isCurrent then
												if itemTable.items[b].isCurrent then
														return itemTable.items[a].sort < itemTable.items[b].sort
												end
												return true
										end
										if itemTable.items[b].isCurrent then
												return false
										end
										return itemTable.items[a].sort < itemTable.items[b].sort
								end)

								for _, firstName in pairs(firstSorted) do
										local firstData = itemTable.items[firstName]
										local zoneColor = firstData.isCurrent and COLOR_CURRENT_ZONE or COLOR_DUNGEON

										local secondSorted, secondName, titlePrinted = {}

										for secondName in pairs(firstData.items) do
												table.insert(secondSorted, secondName)
										end

										table.sort(secondSorted, function(a, b)
												return firstData.items[a].sort < firstData.items[b].sort
										end)

										for _, secondName in pairs(secondSorted) do
												local secondData = firstData.items[secondName]

												if table.s2k_len(firstData.items) == 1 then
														lineNo = tooltip:AddLine()

														tooltip:SetCell(lineNo, 1, string.format('%s / %s', firstName, secondName), nil, nil, 5)
														tooltip:SetCellTextColor(lineNo, 1, unpack(zoneColor))
												else
														if not titlePrinted then
																lineNo = tooltip:AddLine()

																tooltip:SetCell(lineNo, 1, firstName, nil, nil, 5)
																tooltip:SetCellTextColor(lineNo, 1, unpack(zoneColor))

																titlePrinted = 1
														end

														lineNo = tooltip:AddLine()

														tooltip:SetCell(lineNo, 2, secondName, nil, nil, 4)
														tooltip:SetCellTextColor(lineNo, 2, unpack(zoneColor))
												end

												local itemData
												for _, itemData in pairs(secondData.items) do
														lineNo = tooltip:AddLine()

														tooltip:SetCell(lineNo, 3, string.format('%d/%d', itemData.count, itemData.maxCount))

														if itemData.count == 0 then
																tooltip:SetCellTextColor(lineNo, 3, unpack(COLOR_COUNT_NONE))
														elseif itemData.count < itemData.maxCount then
																tooltip:SetCellTextColor(lineNo, 3, unpack(COLOR_COUNT_NORMAL))
														else
																tooltip:SetCellTextColor(lineNo, 3, unpack(COLOR_COUNT_MAX))
														end

														if itemData.comment then
																tooltip:SetCell(lineNo, 4, string.format("%-40s", itemData.name))

																tooltip:SetCell(lineNo, 5, itemData.comment)
																tooltip:SetCellTextColor(lineNo, 5, unpack(COLOR_COMMENT))
														else
																tooltip:SetCell(lineNo, 4, string.format("%-40s", itemData.name), nil, nil, 2)
														end

														if itemData.itemId then
																tooltip:SetLineScript(lineNo, 'OnMouseUp', function()
																		self:OpenPetJournal(itemData.itemId, 1)
																end)
														elseif itemData.speciesId then
																tooltip:SetLineScript(lineNo, 'OnMouseUp', function()
																		self:OpenPetJournal(itemData.speciesId)
																end)
														end
												end
										end
								end
						end
				end
		end

		tooltip:AddLine("")

		tooltip:UpdateScrolling()
		tooltip:Show()
end

function addon:OpenPetJournal(id, isPetId)
	--self.logger.Trace("OpenPetJournal");
		if not CollectionsJournal:IsShown() then
				ToggleCollectionsJournal()
		end

		CollectionsJournal_SetTab(CollectionsJournal, 2)

		if id then
				if isPetId then
						PetJournal_SelectPet(PetJournal, id)
				else
						PetJournal_SelectSpecies(PetJournal, id)
				end
		end
end

function addon:SavePetJournalFilters()
	--self.logger.Trace("SavePetJournalFilters");

		local saved = { flag = {}, source = {}, type = {} }

		saved.text = C_PetJournal.GetSearchFilter()

		local i
		for i in table.s2k_values(PET_JOURNAL_FLAGS) do
				saved.flag[i] = C_PetJournal.IsFilterChecked(i)
		end

		for i = 1, C_PetJournal.GetNumPetSources() do
				saved.source[i] = C_PetJournal.IsPetSourceChecked(i)
		end

		for i = 1, C_PetJournal.GetNumPetTypes() do
				saved.type[i] = C_PetJournal.IsPetTypeChecked(i)
		end

		return saved
end

function addon:RestorePetJournalFilters(saved)
		C_PetJournal.SetSearchFilter(saved.text)

		local i
		for i in table.s2k_values(PET_JOURNAL_FLAGS) do
				C_PetJournal.SetFilterChecked(i, saved.flag[i])
		end

		for i = 1, C_PetJournal.GetNumPetSources() do
				C_PetJournal.SetPetSourceChecked(i, saved.source[i])
		end

		for i = 1, C_PetJournal.GetNumPetTypes() do
				C_PetJournal.SetPetTypeFilter(i, saved.type[i])
		end
end

function addon:OnGameTooltipCleared(tooltip)
	--self.logger.Trace("OnGameTooltipCleared")
end

function addon:OnGameTooltipSetItem(tooltip, data)
		local tooltipName = tooltip:GetName()
	--self.logger.Trace("OnGameTooltipSetItem"..tooltipName)
		return 
--[[
		local testName, link = tooltip:GetItem()
		if link then
				local itemId = 0 + (link:match('|Hitem:(%d+):') or 0)

				if PFH_DB_PETS[itemId] then
						tooltip:AddLine(' ')
						tooltip:AddLine(string.format('%s:', L.tooltip_source), unpack(COLOR_ITEM_TOOLTIP))

						local itemSource
						for _, itemSource in pairs(PFH_DB_PETS[itemId].from) do
								local zoneName, npcName, comment = self:GetItemSourceInfo(itemSource)

								if comment then
										tooltip:AddDoubleLine(string.format('%s / %s', zoneName, npcName), comment, unpack(COLOR_ITEM_TOOLTIP_SOURCE_2L))
								else
										tooltip:AddLine(string.format('%s / %s', zoneName, npcName, unpack(COLOR_ITEM_TOOLTIP_SOURCE)))
								end
						end
				else
						tooltip:AddLine(' ')
						tooltip:AddLine(string.format('itemId %d', itemId), unpack(COLOR_ITEM_TOOLTIP))
				end
		else
		--self.logger.Trace("OnGameTooltipSetItem; no link; "..tooltipName)
	end
--]]
end

function addon:BuildPetDataTable()
	local numPets, numOwned = C_PetJournal.GetNumPets();

	local newDataProvider = CreateDataProvider();
	local newDataTable = {}

	for index = 1, C_PetJournal.GetNumPets() do
		local petID, speciesID = C_PetJournal.GetPetInfoByIndex(index);
		newDataProvider:Insert({index = index, petID = petID, speciesID = speciesID});
		if petID then
			speciesID, customName, level, xp, maxXp, displayID, isFavorite, name, icon, petType, creatureID, sourceText, description, isWild, canBattle, tradable, unique = C_PetJournal.GetPetInfoByPetID(petID);
			if ( not speciesID ) then
				return;
			end
			table.insert(newDataTable, 
					{index = index, petID = petID, speciesID = speciesID, creatureID = creatureID, sourceText = sourceText}
				);
		end
	end

	self.petDataTable = newDataTable

--[[
	local count = 0
	local used = 0
	local checked = 0;
	for creatureID, itemID in pairs(DROPPED_PET_IDS) do
		if (itemID and creatureID) then
			count = count + 1
			for internalItemID, dropInfo in pairs(PFH_DB_PETS) do
				if (itemID == internalItemID) then
					used = used + 1
					if (dropInfo.npc_id == creatureID) then
						checked = checked + 1
					else
						print("DROPPED_PET_IDS; ", dropInfo.npc_id.."; "..itemID);
					end
				end
			end
		end
	end
	print("DROPPED_PET_IDS; ", count.."; "..used.."; "..checked);
--]]

end

	-- This code lists every LFG dungeon ID in the game (up through 3000)
	-- for instanceID = 0, 3000 do
	--	local dungeonName, typeId, subtypeId, minLvl, maxLvl, recLvl, minRecLvl, maxRecLvl, expansionId, groupId, textureName, difficulty, maxPlayers, dungeonDesc, isHoliday = GetLFGDungeonInfo(instanceID)
	--		if dungeonName then
	--			self:Print("instanceID = " .. instanceID .. " Name = " .. dungeonName .. " typeID = " .. tostring(typeId) .. " minLvl = " .. minLvl .. " maxLvl = " .. maxLvl .. " recLvl = " .. recLvl .. " groupId = " .. tostring(groupId) .." maxPlayers = " .. tostring(maxPlayers))
	--		end
	-- end
