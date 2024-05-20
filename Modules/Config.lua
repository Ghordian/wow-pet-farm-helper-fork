local addonName, addon = ...

local function vardump (t)
	if (type (t) ~= "table") then
		return
	end
	for a,b in pairs (t) do 
		print (a,b)
	end
end

local Config = addon:NewModule("Config")

local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

-- Set up DataBroker for minimap button
Config.LDB = LibStub("LibDataBroker-1.1"):NewDataObject(addonName, {
		type = 'launcher',
		icon = 'Interface\\ICONS\\INV_Misc_Pet_02',
		label = "Pet Farm Helper",
		OnEnter = function(...)
				addon:ShowTooltip(...)
		end,
		OnLeave = function()
		end,
		OnClick = function(obj, button)
				if button == 'RightButton' then
						InterfaceOptionsFrame_OpenToCategory(addonName)
				end
		end,
	})

local function getOrDefault(db, key)
	local value = db.profile[key]
	if value == nil then
		return Config:Defaults()[key]
	else
		return value
	end
end

local function getFunc(db, key, transform)
	transform = transform or function(...) return ... end

	local func = function()
		local value = getOrDefault(db, key)
		return transform(value)
	end

	return func
end

local function setFunc(db, key, transform)
	transform = transform or function(...) return ... end

	local func = function(_, ...)
		db.profile[key] = transform(...)
		addon:SendMessage("FPH_CONFIG_CHANGED")
	end

	return func
end

local function getColourFunc(db, key)
	return getFunc(db, key, function(colour)
		if colour then return unpack(colour) end
	end)
end

local function setColourFunc(db, key)
	return setFunc(db, key, function(r, g, b, a) return { r, g, b, a } end)
end

function Config:OnModuleLoad()
	--print("Config:OnModuleLoad");
	self:OnDebugToggle()
end

function Config:OnDebugToggle()
	--print("Config:OnDebugToggle");
end

function Config:Defaults()
		return {
				hide_normal = false,
				hide_raid = false,
				hide_world = false,
				hide_quest = false,

				minimap = {
						hide = false,
						minimapPos = 190,
				},

				hide_collected = true,

		}
end

function Config:GetOptions()
	return {
		type = "group",
		name = "Pet Farm Helper by |cFF66ccffGhordian |r",
		desc = "Pet Farm Helper by |cFF66ccffGhordian |rOptions",
		childGroups = "tab",
		args = {
			description = {
				type = "description",
				name = "Version " .. addon.version
			},

			minimapOptions = {
				type = 'group',
				name = "Minimap",
				args = {
						toggleMinimapIcon = {
								name = L.opt_minimap_icon,
								-- desc = L.opt_minimap_icon_desc,
								type = 'toggle',
								set = function(info, value)
										self.db.profile.minimap.hide = not value
										if value then
												self.LibDBIcon:Show(addonName)
										else
												self.LibDBIcon:Hide(addonName)
										end
								end,
								get = function(info)
										return not self.db.profile.minimap.hide
								end,
						},
				},
			},

			profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
		}
	}
end

function Config:Init(addon)
		local addonDBName = addonName .. 'DB'
		self.db = LibStub("AceDB-3.0"):New(addonDBName, { profile = self:Defaults() } )
		self.db.RegisterCallback(addon, "OnProfileChanged", "BuildTooltipData")
		self.db.RegisterCallback(addon, "OnProfileCopied", "BuildTooltipData")
		self.db.RegisterCallback(addon, "OnProfileReset", "BuildTooltipData")

		LibStub("AceConfig-3.0"):RegisterOptionsTable(addonName, Config:GetOptions())
		self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions(addonName, addonName, nil)

		self.LibDBIcon = LibStub("LibDBIcon-1.0")
		self.LibDBIcon:Register(addonName, self.LDB, self.db.profile.minimap)
		self:UpdateMinimapButton()

		if (Config:DebugTracing()) then
				addon:Print("Config:DebugTracing")
		end
end

function Config:OpenOptionsFrame()
	-- https://github.com/Stanzilla/WoWUIBugs/issues/89
	InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
	InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
end

function Config:GetLogLevel()
	return getOrDefault(self.db, "logLevel")
end

function Config:ErrorReporting()
	return getOrDefault(self.db, "ErrorReporting")
end

function Config:DebugTracing()
	return getOrDefault(self.db, "DebugTracing")
end

---

function Config:ToggleMinimapButton()
	self.db.profile.minimap.hide = not self.db.profile.minimap.hide;
	self:UpdateMinimapButton();
end

function Config:UpdateMinimapButton()
	if (self.db.profile.minimap.hide) then
		self.LibDBIcon:Hide(addonName)
	else
		self.LibDBIcon:Show(addonName)
	end
end
