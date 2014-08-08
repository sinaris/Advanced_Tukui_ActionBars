---------------------------------------------------------------------------------------------
-- AddOn Name: Advanced_Tukui_ActionBars
-- Author: Sinaris
-- Version 3.0
---------------------------------------------------------------------------------------------

----------------------------------------
-- Tukui Engine
----------------------------------------
local TukuiGlobal, TukuiConfig = Tukui[1], Tukui[2]

----------------------------------------
-- AddOn Engine + Merge with Tukui
----------------------------------------
local AddOnName, AddOnEngine = ...

AddOnEngine[1] = {} -- AddOn: A
AddOnEngine[2] = {} -- AddOn: C
AddOnEngine[3] = TukuiGlobal -- Tukui: T
AddOnEngine[4] = TukuiConfig -- Tukui: C

function AddOnEngine:Unpack()
	return self[1], self[2], self[3], self[4]
end

_G.AdvancedTukuiActionBars = AddOnEngine
