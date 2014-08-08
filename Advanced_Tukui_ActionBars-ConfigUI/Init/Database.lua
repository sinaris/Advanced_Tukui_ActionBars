---------------------------------------------------------------------------------------------
-- AddOn Name: Advanced_Tukui_ActionBars
-- Author: Sinaris
-- Version 3.0
---------------------------------------------------------------------------------------------

local A, L, TG, TC = select( 2, ... ):Unpack()

local AccountSettings = {}
local CharacterSettings = {}

local AccountSettings = {
	['General'] = {
		['WelcomeMessage'] = true,
	},
}

local CharacterSettings = {
	['ActionBars'] = {
		['ActionBars_Enable'] = true,
		['ActionBars_Debug'] = false,
		['ActionBars_Layout'] = 1,
	},
}

A['LoadCharacterSettings'] = function()
	for a, b in pairs( CharacterSettings ) do
		if( type( b ) ~= 'table' ) then
			if( ataCoreCDB[a] == nil ) then
				ataCoreCDB[a] = b
			end
		else
			if( ataCoreCDB[a] == nil ) then
				ataCoreCDB[a] = {}
			end

			for k, v in pairs( b ) do
				if( ataCoreCDB[a][k] == nil ) then
					ataCoreCDB[a][k] = v
				end
			end
		end
	end
end

A['LoadAccountSettings'] = function()
	for a, b in pairs( AccountSettings ) do
		if( type( b ) ~= 'table' ) then
			if( ataCoreDB[a] == nil ) then
				ataCoreDB[a] = b
			end
		else
			if( ataCoreDB[a] == nil ) then
				ataCoreDB[a] = {}
			end

			for k, v in pairs( b ) do
				if( ataCoreDB[a][k] == nil ) then
					ataCoreDB[a][k] = v
				end
			end
		end
	end
end
