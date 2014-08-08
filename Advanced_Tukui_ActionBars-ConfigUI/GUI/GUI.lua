---------------------------------------------------------------------------------------------
-- AddOn Name: Advanced_Tukui_ActionBars
-- Author: Sinaris
-- Version 3.0
---------------------------------------------------------------------------------------------

local A, L, TG, TC = select( 2, ... ):Unpack()

local format = string.format

local GUI = CreateFrame( 'Frame', 'ATAConfigUIMainFrame', UIParent )
GUI:Point( 'CENTER', UIParent, 'CENTER', 0, 0 )
GUI:Size( 450, 450 )
GUI:SetFrameStrata( 'HIGH' )
GUI:SetFrameLevel( 4 )
GUI:SetTemplate( 'Transparent' )
GUI:CreateShadow()
GUI:Hide()

GUI['InnerFrame'] = CreateFrame( 'Frame', 'ATAConfigUIMainFrameInnerFrame', GUI )
GUI['InnerFrame']:Point( 'CENTER', UIParent, 'CENTER', 0, 0 )
GUI['InnerFrame']:Size( 410, 410 )
GUI['InnerFrame']:SetFrameStrata( 'HIGH' )
GUI['InnerFrame']:SetFrameLevel( 5 )

GUI['Title'] = CreateFrame( 'Frame', nil, GUI )
GUI['Title']:Point( 'BOTTOM', GUI, 'TOP', 0, 3 )
GUI['Title']:Size( GUI:GetWidth(), 30 )
GUI['Title']:SetTemplate( 'Default' )
GUI['Title']:CreateShadow()

GUI['Title']['Text'] = GUI['Title']:CreateFontString( nil, 'OVERLAY' )
GUI['Title']['Text']:Point( 'CENTER', GUI['Title'], 'CENTER', 0, -1 )
GUI['Title']['Text']:SetFont( TC['Medias']['Font'], 16, 'OUTLINE' )
GUI['Title']['Text']:SetText( format( '|cff00aaff%s|r ConfigUI', A['Name'] ) )

GUI['CloseButton'] = CreateFrame( 'Button', 'ATAConfigUIMainFrameCloseButton', GUI )
GUI['CloseButton']:Point( 'RIGHT', GUI['Title'], 'RIGHT', -6, 0 )
GUI['CloseButton']:Size( 18 )
GUI['CloseButton']:SetTemplate( 'Default' )
GUI['CloseButton']:SetScript( 'OnClick', function()
	GUI:Hide()
end )

GUI['CloseButton']['Text'] = GUI['CloseButton']:CreateFontString( nil, 'OVERLAY' )
GUI['CloseButton']['Text']:Point( 'CENTER', GUI['CloseButton'], 'CENTER', 1, -1 )
GUI['CloseButton']['Text']:SetFont( TC['Medias']['Font'], 12, 'OUTLINE' )
GUI['CloseButton']['Text']:SetText( 'X' )

GUI['ReloadUIButton'] = CreateFrame( 'Button', 'AsphyxiaUIConfigUIMainFrameReloadUIButton', GUI )
GUI['ReloadUIButton']:Point( 'BOTTOMRIGHT', GUI, 'BOTTOMRIGHT', -5, 5 )
GUI['ReloadUIButton']:Size( 100, 25 )
GUI['ReloadUIButton']:SetTemplate()
GUI['ReloadUIButton']:SetScript( 'OnClick', ReloadUI )

GUI['ReloadUIButton']['Text'] = GUI['ReloadUIButton']:CreateFontString( nil, 'OVERLAY' )
GUI['ReloadUIButton']['Text']:Point( 'CENTER', GUI['ReloadUIButton'], 'CENTER', 0, 1 )
GUI['ReloadUIButton']['Text']:SetFont( TC['Medias']['Font'], 12, 'OUTLINE' )
GUI['ReloadUIButton']['Text']:SetText( APPLY )

A.GUICreateOptionsCheckButton( GUI['InnerFrame'], 30, 30, 'Enable Advanced ActionBars Layouts', 'ActionBars', 'ActionBars_Enable', nil )
A.GUICreateOptionsCheckButton( GUI['InnerFrame'], 30, 90, 'Enable Debug Mode', 'ActionBars', 'ActionBars_Debug', nil )
A.GUICreateOptionsSlider( GUI['InnerFrame'], 30, 170, 'ActionBars Layout', 'ActionBars', 'ActionBars_Layout', 1, 1, 10, 1, nil )

GUI['InnerFrame']['Text'] = GUI['InnerFrame']:CreateFontString( nil, 'OVERLAY' )
GUI['InnerFrame']['Text']:Point( 'TOPLEFT', GUI['InnerFrame'], 'TOPLEFT', 30, -230 )
GUI['InnerFrame']['Text']:SetFont( TC['Medias']['Font'], 12, 'OUTLINE' )
GUI['InnerFrame']['Text']:SetJustifyH( 'LEFT' )

GUI['InnerFrame']['Text']:SetText( '|cff00aaffLayout 1|r: 2x12 Bottom Bars + 3x12 Right Bars\n|cff00aaffLayout 2|r: 3x12 Bottom Bars + 2x12 Right Bars\n|cff00aaffLayout 3|r: 4x12 Bottom Bars + 1x12 Right Bars\n|cff00aaffLayout 4|r: 5x12 Bottom Bars\n|cff00aaffLayout 5|r: 2x12 Bottom Bars + 2x3 Bottom Split Bars + 2x12 Right Bars\n|cff00aaffLayout 6|r: 3x12 Bottom Bars + 3x2 Bottom Split Bars + 1x12 Right Bars\n|cff00aaffLayout 7|r: 3x12 Bottom Bars + 4x3 Bottom Split Bars\n|cff00aaffLayout 8|r: Belkin_n52 Layout\n|cff00aaffLayout 9|r: 2x24 Bottom Bars + 1x12 Right Bars\n|cff00aaffLayout 10|r: 2x24 Bottom Bars + 2x3 Bottom Split Bars\n' )

----------------------------------------
-- SlashHandler
----------------------------------------
A['ATARESET'] = function()
	ataCoreCDB = {}
	A.LoadCharacterSettings()
	ReloadUI()
end
SLASH_ATARESET1 = '/atar'
SlashCmdList['ATARESET'] = A.ATARESET

A['GUISlashHandler'] = function()
	if( InCombatLockdown() ) then
		return
	end

	if( ATAConfigUIMainFrame:IsShown() ) then
		PlaySound( 'AchievementMenuOpen' )
		ATAConfigUIMainFrame:Hide()
	else
		PlaySound( 'AchievementMenuClose' )
		ATAConfigUIMainFrame:Show()
	end
end

SLASH_ATACSLASHHANDLER1 = '/atac'
SlashCmdList['ATACSLASHHANDLER'] = A.GUISlashHandler

local EventFrame = CreateFrame( 'Frame' )
EventFrame:RegisterEvent( 'ADDON_LOADED' )
EventFrame:SetScript( 'OnEvent', function( self, event, ... )
	self[event]( self, ... )
end )

function EventFrame:ADDON_LOADED( arg1 )
	if( arg1 ~= 'Advanced_Tukui_ActionBars-ConfigUI' ) then
		return
	end

	if( ataCoreDB == nil ) then
		ataCoreDB = {}
	end

	if( ataCoreCDB == nil ) then
		ataCoreCDB = {}
	end

	A.LoadAccountSettings()
	A.LoadCharacterSettings()
end
