private["_display","_listbox","_shortname","_longname","_price","_hasLicense","_displayname"];
 
_buyables = _this select 3; //called from action => select 3rd argument
 
if(!dialog) then
{
	if(!(createDialog "BanLicenseShop")) exitWith {};
};
disableSerialization;
 
_display = findDisplay 9546;
if(isNull _display) exitWith {};
_listbox = _display displayCtrl 95126;
_mylic = _display displayCtrl 95131;
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