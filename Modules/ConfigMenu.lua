FormatDurationAgo.ConfigMenu = {}

FormatDurationAgo.DisplayModeDropdownOptions = {
    [FormatDurationAgo.Constants.TimeFormatDefault] = FormatDurationAgo.Strings.OptionDefault,
    [FormatDurationAgo.Constants.TimeFormatDefaultIso] = FormatDurationAgo.Strings.OptionDefaultIso,
    [FormatDurationAgo.Constants.TimeFormatIso] = FormatDurationAgo.Strings.OptionIso,
    [FormatDurationAgo.Constants.TimeFormatIsoDefault] = FormatDurationAgo.Strings.OptionIsoDefault,
    [FormatDurationAgo.Constants.TimeFormatCustom] = FormatDurationAgo.Strings.OptionCustom
}

function FormatDurationAgo.ConfigMenu.Initialize()

    if LibAddonMenu2 == nil then return end

    local panelData = {
        type = 'panel',
        name = FormatDurationAgo.Constants.AddOnTitle,
        displayName = FormatDurationAgo.Constants.AddOnTitle,
        author = FormatDurationAgo.Constants.AddOnAuthor,
        version = FormatDurationAgo.Constants.AddOnVersion,
        registerForRefresh = true
    }

    LibAddonMenu2:RegisterAddonPanel('FormatDurationAgoConfig', panelData)

    local optionsData = {
        [1] = FormatDurationAgo.ConfigMenu.GetDisplayModeDropdownOption(),
        [2] = FormatDurationAgo.ConfigMenu.GetCustomFormatInputOption()
    }

    LibAddonMenu2:RegisterOptionControls('FormatDurationAgoConfig', optionsData)

end

function FormatDurationAgo.ConfigMenu.GetDisplayModeDropdownOption()
    return {
        type = 'dropdown',
        name = FormatDurationAgo.Strings.DisplayMode,
        tooltip = nil,
        choices = {
            FormatDurationAgo.Strings.OptionDefault,
            FormatDurationAgo.Strings.OptionDefaultIso,
            FormatDurationAgo.Strings.OptionIso,
            FormatDurationAgo.Strings.OptionIsoDefault,
            FormatDurationAgo.Strings.OptionCustom
        },
        getFunc = function()
            return FormatDurationAgo.DisplayModeDropdownOptions[FormatDurationAgo.ConfigSaved.DisplayMode]
        end,
        setFunc = function(var)
            for key, value in pairs(FormatDurationAgo.DisplayModeDropdownOptions) do
                if value == var then
                    FormatDurationAgo.ConfigSaved.DisplayMode = key
                end
            end
        end
    }
end

function FormatDurationAgo.ConfigMenu.GetCustomFormatInputOption()
    return {
        type = 'editbox',
        name = FormatDurationAgo.Strings.CustomTime,
        tooltip = nil,
        getFunc = function()
            return FormatDurationAgo.ConfigSaved.CustomFormat
        end,
        setFunc = function(var)
            FormatDurationAgo.ConfigSaved.CustomFormat = var
        end
    }
end
