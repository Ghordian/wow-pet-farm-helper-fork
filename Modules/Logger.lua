local addonName, addon = ...
--local addonName = "PetFarmHelper"

--local PetFarmHelper = LibStub("AceAddon-3.0"):GetAddon(addonName)
local Logger = addon:NewModule("Logger")

local logLevels = {
	TRACE = 0,
	DEBUG = 1,
	INFO = 2,
	WARN = 3,
	ERROR = 4
}

local bLoggerInit = false;

function Logger:Init(config)
	self.config = config
	--self:Print(self:Cyan("[DEBUG]"), "Logger:Init")
	bLoggerInit = true;
end

function Logger:GetLogLevel()
	if bLoggerInit then
		if self.config then
			return self.config:GetLogLevel()
		else
			return logLevels.DEBUG;
		end
	else
		return logLevels.DEBUG;
	end
end

function Logger:Trace(...)
	self:MaybeLog("TRACE", self:Cyan("[TRACE]"), ...)
end


function Logger:Debug(...)
	local bShow = false
	if self.config then
		bShow = self.config:DebugTracing()
	end
	if bShow then
		PetFarmHelper:Print(self:Cyan("[DEBUG]"), ...)
	else
		self:MaybeLog("DEBUG", self:Cyan("[DEBUG]"), ...)
	end
end

function Logger:Info(...)
	self:MaybeLog("INFO", self:Yellow("[INFO]"), ...)
end

function Logger:Warn(...)
	self:MaybeLog("WARN", self:Red("[WARN]"), ...)
end

function Logger:Error(...)
	local bShow = false
	if self.config then
		bShow = self.config:ErrorReporting();
	end
	if bShow then
		PetFarmHelper:Print(self:Red("[ERROR]"), ...)
	else
		self:MaybeLog("ERROR", ...)
	end
end

function Logger:Print(...)
	PetFarmHelper:Print(...)
end

function Logger:MaybeLog(level, ...)
	local logLevel = self:GetLogLevel()
	if (logLevels[logLevel] <= logLevels[level]) then
		PetFarmHelper:Print(...)
	end
end

function Logger:Yellow(...)
	return "|cFFFFFF00" .. ... .. "|r"
end

function Logger:Cyan(...)
	return "|cFF00FFFF" .. ... .. "|r"
end

function Logger:Red(...)
	return "|cFFFF0000" .. ... .. "|r"
end

function Logger:BoolToStr(v)
	if v then
		return "true"
	else
		return "false"
	end
end
