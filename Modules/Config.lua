local ExPack = LibStub("AceAddon-3.0"):GetAddon("ExPack")
local Config = ExPack:NewModule("Config")

local L = LibStub("AceLocale-3.0"):GetLocale("ExPack")

-- Set up DataBroker for minimap button
Config.ExPackLDB = LibStub("LibDataBroker-1.1"):NewDataObject("ExPack", {
	type = "data source",
	text = "Ghordian ExPack",
	label = "ExPack by |cff69CCF0Ghordian",
	icon = "Interface\\AddOns\\Ghordian_ExPack\\logo",
	OnClick = function(self, button)
	if button == "LeftButton" then
		ExPack:OpenOptions()
	elseif button == "RightButton" then
		if IsShiftKeyDown() then
			--ExPack.profile.visualShowCrown = not ExPack.profile.visualShowCrown;
			Config:ToggleVisualGoldenCrown()
		else
			--ExPack.profile.visualShowCaption = not ExPack.profile.visualShowCaption;
			Config:ToggleVisualCaption();
		end
	end
	end,
	OnTooltipShow = function(tooltip)
		tooltip:AddLine("ExPack by |cff69CCF0Ghordian")
		tooltip:AddLine(" ")
		tooltip:AddLine(L.minimapHint, 0.2, 1, 0.2, 1)
		tooltip:AddLine("To toggle minimap button, type '/ep minimap'")
	end
})

Config.Fonts = {
	HighlightSmall = "GameFontHighlightSmall",
	Normal = "GameFontNormalOutline",
	Large = "GameFontNormalLargeOutline",
	Huge = "GameFontNormalHugeOutline",
	NumberNormal = "NumberFontNormal",
	NumberNormalSmall = "NumberFontNormalSmall",
}

Config.PositionOffsets = {
	TOPLEFT = {-2, 0},
	TOPRIGHT = {-2, -2},
	BOTTOMLEFT = {-2, -2},
	BOTTOMRIGHT = {0, 0},
	BOTTOM = {0, 0},
	TOP = {0, 0},
	LEFT = {2, 0},
	RIGHT = {2, 0},
	CENTER = {0, 0},
}

Config.Positions = {
	LEFT = L["LEFT"],
	BOTTOMLEFT = L["BOTTOMLEFT"],
	TOPLEFT = L["TOPLEFT"],
	RIGHT = L["RIGHT"],
	TOPRIGHT = L["TOPRIGHT"],
	BOTTOMRIGHT = L["BOTTOMRIGHT"],
	TOP = L["TOP"],
	BOTTOM = L["BOTTOM"],
	CENTER = L["CENTER"],
}

	local fonts = {}
	for k,v in pairs(Config.Fonts) do
		fonts[k] = k
	end

	local positions = {}
	for k,v in pairs(Config.Positions) do
		positions[k] = v
	end

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
		ExPack:SendMessage("EXPACK_CONFIG_CHANGED")
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

function Config:Defaults()
	return {
--		general = {
			Enabled = true,
--		},
			minimap = {
				hide = false,
				minimapPos = 190,
			},
--		filters = {
			filtersShowAll = false,
			filtersShowReagents = true,
			filtersShowConsumable = true,
			filtersShowTradegoods = true,
			filtersShowJunk = true,
			filtersShowQuestitem = false,
			filtersShowArmory = false,
			filtersShowBanks = false,
			filtersShowMerchants = false,
			filtersShowOpenMailAttachments = true,	--	[ren] filtersShowAttachments
		  filtersShowSendmailAttachments = false,	--	[add]
			filtersAnyExpansion = true,
			filtersCurrentExpack = true,
			filtersOldExpacks = true,
--		},
--		reports = {
			ErrorReporting = false,
			DebugTracing = false,
			logLevel = "WARN",
--		},
--		visual = {
			visualShowCaption = true,
			visualPosition = "TOPLEFT",
			visualFont = "NumberNormalSmall",
			visualScale = 1.0,
			visualShowCrown = false,
			visualCrownPosition = "BOTTOMLEFT",
			visualOffsetY = -4,
			visualOffsetX = -4,
			visualCrownSize = 14,
--		},
--		advanced = {
			UseLibItemInfo = true,
			UseItemVersion = true,
--		},
	}
end

