---------------------------------------------------------------------------------------------
-- AddOn Name: Advanced_Tukui_ActionBars
-- Author: Sinaris
-- Version 3.0
---------------------------------------------------------------------------------------------

local A, L, TG, TC = AdvancedTukuiActionBars:Unpack()

if( not ataCoreCDB['ActionBars']['ActionBars_Enable'] ) then
	return
end

if( ataCoreCDB['ActionBars']['ActionBars_Layout'] ~= 6 ) then
	return
end

local Size = TC['ActionBars']['NormalButtonSize']
local PetSize = TC['ActionBars']['PetButtonSize']
local Spacing = TC['ActionBars']['ButtonSpacing']

local NUM_ACTIONBAR_BUTTONS = NUM_ACTIONBAR_BUTTONS
local MultiBarBottomLeft = MultiBarBottomLeft
local MultiBarBottomRight = MultiBarBottomRight
local MultiBarRight = MultiBarRight
local MultiBarLeft = MultiBarLeft

----------------------------------------
-- Panels
----------------------------------------
A['ActionBars']['ActionBars1']:ClearAllPoints()
A['ActionBars']['ActionBars1']:SetPoint( 'BOTTOM', UIParent, 'BOTTOM', 0, 14 )
A['ActionBars']['ActionBars1']:SetHeight( ( Size * 1 ) + ( Spacing * 2 ) )
A['ActionBars']['ActionBars1']:SetWidth( ( Size * 12 ) + ( Spacing * 13 ) )
A['ActionBars']['ActionBars1']:SetFrameStrata( 'BACKGROUND' )
A['ActionBars']['ActionBars1']:SetFrameLevel( 1 )

A['ActionBars']['ActionBars2']:ClearAllPoints()
A['ActionBars']['ActionBars2']:SetPoint( 'BOTTOM', A['ActionBars']['ActionBars1'], 'BOTTOM', 0, 0 )
A['ActionBars']['ActionBars2']:SetHeight( ( Size * 3 ) + ( Spacing * 4 ) )
A['ActionBars']['ActionBars2']:SetWidth( ( Size * 12 ) + ( Spacing * 13 ) )
A['ActionBars']['ActionBars2']:SetFrameStrata( 'BACKGROUND' )
A['ActionBars']['ActionBars2']:SetFrameLevel( 2 )

A['ActionBars']['ActionBars3']:ClearAllPoints()
A['ActionBars']['ActionBars3']:SetPoint( 'BOTTOMRIGHT', A['ActionBars']['ActionBars1'], 'BOTTOMLEFT', -Spacing, 0 )
A['ActionBars']['ActionBars3']:SetHeight( ( Size * 3 ) + ( Spacing * 4 ) )
A['ActionBars']['ActionBars3']:SetWidth( ( Size * 2 ) + ( Spacing * 3 ) )
A['ActionBars']['ActionBars3']:SetFrameStrata( 'BACKGROUND' )
A['ActionBars']['ActionBars3']:SetFrameLevel( 3 )

A['ActionBars']['ActionBars4']:ClearAllPoints()
A['ActionBars']['ActionBars4']:SetPoint( 'BOTTOMLEFT', A['ActionBars']['ActionBars1'], 'BOTTOMRIGHT', Spacing, 0 )
A['ActionBars']['ActionBars4']:SetHeight( ( Size * 3 ) + ( Spacing * 4 ) )
A['ActionBars']['ActionBars4']:SetWidth( ( Size * 2 ) + ( Spacing * 3 ) )
A['ActionBars']['ActionBars4']:SetFrameStrata( 'BACKGROUND' )
A['ActionBars']['ActionBars4']:SetFrameLevel( 3 )

A['ActionBars']['ActionBars5']:ClearAllPoints()
A['ActionBars']['ActionBars5']:SetPoint( 'RIGHT', UIParent, 'RIGHT', -28, -14 )
A['ActionBars']['ActionBars5']:SetHeight( ( Size * 12 ) + ( Spacing * 13 ) )
A['ActionBars']['ActionBars5']:SetWidth( ( Size * 1 ) + ( Spacing * 2 ) )
A['ActionBars']['ActionBars5']:SetFrameStrata( 'BACKGROUND' )
A['ActionBars']['ActionBars5']:SetFrameLevel( 3 )

