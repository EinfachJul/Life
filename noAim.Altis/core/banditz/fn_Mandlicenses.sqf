private["_display","_listbox","_shortname","_longname","_price","_hasLicense","_displayname"];
 
_buyables = _this select 3; //called from action => select 3rd argument

if (license_civ_rebel) then {
		hint"Du hast eine Rebellenlizenz!, der Kauf einer Mafializenz ist nicht moeglich.";
	} else{

	if(!dialog) then
	{
		if(!(createDialog "RanLicenseShop")) exitWith {};
	};
	disableSerialization;
	 
	_display = findDisplay 9547;
	if(isNull _display) exitWith {};
	_listbox = _display displayCtrl 95127;
	_mylic = _display displayCtrl 95132;
	_struct = "";
	 
	{
		_shortname = _x;
		 
		_longname = ([_shortname, 0] call noaim_fnc_licenseType) select 0;
		_displayname = ([_shortname, 0] call noaim_fnc_licenseType) select 1;
		_price = [_shortname] call noaim_fnc_licensePrice;
		_hasLicense = missionNamespace getVariable _longname;
		 
		if(!_hasLicense) then
		{
			_listbox lbAdd format["%1 (€%2)", _displayname, _price];
			_listbox lbSetData [(lbSize _listbox) - 1, _shortname];
		}
		else
		{
			_mylic lbAdd format["%1", _displayname];
			_mylic lbSetData [(lbSize _mylic) - 1, _shortname];
		};
	}
	foreach _buyables;
};