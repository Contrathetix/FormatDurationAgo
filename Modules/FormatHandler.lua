FormatDurationAgo.FormatHandler = {}

FormatDurationAgo.FormatHandler.FormatFunctions = {}

function FormatDurationAgo.FormatHandler.FormatFunctions.FixSeconds(seconds)
    if seconds > 946677600 then
        return os.time() - seconds
    else
        return seconds
    end
end

function FormatDurationAgo.FormatHandler.FormatFunctions.FormatDefault(seconds)
    if(seconds < ZO_ONE_MINUTE_IN_SECONDS) then
        return GetString(SI_TIME_DURATION_NOT_LONG_AGO)
    else
        return zo_strformat(
            SI_TIME_DURATION_AGO,
            ZO_FormatTime(seconds, TIME_FORMAT_STYLE_SHOW_LARGEST_UNIT_DESCRIPTIVE, TIME_FORMAT_PRECISION_SECONDS)
        )
    end
end

function FormatDurationAgo.FormatHandler.FormatFunctions.FormatIso(seconds)
    return os.date('%Y-%m-%d %H:%M:%S', os.time() - seconds)
end

function FormatDurationAgo.FormatHandler.FormatFunctions.FormatCustom(seconds)
    return os.date(FormatDurationAgo.ConfigSaved.CustomFormat, os.time() - seconds)
end

function FormatDurationAgo.FormatHandler.FormatFunctions.FormatDefaultIso(seconds)
    local defaultFormat = FormatDurationAgo.FormatHandler.FormatFunctions.FormatDefault(seconds)
    local isoFormat = FormatDurationAgo.FormatHandler.FormatFunctions.FormatIso(seconds)
    return defaultFormat..'\n'..isoFormat
end

function FormatDurationAgo.FormatHandler.FormatFunctions.FormatIsoDefault(seconds)
    local defaultFormat = FormatDurationAgo.FormatHandler.FormatFunctions.FormatDefault(seconds)
    local isoFormat = FormatDurationAgo.FormatHandler.FormatFunctions.FormatIso(seconds)
    return isoFormat..'\n'..defaultFormat
end

FormatDurationAgo.FormatHandler.FunctionMap = {
    [FormatDurationAgo.Constants.TimeFormatDefault] = FormatDurationAgo.FormatHandler.FormatFunctions.FormatDefault,
    [FormatDurationAgo.Constants.TimeFormatDefaultIso] = FormatDurationAgo.FormatHandler.FormatFunctions.FormatDefaultIso,
    [FormatDurationAgo.Constants.TimeFormatIso] = FormatDurationAgo.FormatHandler.FormatFunctions.FormatIso,
    [FormatDurationAgo.Constants.TimeFormatIsoDefault] = FormatDurationAgo.FormatHandler.FormatFunctions.FormatIsoDefault,
    [FormatDurationAgo.Constants.TimeFormatCustom] = FormatDurationAgo.FormatHandler.FormatFunctions.FormatCustom
}

function FormatDurationAgo.FormatHandler.FormatDurationAgo(seconds)
    local secondsFixed = FormatDurationAgo.FormatHandler.FormatFunctions.FixSeconds(seconds)
    local formatFunction = FormatDurationAgo.FormatHandler.FunctionMap[FormatDurationAgo.ConfigSaved.DisplayMode]
    return formatFunction(secondsFixed)
end
