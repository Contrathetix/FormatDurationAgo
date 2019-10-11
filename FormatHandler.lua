LastOnlineFormat.FormatHandler = {}

LastOnlineFormat.FormatHandler.FormatFunctions = {}

function LastOnlineFormat.FormatHandler.FormatFunctions.FormatDefault(seconds)
    if(seconds < ZO_ONE_MINUTE_IN_SECONDS) then
        return GetString(SI_TIME_DURATION_NOT_LONG_AGO)
    else
        return zo_strformat(SI_TIME_DURATION_AGO, ZO_FormatTime(seconds, TIME_FORMAT_STYLE_SHOW_LARGEST_UNIT_DESCRIPTIVE, TIME_FORMAT_PRECISION_SECONDS))
    end
end

function LastOnlineFormat.FormatHandler.FormatFunctions.FormatISO(seconds)
    return os.date('%Y-%m-%d %H:%M:%S', os.time() - seconds)
end

function LastOnlineFormat.FormatHandler.FormatFunctions.FormatDefaultISO(seconds)
    local defaultFormat = LastOnlineFormat.FormatHandler.FormatFunctions.FormatDefault(seconds)
    local isoFormat = LastOnlineFormat.FormatHandler.FormatFunctions.FormatISO(seconds)
    return defaultFormat..'\n'..isoFormat
end

function LastOnlineFormat.FormatHandler.FormatFunctions.FormatISODefault(seconds)
    local defaultFormat = LastOnlineFormat.FormatHandler.FormatFunctions.FormatDefault(seconds)
    local isoFormat = LastOnlineFormat.FormatHandler.FormatFunctions.FormatISO(seconds)
    return isoFormat..'\n'..defaultFormat
end

LastOnlineFormat.FormatHandler.FunctionMap = {
    [LastOnlineFormat.Constants.LAST_ONLINE_FORMAT_DEFAULT] = LastOnlineFormat.FormatHandler.FormatFunctions.FormatDefault,
    [LastOnlineFormat.Constants.LAST_ONLINE_FORMAT_ISO] = LastOnlineFormat.FormatHandler.FormatFunctions.FormatISO,
    [LastOnlineFormat.Constants.LAST_ONLINE_FORMAT_DEFAULT_ISO] = LastOnlineFormat.FormatHandler.FormatFunctions.FormatDefaultISO,
    [LastOnlineFormat.Constants.LAST_ONLINE_FORMAT_ISO_DEFAULT] = LastOnlineFormat.FormatHandler.FormatFunctions.FormatISODefault
}

function LastOnlineFormat.FormatHandler.FormatDurationAgo(seconds)
    local formatFunction = LastOnlineFormat.FormatHandler.FunctionMap[LastOnlineFormat.ConfigSaved.DisplayMode]
    return formatFunction(seconds)
end
