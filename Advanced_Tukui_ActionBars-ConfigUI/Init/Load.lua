---------------------------------------------------------------------------------------------
-- AddOn Name: Advanced_Tukui_ActionBars
-- Author: Sinaris
-- Version 3.0
---------------------------------------------------------------------------------------------

local A, L, TG, TC = select( 2, ... ):Unpack()

local format = string.format

local EventFrame = CreateFrame( 'Frame' )
EventFrame:RegisterEvent( 'PLAYER_ENTERING_WORLD' )
EventFrame:SetScript( 'OnEvent', function( self, event, ... )
	self[event]( self, ... )
end )

function EventFrame:PLAYER_ENTERING_WORLD()
	if( ataCoreDB['General']['WelcomeMessage'] ) then
		print( ' ' )
		print( format( 'You are using |cff00aaff%s|r Version |cffff6347%s|r', A['Name'], A['Version'] ) )
		print( 'Type |cff00aaff/atac|r to open the ConfigUI' )
		print( 'Type |cff00aaff/atar|r to reset to default settings' )
		print( 'To report any errors or bugs you may find, please visit: [|cff00aaff|Hurl:http://www.asphyxiaui.de|hhttp://www.asphyxiaui.de|h|r]' )
		print( ' ' )
	end

	if( ataCoreCDB['ActionBars']['ActionBars_Debug'] ) then
		print( '|cffff6347Debug|r: On' )
		print( ' ' )
	end
end