function Config:GetOptions()
	return {
		type = "group",
		name = "ExPack by |cFF66ccffGhordian |r",
		desc = "ExPack by |cFF66ccffGhordian |rOptions",
		childGroups = "tab",
		args = {
			description = {
				type = "description",
				name = "Version " .. ExPack.version
			},
			generalOptions = {
				type = "group",
				name = "General",
				order = 1,
				args = {
					Section2 = {
						type = "header",
						name = L["Commands"],
						order = 40,
					},
					CMDs = {
						type = "description",
						name = L["/ep : Brings up this window."],
						fontSize = "medium",
						order = 41,
					},
					CMDs = {
						type = "description",
						name = "/ep minimap : will toggle the minimap icon.",
						fontSize = "medium",
						order = 42,
					},
					Section3 = {
						type = "header",
						name = "Synopsis",
						order = 50,
					},
					Synopsis = {
						type = "description",
						name = "Item ExPack Overlay addon.\r\n"..
							"\r\n" .. 
							"This addon will scan any item slot to apply a text overlay on will be shown the abbreviation of the "..
							"expansion pack the item belongs.\r\n\r\n" ..
							"The text will be colored by the most popular color of the expansion, so it will be easily recognized "..
							"event when the background is dark.\r\n" ..
							"\r\n" ..
							"TODO's\r\n"..
							" + Add more filter options.\r\n"..
							" + Add more visual options.\r\n"..
							" + Compatibility with many bag's addons like (but not only) Bagnon, AdiBags, OneBag3.\r\n"..
							"\r\n" ..
							"All item information is gathered from Wowhead.\r\n" ..
							"\r\n"..
							"Thank you all for your feedback and suggestions!",
						fontSize = "medium",
						order = 51,
					},
					Section4 = {
						type = "header",
						name = L["Author"],
						order = 60,
					},
					About = {
						type = "description",
						name = "Hi, I'm Ghordian from EU-Mazrigos.\r\n\r\n" ..
							"I have been playing WoW since 2009 but never dare to write my own addon until now ;-)\r\n" ..
							"\r\n\r\n" ..
							"CREDITS: I do not own any of the images for the icons.\r\n" ..
							"I do not own the ItemVersion data table.\r\n\r\n"..
							"I want to thank my fellow guild members for being the first beta testers.\r\n",
						fontSize = "medium",
						order = 61,
					},
				}
			}, -- generalOptions

			minimapOptions = {
				type = 'group',
				order = 4,
				name = "Minimap",
				get = get,
				set = set,
				args = {
					toggleMinimapIcon = {
						type = "toggle",
						name = "Hide/show minimap button",
						desc = L["Hide/show minimap button"],
						width = "double",
						get = function(info) return self.db.profile.minimap.hide; end,
						set = function(info, v) 
							self.db.profile.minimap.hide = v;
							self:UpdateMinimapButton();
						end,
						order = 1,
					},
					--[[
					rangeMinimapPos = {
						type = "range",
						name = "Position",
						desc = "...",
						width = "normal",
						--width = "double",
						min = 0.5,
						max = 2.0,
						step = 0.1,
						get = get,
						set = set,
						order = 2,
					},
					--]]
				}
			}, -- End minimap block settings

			filtersOptions = {
				type = 'group',
				order = 2,
				name = L["Filter Options"],
				get = get,
				set = set,
				args = {
					Section1 = {
						type = "header",
						name = "Items",
						order = 1,
					},
					ShowAll = {
						type = "toggle",
						name = L["ShowAll"],
						desc = L.ShowAllDesc,
						width = "double",
						get = function(info) return self.db.profile.filtersShowAll; end,
						set = function(info, v) self.db.profile.filtersShowAll = v end,
						order = 2,
					},
					ShowByType = {
						order = 3,
						type = "group",
						inline = true,
						name = L.ShowByType,
						--desc = "Shows only for selected type of item",
						args = {
							ShowReagents = {
								type = "toggle",
								name = L["ShowReagents"],
								--desc = "Displays which expansion reagents is from",
								width = "double",
								get = function(info) return self.db.profile.filtersShowReagents; end,
								set = function(info, v) self.db.profile.filtersShowReagents = v 
									or not(
							--	ExPack.db.profile.filtersShowReagents or
										self.db.profile.filtersShowConsumable or
										self.db.profile.filtersShowTradegoods or
										self.db.profile.filtersShowJunk or
										self.db.profile.filtersShowQuestitem or
										self.db.profile.filtersShowArmory
										)
								end,
								disabled = function(info) return self.db.profile.filtersShowAll; end,
								order = 3,
							},
							ShowConsumable = {
								type = "toggle",
								name = L["ShowConsumable"],
								--desc = "Displays which expansion consumables is from",
								width = "double",
								get = function(info) return self.db.profile.filtersShowConsumable; end,
								set = function(info, v) self.db.profile.filtersShowConsumable = v 
									or not(
										self.db.profile.filtersShowReagents or
							--	ExPack.db.profile.filtersShowConsumable or
										self.db.profile.filtersShowTradegoods or
										self.db.profile.filtersShowJunk or
										self.db.profile.filtersShowQuestitem or
										self.db.profile.filtersShowArmory
										)
								end,
								disabled = function(info) return self.db.profile.filtersShowAll; end,
								order = 4,
							},
							ShowTradegoods = {
								type = "toggle",
								name = L["ShowTradegoods"],
								--desc = "Displays which expansion tradegoods is from",
								width = "double",
								get = function(info) return self.db.profile.filtersShowTradegoods; end,
								set = function(info, v) self.db.profile.filtersShowTradegoods = v 
									or not(
										self.db.profile.filtersShowReagents or
										self.db.profile.filtersShowConsumable or
							--	ExPack.db.profile.filtersShowTradegoods or
										self.db.profile.filtersShowJunk or
										self.db.profile.filtersShowQuestitem or
										self.db.profile.filtersShowArmory
										)
								end,
								disabled = function(info) return self.db.profile.filtersShowAll; end,
								order = 5,
							},
							ShowJunk = {
								type = "toggle",
								name = L["ShowJunk"],
								--desc = "Displays which expansion junks is from",
								width = "double",
								get = function(info) return self.db.profile.filtersShowJunk; end,
								set = function(info, v) self.db.profile.filtersShowJunk = v 
									or not(
										self.db.profile.filtersShowReagents or
										self.db.profile.filtersShowConsumable or
										self.db.profile.filtersShowTradegoods or
							--	ExPack.db.profile.filtersShowJunk or
										self.db.profile.filtersShowQuestitem or
										self.db.profile.filtersShowArmory
										)
								end,
								disabled = function(info) return self.db.profile.filtersShowAll; end,
								order = 6,
							},
							ShowQuestitem = {
								type = "toggle",
								name = L["ShowQuestitem"],
								--desc = "Displays which expansion questitem is from",
								width = "double",
								get = function(info) return self.db.profile.filtersShowQuestitem; end,
								set = function(info, v) self.db.profile.filtersShowQuestitem = v 
									or not(
										self.db.profile.filtersShowReagents or
										self.db.profile.filtersShowConsumable or
										self.db.profile.filtersShowTradegoods or
										self.db.profile.filtersShowJunk or
							--	ExPack.db.profile.filtersShowQuestitem or
										self.db.profile.filtersShowArmory
										)
								end,
								disabled = function(info) return self.db.profile.filtersShowAll; end,
								order = 7,
							},
							ShowArmory  = {
								type = "toggle",
								name = L["ShowArmory"],
								--desc = "Displays which expansion armory is from",
								width = "double",
								get = function(info) return self.db.profile.filtersShowArmory; end,
								set = function(info, v) self.db.profile.filtersShowArmory = v 
									or not(
										self.db.profile.filtersShowReagents or
										self.db.profile.filtersShowConsumable or
										self.db.profile.filtersShowTradegoods or
										self.db.profile.filtersShowJunk or
										self.db.profile.filtersShowQuestitem 
							--	ExPack.db.profile.filtersShowArmory
										)
								end,
								disabled = function(info) return self.db.profile.filtersShowAll; end,
								order = 8,
							},
						},
					},

					Section2 = {
						type = "header",
						name = L["Banks"],
						order = 15,
					},
					ShowBanks = {
						type = "toggle",
						name = L["Enable Banks Only"],
						desc = L.ShowBanksDesc,
						width = "double",
						get = function(info) return self.db.profile.filtersShowBanks; end,
						set = function(info, v) self.db.profile.filtersShowBanks = v; end,
						order = 20,
					},

					Section21 = {
						type = "header",
						name = L.Merchants,
						order = 25,
					},
					ShowMerchants = {
						type = "toggle",
						name = L.EnableMerchants,
						desc = L.ShowMerchantsDesc,
						width = "double",
						get = function(info) return self.db.profile.filtersShowMerchants; end,
						set = function(info, v) self.db.profile.filtersShowMerchants = v; end,
						order = 30,
					},

					Section22 = {
						type = "header",
						name = L.MailAttachments,
						order = 35,
					},
					ShowOpenMailAttachments = {
						type = "toggle",
						name = L.EnableOpenMailAttachments,
						desc = L.ShowAttachmentsDesc,
						width = "double",
						get = function(info) return self.db.profile.filtersShowOpenMailAttachments; end,
						set = function(info, v) self.db.profile.filtersShowOpenMailAttachments = v; end,
						order = 40,
					},
					ShowSendMailAttachments = {
						type = "toggle",
						name = L.EnableSendMailAttachments,
						desc = L.ShowAttachmentsDesc,
						width = "double",
						get = function(info) return self.db.profile.filtersShowSendMailAttachments; end,
						set = function(info, v) self.db.profile.filtersShowSendMailAttachments = v; end,
						order = 41,
					},

					Section4 = {
						type = "header",
						name = L["Expansions"],
						order = 45,
					},
					AnyExpansion = {
						type = "toggle",
						name = L["Enable Any Expansion"],
						desc = L.EnabledAnyExpansionDesc,
						width = "double",
						get = function(info) return self.db.profile.filtersAnyExpansion; end,
						set = function(info, v) self.db.profile.filtersAnyExpansion = v; end,
						order = 50,
					},

					ByExpansion = {
						order = 55,
						type = "group",
						inline = true,
						name = L.EnabledByExpansion,
						--desc = "Shows only for selected expansion packs",
						args = {
							CurrentExpack = {
								type = "toggle",
								name = L["Enable Current Expack"],
								desc = L.CurrentExpackDesc,
								width = "double",
								get = function(info) return self.db.profile.filtersCurrentExpack; end,
								set = function(info, v) self.db.profile.filtersCurrentExpack = v 
									or not ( self.db.profile.filtersOldExpacks )
								end,
								disabled = function(info) return self.db.profile.filtersAnyExpansion; end,
								order = 60,
							},
							OldExpacks = {
								type = "toggle",
								name = L["Enable Old Expacks"],
								desc = L.OldExpacksDesc,
								width = "double",
								get = function(info) return self.db.profile.filtersOldExpacks; end,
								set = function(info, v) self.db.profile.filtersOldExpacks = v
									or not ( self.db.profile.filtersCurrentExpack )
								end,
								disabled = function(info) return self.db.profile.filtersAnyExpansion; end,
								order = 65,
							},
						},
					}
				} -- args
			}, -- End Filters block settings

			visualOptions = {
				type = 'group',
				order = 3,
				name = L["Visual Options"],
				get = get,
				set = set,
				args = {
					CaptionSection = {
						type = "header",
						name = L["Caption"],
						order = 1,
					},
					VisualShowCaption = {
						type = "toggle",
						name = L["Show Item Caption"],
						desc = L["ShowItemCaptionDesc"],
						width = "double",
						get = function(info) return self.db.profile.visualShowCaption; end,
						set = function(info, v) self.db.profile.visualShowCaption = v 
							or not self.db.profile.visualShowCrown; 
						end,
						order = 2,
					},
					CaptionSection2 = {
						type = "header",
						name = "",
						order = 3,
					},
					CaptionPosition = {
						type = "select",
						name = L["PositionName"],
						desc = L["PositionDesc"],
						width = "normal",
						--width = "double",
						--style= "radio",
						values = positions,
						get = function(info) return self.db.profile.visualPosition; end,
						set = function(info, v) self.db.profile.visualPosition = v; end,
						disabled = function(info) return not self.db.profile.visualShowCaption; end,
						order = 3,
					},
					CaptionFont = {
						type = "select",
						name = L["FontName"],
						desc = L["FontDesc"],
						width = "normal",
						--width = "double",
						--style = "radio",
						values = fonts,
						get = function(info) return self.db.profile.visualFont; end,
						set = function(info, v) self.db.profile.visualFont = v; end,
						disabled = function(info) return not self.db.profile.visualShowCaption; end,
						order = 4,
					},
					CaptionFontScale = {
						type = "range",
						name = L.FontScale,
						desc = "...",
						width = "normal",
						--width = "double",
						min = 0.5,
						max = 2.0,
						step = 0.1,
						get = function(info) return self.db.profile.visualScale; end,
						set = function(info, v) self.db.profile.visualScale = v; end,
						disabled = function(info) return not self.db.profile.visualShowCaption; end,
						order = 5,
					},

					GoldenCrownSection = {
						type = "header",
						name = L["ShowGoldenCrown"],
						order = 6,
					},
					VisualShowCrown = {
						type = "toggle",
						name = L["ShowGoldenCrown"],
						desc = L["ShowGoldenCrownDesc"],
						width = "double",
						get = function(info) return self.db.profile.visualShowCrown; end,
						set = function(info, v) self.db.profile.visualShowCrown = v 
							or not self.db.profile.visualShowCaption; 
						end,
						order = 7,
					},
					GoldenCrownSection2 = {
						type = "header",
						name = "",
						order = 8,
					},
					VisualCrownPosition = {
						name = L.CrownIconPosition,
						desc = "The position of the crown icon.",
						--width = "double",
						width = "normal",
						type = "select",
						values = {
							CENTER = "CENTER",
							LEFT = "LEFT",
							RIGHT = "RIGHT",
							BOTTOMLEFT = "BOTTOMLEFT",
							BOTTOMRIGHT = "BOTTOMRIGHT",
							TOPLEFT = "TOPLEFT",
							TOPRIGHT = "TOPRIGHT",
						},
						order = 9,
						disabled = function(info) return not self.db.profile.visualShowCrown; end,
						get = getFunc(self.db, "visualCrownPosition"),
						set = setFunc(self.db, "visualCrownPosition"),
					},
					VisualCrownSize = {
						name = L.CrownIconSize,
						desc = "The size of the crown icon.",
						--width = "double",
						width = "normal",
						type = "range",
						min = 0,
						max = 50,
						order = 10,
						disabled = function(info) return not self.db.profile.visualShowCrown; end,
						get = getFunc(self.db, "visualCrownSize"),
						set = setFunc(self.db, "visualCrownSize")
					},
					VisualVOffset = {
						name = L.CrownIconVOffset,
						desc = "The vertical offset position of the crown icon.",
						width = "double",
						type = "range",
						min = -10,
						max = 10,
						order = 11,
						disabled = function(info) return not self.db.profile.visualShowCrown; end,
						get = getFunc(self.db, "visualOffsetY"),
						set = setFunc(self.db, "visualOffsetY")
					},
					VisualHOffset = {
						name = L.CrownIconHOffset,
						desc = "The horizontal offset position of the crown icon.",
						width = "double",
						type = "range",
						min = -10,
						max = 10,
						order = 12,
						disabled = function(info) return not self.db.profile.visualShowCrown; end,
						get = getFunc(self.db, "visualOffsetX"),
						set = setFunc(self.db, "visualOffsetX")
					},

					ExpansionSection = {
						type = "header",
						name = L["Expansions"],
						width = "double",
						order = 14,
					},
					IconRecommend = {
						type = "description",
						name =  ExPack.majorToExpac[1].color.. " " .. ExPack.majorToExpac[1].shortName .. "|r - " ..ExPack.majorToExpac[1].canonName.."\r\n"..
										ExPack.majorToExpac[2].color.. " " .. ExPack.majorToExpac[2].shortName .. "|r - " ..ExPack.majorToExpac[2].canonName.."\r\n"..
										ExPack.majorToExpac[3].color.. " " .. ExPack.majorToExpac[3].shortName .. "|r - " ..ExPack.majorToExpac[3].canonName.."\r\n"..
										ExPack.majorToExpac[4].color.. " " .. ExPack.majorToExpac[4].shortName .. "|r - " ..ExPack.majorToExpac[4].canonName.."\r\n"..
										ExPack.majorToExpac[5].color.. " " .. ExPack.majorToExpac[5].shortName .. "|r - " ..ExPack.majorToExpac[5].canonName.."\r\n"..
										ExPack.majorToExpac[6].color.. " " .. ExPack.majorToExpac[6].shortName .. "|r - " ..ExPack.majorToExpac[6].canonName.."\r\n"..
										ExPack.majorToExpac[7].color.. " " .. ExPack.majorToExpac[7].shortName .. "|r - " ..ExPack.majorToExpac[7].canonName.."\r\n"..
										ExPack.majorToExpac[8].color.. " " .. ExPack.majorToExpac[8].shortName .. "|r - " ..ExPack.majorToExpac[8].canonName.."\r\n"..
										ExPack.majorToExpac[9].color.. " " .. ExPack.majorToExpac[9].shortName .. "|r - " ..ExPack.majorToExpac[9].canonName.."\r\n"..
										ExPack.majorToExpac[10].color.." " .. ExPack.majorToExpac[10].shortName.. "|r - " ..ExPack.majorToExpac[10].canonName.."\r\n",
						width = "full",
						fontSize = "medium",
						order = 15,
					},

				}
			}, -- End visual block settings

			reportsOptions = {
				type = 'group',
				order = 5,
				name = L["Reports Options"],
				get = get,
				set = set,
				args = {
					ErrorReporting = {
						type = "toggle",
						name = L["Report errors to chat window"],
						desc = "Report errors to chat window",
						width = "double",
						get = function(info) return self.db.profile.ErrorReporting; end,
						set = function(info, v) self.db.profile.ErrorReporting = v; end,
						order = 2,
					},
					DebugTracing = {
						type = "toggle",
						name = L["Report debug tracing to chat window"],
						desc = "Report debug tracing to chat window",
						width = "double",
						get = function(info) return self.db.profile.DebugTracing; end,
						set = function(info, v) self.db.profile.DebugTracing = v; end,
						order = 3,
					},
					logLevel = {
						name = "Log Level",
						desc = "Determines the minimum level/type of log messages to be printed.",
						width = "double",
						type = "select",
						values = {
							TRACE = "TRACE",
							DEBUG = "DEBUG",
							INFO = "INFO",
							WARN = "WARN",
							ERROR = "ERROR"
						},
						sorting = { "TRACE", "DEBUG", "INFO", "WARN", "ERROR" },
						order = 4,
						get = function(info) return self.db.profile.logLevel; end,
						set = function(info, v) self.db.profile.logLevel = v; end,
					},
					Section2 = {
						type = "header",
						name = L["ReloadUI"],
						order = 10,
					},
					ResetExPack = {
						type = "execute",
						name = L["Reset ExPack (Reloads UI after)"],
						desc = "Recommended after addon updates to correct missing profile settings.",
						width = "double",
						func = function()
							ExPackDB = nil;
							ExPackDB = {};
							ExPackDB.profile = self.db.defaults.profile;
							ReloadUI();
						end,
						order = 11,
					},
				},
			}, -- End reports block settings

			profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
		}
	}
