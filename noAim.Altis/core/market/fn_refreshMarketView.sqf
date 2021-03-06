private["_display", "_selectedindex", "_index", "_shortname"];

disableSerialization;
if(!dialog) exitWith {hint "Could not find dialog.";}; //cancel if no dlg

_display = findDisplay 39500;

if(isNull _display) exitWith {hint "Dialog not open!"; };

_selectedindex = lbCurSel 1500;

if(_selectedindex == -1) then
{
	lbSetCurSel [1500, 0];
	lbClear 1500;

	{
		_index = lbAdd [1500, [ [_x select 0, 0] call noaim_fnc_varHandle ] call noaim_fnc_varToStr ];
		lbSetData [1500, _index, _x select 0];
	}
	foreach life_market_resources;
}
//Otherwise set data to selected entry
else
{
	_shortname = lbData [1500, _selectedindex];
	
	ctrlSetText [1000, lbText [1500, _selectedindex] ]; //Set name
	
	{
		if((_x select 0) == _shortname) exitWith
		{
			ctrlSetText [1001, format["€%1", [_x select 1] call noaim_fnc_numberText ] ];
			ctrlSetText [1004, format["€%1", [_x select 2] call noaim_fnc_numberText ] ];
			
			if((_x select 2) >= 0) then
			{
				ctrlSetText [1200, "icons\trendup.paa"];
			}
			else
			{
				ctrlSetText [1200, "icons\trenddown.paa"];
			};
			
			ctrlSetText [1005, format["€%1", [_x select 3] call noaim_fnc_numberText ] ];
			
			if((_x select 3) >= 0) then
			{
				ctrlSetText [1201, "icons\trendup.paa"];
			}
			else
			{
				ctrlSetText [1201, "icons\trenddown.paa"];
			};
		};
	}
	foreach life_market_prices;
};