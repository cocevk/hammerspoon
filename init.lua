-- Read this on how to get and install the spoons
-- https://github.com/Hammerspoon/hammerspoon/blob/master/SPOONS.md#where-do-i-get-spoons-from

-- Spoons
hs.loadSpoon('ControlEscape'):start() 
hs.loadSpoon('ClipboardTool')
hs.loadSpoon('AClock'):init()

-- ClipboardTool
ct = spoon.ClipboardTool
ct:bindHotkeys({
    toggle_clipboard = { { "ctrl", "cmd", "alt" }, "v" }
})
ct.show_in_menubar = false
ct:start()

-- start HJKL CURSOR MOVEMENT (press ctrl+shift and use VI movement

local function pressFn(mods, key)
	if key == nil then
		key = mods
		mods = {}
	end

	return function() hs.eventtap.keyStroke(mods, key, 50) end
end

local function remap(mods, key, pressFn)
	hs.hotkey.bind(mods, key, pressFn, nil, pressFn)
end


remap({'ctrl', 'shift'}, 'h', pressFn('left'))
remap({'ctrl', 'shift'}, 'j', pressFn('down'))
remap({'ctrl', 'shift'}, 'k', pressFn('up'))
remap({'ctrl', 'shift'}, 'l', pressFn('right'))

-- end HJKL CURSOR MOVEMENT

hs.hotkey.bind({'ctrl', 'shift'}, "i", function()
    hs.application.launchOrFocus("Intellij IDEA CE")
    end
)

hs.hotkey.bind({'ctrl', 'shift'}, "m", function()
    hs.application.launchOrFocus("Mail")
    end
)

hs.hotkey.bind({'ctrl', 'shift'}, "a", function()
    hs.application.launchOrFocus("Activity Monitor")
    end
)

hs.hotkey.bind({'ctrl', 'shift'}, "s", function()
    hs.application.launchOrFocus("Safari")
    end
)

hs.hotkey.bind({'ctrl', 'shift'}, "v", function()
    hs.application.launchOrFocus("MacVim")
    end
)

hs.hotkey.bind({'ctrl', 'shift'}, "f", function()
    hs.application.launchOrFocus("Finder")
    end
)

hs.hotkey.bind({'ctrl', 'shift'}, "e", function()
    hs.application.launchOrFocus("Emacs")
    end
)

hs.hotkey.bind({'ctrl', 'shift'}, "t", function()
    hs.application.launchOrFocus("iTerm")
    end
)

hs.hotkey.bind({'ctrl', 'shift'}, "x", function()
    hs.application.launchOrFocus("Slack")
    end
)

hs.hotkey.bind({'ctrl', 'shift'}, "c", function()
    hs.application.launchOrFocus("Messages")
    end
)

hs.hotkey.bind({'ctrl', 'shift'}, "b", function()
    hs.application.launchOrFocus("Signal")
    end
)

hs.hotkey.bind({"ctrl", "shift"}, ";", function()
    spoon.AClock:toggleShow()
    end
)

hs.hotkey.bind({'ctrl', 'shift'}, "r", function()
    hs.reload()
    end
)

hs.alert.show('Hammerspoon configuration reloaded!')

return module
