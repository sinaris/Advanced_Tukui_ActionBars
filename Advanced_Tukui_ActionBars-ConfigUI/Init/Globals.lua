---------------------------------------------------------------------------------------------
-- AddOn Name: Advanced_Tukui_ActionBars
-- Author: Sinaris
-- Version 3.0
---------------------------------------------------------------------------------------------

local A, L, TG, TC = select( 2, ... ):Unpack()

local format = string.format

----------------------------------------
-- AddOn Informations
----------------------------------------
A['Name'] = 'Advanced Tukui ActionBars'
A['Version'] = GetAddOnMetadata( ..., 'Version' )

----------------------------------------
-- Tukui: Panels, Buttons etc...
----------------------------------------
A['ActionBars'] = {}
A['Buttons'] = {}
A['Panels'] = {}

A['ActionBars']['ActionBars1'] = TG['Panels']['ActionBar1']
A['ActionBars']['ActionBars2'] = TG['Panels']['ActionBar2']
A['ActionBars']['ActionBars3'] = TG['Panels']['ActionBar3']
A['ActionBars']['ActionBars4'] = TG['Panels']['ActionBar4']
A['ActionBars']['ActionBars5'] = TG['Panels']['ActionBar5']
A['ActionBars']['PetBars'] = TG['Panels']['PetActionBar']
A['ActionBars']['StanceBars'] = TG['Panels']['StanceBar']

A['Buttons']['ActionBar2ToggleButton'] = TG['Panels']['ActionBar2ToggleButton']
A['Buttons']['ActionBar3ToggleButton'] = TG['Panels']['ActionBar3ToggleButton']
A['Buttons']['ActionBar4ToggleButton'] = TG['Panels']['ActionBar4ToggleButton']
A['Buttons']['ActionBar5ToggleButton'] = TG['Panels']['ActionBar5ToggleButton']
A['Buttons']['VehicleButtonLeft'] = TG['Panels']['VehicleButtonLeft']
A['Buttons']['VehicleButtonRight'] = TG['Panels']['VehicleButtonRight']

A['Panels']['BottomLine'] = TG['Panels']['BottomLine']
A['Panels']['LeftVerticalLine'] = TG['Panels']['LeftVerticalLine']
A['Panels']['RightVerticalLine'] = TG['Panels']['RightVerticalLine']
A['Panels']['DataTextLeft'] = TG['Panels']['DataTextLeft']
A['Panels']['DataTextRight'] = TG['Panels']['DataTextRight']
A['Panels']['Hider'] = TG['Panels']['Hider']
A['Panels']['PetBattleHider'] = TG['Panels']['PetBattleHider']

for i = 2, 5 do
	A['Buttons']['ActionBar' .. i .. 'ToggleButton']:ClearAllPoints()
	A['Buttons']['ActionBar' .. i .. 'ToggleButton']:SetParent( A['Panels']['Hider'] )
end
