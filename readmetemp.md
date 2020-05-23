Experimental tiny add-on for The Elder Scrolls Online to change the time format displayed in guild member lists, guild history, friend lists, email and other places. The default format simply states how many minutes/hours/days/months ago something happened. The add-on here allows displaying a specific and customisable time format.

### Implementation

The add-on achieves custom time format by overriding the global `ZO_FormatDurationAgo` function used throughout the game user interface. The function is defined in the [global time functions library](https://github.com/esoui/esoui/blob/master/esoui/libraries/globals/time.lua).


### Dependencies

The add-on requires LibAddonMenu-2.0 to function. No other requirements.
