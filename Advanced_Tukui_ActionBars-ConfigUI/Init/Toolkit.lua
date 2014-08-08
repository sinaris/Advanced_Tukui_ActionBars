---------------------------------------------------------------------------------------------
-- AddOn Name: Advanced_Tukui_ActionBars
-- Author: Sinaris
-- Version 3.0
---------------------------------------------------------------------------------------------

local A, L, TG, TC = select( 2, ... ):Unpack()

----------------------------------------
-- GUI
----------------------------------------
A['GUIOptionsSlider_OnValueChanged'] = function( self, value )
	if( not self._onsetting ) then
		self._onsetting = true
		self:SetValue( self:GetValue() )
		value = self:GetValue()

		self._onsetting = false
	else
		return
	end
end

A['GUICreateOptionsSlider'] = function( Parent, X, Y, Name, Table, Value, Divisor, Min, Max, Step, Tooltip )
	local Slider = CreateFrame( 'Slider', Value .. 'Slider', Parent, 'OptionsSliderTemplate' )
	Slider:Point( 'TOPLEFT', Parent, 'TOPLEFT', X, -Y )
	Slider:Width( 220 )

	BlizzardOptionsPanel_Slider_Enable( Slider )

	Slider:SetMinMaxValues( Min, Max )

	_G[Slider:GetName() .. 'Low']:SetText( Min / Divisor )
	_G[Slider:GetName() .. 'Low']:ClearAllPoints()
	_G[Slider:GetName() .. 'Low']:Point( 'BOTTOMLEFT', 0, -18 )

	_G[Slider:GetName() .. 'High']:SetText( Max / Divisor )
	_G[Slider:GetName() .. 'High']:ClearAllPoints()
	_G[Slider:GetName() .. 'High']:Point( 'BOTTOMRIGHT', 0, -18 )

	_G[Slider:GetName() .. 'Text']:ClearAllPoints()
	_G[Slider:GetName() .. 'Text']:Point( 'TOP', 0, 19 )
	_G[Slider:GetName() .. 'Text']:SetFontObject( GameFontHighlight )

	Slider:SetValueStep( Step )

	Slider:SetScript( 'OnShow', function( self )
		self:SetValue( ( ataCoreCDB[Table][Value] ) * Divisor )
		_G[Slider:GetName() .. 'Text']:SetText( format( '%s |cff00ffff%s|r', Name, ataCoreCDB[Table][Value] ) )
	end )

	Slider:SetScript( 'OnValueChanged', function( self, getvalue )
		ataCoreCDB[Table][Value] = getvalue / Divisor
		A.GUIOptionsSlider_OnValueChanged( self, getvalue )
		_G[Slider:GetName() .. 'Text']:SetText( format( '%s |cff00ffff%s|r', Name, ataCoreCDB[Table][Value] ) )
	end )

	if( Tooltip ) then
		Slider.tooltipText = Tooltip
	end

	Parent[Value] = Slider
end

A['GUICreateOptionsCheckButton'] = function( Parent, X, Y, Name, Table, Value, Tooltip )
	local CheckButton = CreateFrame( 'CheckButton', Value .. 'Button', Parent, 'InterfaceOptionsCheckButtonTemplate' )
	CheckButton:Point( 'TOPLEFT', Parent, 'TOPLEFT', X, -Y )
	CheckButton:SkinCheckBox()

	_G[CheckButton:GetName() .. 'Text']:SetText( Name )

	CheckButton:SetScript( 'OnShow', function( self )
		self:SetChecked( ataCoreCDB[Table][Value] )
	end )

	CheckButton:SetScript( 'OnClick', function( self )
		PlaySound( self:GetChecked() and 'igMainMenuOptionCheckBoxOn' or 'igMainMenuOptionCheckBoxOff' )
		if( self:GetChecked() ) then
			ataCoreCDB[Table][Value] = true
		else
			ataCoreCDB[Table][Value] = false
		end
	end )

	if( Tooltip ) then
		CheckButton:SetScript( 'OnEnter', function( self )
			GameTooltip:SetOwner( self, 'ANCHOR_RIGHT', -20, 10 )
			GameTooltip:AddLine( Tooltip )
			GameTooltip:Show()
		end)

		CheckButton:SetScript( 'OnLeave', function( self )
			GameTooltip:Hide()
		end )
	end

	Parent[Value] = CheckButton
end