----------------------------------------
-- ActionBars2
----------------------------------------
do
	local Anchor = A['ActionBars']['ActionBars2']
	MultiBarBottomLeft:SetParent( Anchor )

	for i = 1, 12 do
		local Button = _G['MultiBarBottomLeftButton' .. i]
		local Previous = _G['MultiBarBottomLeftButton' .. i - 1]

		Button:Size( Size, Size )
		Button:ClearAllPoints()
		Button:SetFrameStrata( 'BACKGROUND' )
		Button:SetFrameLevel( 15 )

		if( i == 1 ) then
			Button:SetPoint( 'LEFT', Anchor, 'LEFT', Spacing, 0 )
		else
			Button:SetPoint( 'LEFT', Previous, 'RIGHT', Spacing, 0 )
		end
	end
end

----------------------------------------
-- ActionBars3
----------------------------------------
do
	local Anchor = A['ActionBars']['ActionBars2']
	MultiBarBottomRight:SetParent( Anchor )

	for i = 1, 12 do
		local Button = _G['MultiBarBottomRightButton' .. i]
		local Previous = _G['MultiBarBottomRightButton' .. i - 1]

		Button:Size( Size, Size )
		Button:ClearAllPoints()
		Button:SetFrameStrata( 'BACKGROUND' )
		Button:SetFrameLevel( 15 )

		if( i == 1 ) then
			Button:SetPoint( 'TOPLEFT', Anchor, 'TOPLEFT', Spacing, -Spacing )
		else
			Button:SetPoint( 'LEFT', Previous, 'RIGHT', Spacing, 0 )
		end
	end
end

----------------------------------------
-- ActionBars4
----------------------------------------
do
	local AnchorLeft = A['ActionBars']['ActionBars3']
	local AnchorRight = A['ActionBars']['ActionBars4']
	AnchorLeft:SetAlpha( 1 )
	AnchorRight:SetAlpha( 1 )
	AnchorRight:SetParent( AnchorLeft )
	MultiBarRight:SetParent( AnchorLeft )

	for i = 1, 12 do
		local Button = _G['MultiBarRightButton' .. i]
		local Previous = _G['MultiBarRightButton' .. i - 1]
		local Previous2 = _G['MultiBarRightButton' .. i - 2]

		Button:Size( Size, Size )
		Button:ClearAllPoints()
		Button:SetFrameStrata( 'BACKGROUND' )
		Button:SetFrameLevel( 15 )

		if( i == 1 ) then
			Button:SetPoint( 'TOPLEFT', AnchorLeft, 'TOPLEFT', Spacing, -Spacing )
		elseif( i == 7 ) then
			Button:SetPoint( 'TOPLEFT', AnchorRight, 'TOPLEFT', Spacing, -Spacing )
		elseif( i == 3 or i == 5 or i == 9 or i == 11 ) then
			Button:SetPoint( 'TOP', Previous2, 'BOTTOM', 0, -Spacing )
		else
			Button:SetPoint( 'LEFT', Previous, 'RIGHT', Spacing, 0 )
		end
	end
end

----------------------------------------
-- ActionBars5
----------------------------------------
do
	local Anchor = A['ActionBars']['ActionBars5']
	Anchor:SetAlpha( 1 )
	MultiBarLeft:SetParent( Anchor )

	for i = 1, 12 do
		local Button = _G['MultiBarLeftButton' .. i]
		local Previous = _G['MultiBarLeftButton' .. i - 1]

		Button:Size( Size, Size )
		Button:ClearAllPoints()
		Button:SetFrameStrata( 'BACKGROUND' )
		Button:SetFrameLevel( 15 )

		if( i == 1 ) then
			Button:SetPoint( 'TOPLEFT', Anchor, 'TOPLEFT', Spacing, -Spacing )
		else
			Button:SetPoint( 'TOP', Previous, 'BOTTOM', 0, -Spacing )
		end
	end
end

----------------------------------------
-- UnitFrames
----------------------------------------
hooksecurefunc( TG['UnitFrames'], 'CreateAnchor', function()
	TG['UnitFrames']['Anchor']:ClearAllPoints()
	TG['UnitFrames']['Anchor']:SetPoint( 'BOTTOM', UIParent, 'BOTTOM', 0, 14 )
	TG['UnitFrames']['Anchor']:SetHeight( ( Size * 3 ) + ( Spacing * 4 ) )
	TG['UnitFrames']['Anchor']:SetWidth( ( Size * 24 ) + ( Spacing * 25 ) )
end )
