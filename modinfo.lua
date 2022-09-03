name = "Battle Song Widget Redux"
author = "Sorry Late"
version = "1.0"
description = [[
Active wigfrid battle song with Widget

- The widget will appear only if you using wigfrid and also if you have wigfrid book
- You can drag the widget by holding right click mouse and move it anywhere

]]

forumthread = ""
api_version_dst = 10

icon_atlas = "modicon.xml"
icon = "modicon.tex"

dst_compatible = true
all_clients_require_mod = false
client_only_mod = true
server_filter_tags = {}

local shortcut_list = {
	"Disabled","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
	"F1","F2","F3","F4","F5","F6","F7","F8","F9","F10","F11","12",
	"RSHIFT","LSHIFT","RCTRL","LCTRL","RALT","LALT",
	"LEFT","UP","RIGHT","DOWN",}
local KEY_A = {
	false,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,
	282,283,284,285,286,287,288,289,290,291,292,293,
	303,304,305,306,307,308,
	276,273,275,274,}
local keyslist = {}
for i = 1,#shortcut_list do keyslist[i] = {description = shortcut_list[i],data = KEY_A[i]} end

configuration_options = {
	{
		name = "backpack",
		label = "Your Backpack Layout",
		options = 
		{
			{description = "Separated", data = 1, hover = "Use this if your layout separated from inventory"},
			{description = "Integrated", data = 2, hover = "Use this if your layout together with inventory"},
		},
		default = 1,
	},

	{
		name = "shortcut_key",
		label = "Keybind to Hide/Show",
		options = keyslist,
		default = 120, -- X is default shortkey
	},
}	