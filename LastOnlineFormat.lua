function LastOnlineFormat.GetDefaultConfig()
    return { DisplayMode = LastOnlineFormat.Constants.LAST_ONLINE_FORMAT_DEFAULT }
end

function LastOnlineFormat.OnAddOnLoaded(_, addOnName)

    if addOnName  ~= LastOnlineFormat.Constants.ADD_ON_TITLE then return end

    EVENT_MANAGER:UnregisterForEvent(LastOnlineFormat.Constants.ADD_ON_TITLE, EVENT_ADD_ON_LOADED)

    LastOnlineFormat.ConfigSaved = ZO_SavedVars:New(
        LastOnlineFormat.Constants.ADD_ON_SAVED_VARIABLE_NAME,
        LastOnlineFormat.Constants.ADD_ON_SAVED_VARIABLE_VERSION,
        LastOnlineFormat.Constants.ADD_ON_SAVED_VARIABLE_ACCOUNTWIDE,
        LastOnlineFormat.GetDefaultConfig()
    )

    LastOnlineFormat.ConfigMenu.Initialize()

    ZO_FormatDurationAgo = LastOnlineFormat.FormatHandler.FormatDurationAgo

end

EVENT_MANAGER:RegisterForEvent(LastOnlineFormat.Constants.ADD_ON_TITLE, EVENT_ADD_ON_LOADED, LastOnlineFormat.OnAddOnLoaded)