end

function Config:Init(addon)
	self.db = LibStub("AceDB-3.0"):New("Ghordian_ExPackDB", { profile = self:Defaults() })
	self.db.RegisterCallback(addon, "OnProfileChanged", "UpdateSlots")
	self.db.RegisterCallback(addon, "OnProfileCopied", "UpdateSlots")
	self.db.RegisterCallback(addon, "OnProfileReset", "UpdateSlots")

	LibStub("AceConfig-3.0"):RegisterOptionsTable("ExPack", self:GetOptions())
	self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("ExPack", "ExPack")

	self.LibDBIcon = LibStub("LibDBIcon-1.0")
	self.LibDBIcon:Register("ExPack", self.ExPackLDB, self.db.profile.minimap)
	self:UpdateMinimapButton()

	if (Config:DebugTracing()) then
		ExPack.Print("Config:DebugTracing");
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

function Config:UseLibItemInfo()
	return getOrDefault(self.db, "UseLibItemInfo")
end

function Config:ErrorReporting()
	return getOrDefault(self.db, "ErrorReporting")
end

function Config:DebugTracing()
	return getOrDefault(self.db, "DebugTracing")
end

function Config:UseItemVersion()
	return getOrDefault(self.db, "UseItemVersion");
end

---

function Config:ToggleVisualGoldenCrown()
	ExPack:dPrint(BINDING_NAME_EXPACK_GOLDENCROWN);
	self.db.profile.visualShowCrown = not self.db.profile.visualShowCrown;
	ExPack:ExPack_ScanBags();
end

function Config:ToggleMinimapButton()
	self.db.profile.minimap.hide = not self.db.profile.minimap.hide;
	self:UpdateMinimapButton();
end

function Config:ToggleVisualCaption()
	ExPack:dPrint(BINDING_NAME_EXPACK_CAPTION);
	self.db.profile.visualShowCaption = not self.db.profile.visualShowCaption;
	ExPack:ExPack_ScanBags();
end

function Config:UpdateMinimapButton()
	if (self.db.profile.minimap.hide) then
		self.LibDBIcon:Hide("ExPack")
	else
		self.LibDBIcon:Show("ExPack")
	end
end

--[[
          showTooltip = {
            name = "Tooltip Text",
            desc = "If enabled, known items will have text added to the tooltip to indicate so.",
            type = "toggle",
            order = 4,
            get = getFunc(self.db, "showTooltip"),
            set = setFunc(self.db, "showTooltip"),
          },
--]]
