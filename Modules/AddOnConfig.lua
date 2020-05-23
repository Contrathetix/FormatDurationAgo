function FormatDurationAgo.GetDefaultConfig()
    return {
        DisplayMode = FormatDurationAgo.Constants.TimeFormatDefault,
        CustomFormat = '%Y-%m-%d %H:%M:%S'
    }
end

function FormatDurationAgo.OnAddOnLoaded(_, addOnName)

    if addOnName  ~= FormatDurationAgo.Constants.AddOnTitle then return end

    EVENT_MANAGER:UnregisterForEvent(FormatDurationAgo.Constants.AddOnTitle, EVENT_ADD_ON_LOADED)

    FormatDurationAgo.ConfigSaved = ZO_SavedVars:New(
        FormatDurationAgo.Constants.AddOnSavedVariableName,
        FormatDurationAgo.Constants.AddOnSavedVariableVersion,
        FormatDurationAgo.Constants.AddOnSavedVariableAccountWide,
        FormatDurationAgo.GetDefaultConfig()
    )

    FormatDurationAgo.ConfigMenu.Initialize()

    ZO_FormatDurationAgo = FormatDurationAgo.FormatHandler.FormatDurationAgo

end

EVENT_MANAGER:RegisterForEvent(FormatDurationAgo.Constants.AddOnTitle, EVENT_ADD_ON_LOADED, FormatDurationAgo.OnAddOnLoaded)
