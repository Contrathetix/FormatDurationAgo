LastOnlineFormat.ConfigMenu = {}

LastOnlineFormat.DisplayModeDropdownOptions = {
    [LastOnlineFormat.Constants.LAST_ONLINE_FORMAT_DEFAULT] = LastOnlineFormat.Strings.OptionDefault,
    [LastOnlineFormat.Constants.LAST_ONLINE_FORMAT_ISO] = LastOnlineFormat.Strings.OptionISO,
    [LastOnlineFormat.Constants.LAST_ONLINE_FORMAT_DEFAULT_ISO] = LastOnlineFormat.Strings.OptionDefaultISO,
    [LastOnlineFormat.Constants.LAST_ONLINE_FORMAT_ISO_DEFAULT] = LastOnlineFormat.Strings.OptionISODefault
}

function LastOnlineFormat.ConfigMenu.Initialize()

    local LAM2 = LibStub:GetLibrary('LibAddonMenu-2.0')

    -- Skip the configuration if there is no LibAddonMenu
    if LAM2 == nil then return end

    local panelData = {
        type = 'panel',
        name = LastOnlineFormat.Constants.ADD_ON_TITLE,
        displayName = LastOnlineFormat.Constants.ADD_ON_TITLE,
        author = LastOnlineFormat.Constants.ADD_ON_AUTHOR,
        version = LastOnlineFormat.Constants.ADD_ON_VERSION,
        registerForRefresh = true
    }

    LAM2:RegisterAddonPanel('LastOnlineFormatConfig', panelData)

    local optionsData = {
        [1] = LastOnlineFormat.ConfigMenu.GetDisplayModeDropdownOption()
    }

    LAM2:RegisterOptionControls('LastOnlineFormatConfig', optionsData)

end

function LastOnlineFormat.ConfigMenu.GetDisplayModeDropdownOption()
    return {
        type = 'dropdown',
        name = LastOnlineFormat.Strings.DisplayMode,
        tooltip = nil,
        choices = {
            LastOnlineFormat.Strings.OptionDefault,
            LastOnlineFormat.Strings.OptionISO,
            LastOnlineFormat.Strings.OptionDefaultISO,
            LastOnlineFormat.Strings.OptionISODefault
        },
        getFunc = function()
            return LastOnlineFormat.DisplayModeDropdownOptions[LastOnlineFormat.ConfigSaved.DisplayMode]
        end,
        setFunc = function(var)
            for key, value in pairs(LastOnlineFormat.DisplayModeDropdownOptions) do
                if value == var then
                    LastOnlineFormat.ConfigSaved.DisplayMode = key
                end
            end
        end,
    }
end
