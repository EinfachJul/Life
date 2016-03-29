/*
	Author: Bryan "Tonic" Boardwine
	Called when purchasing a license. May need to be revised.
*/
private["_type"];
_type = _this select 3;

_price = [_type] call noaim_fnc_licensePrice;
_license = [_type,0] call noaim_fnc_licenseType;

if(life_znorak < _price) exitWith {hint format[localize "STR_NOTF_NE_1",[_price] call noaim_fnc_numberText,_license select 1];};

life_znorak = life_znorak - _price;
titleText[format[localize "STR_NOTF_B_1", _license select 1,[_price] call noaim_fnc_numberText],"PLAIN"];
missionNamespace setVariable[(_license select 0),true];
[2] call SAX_fnc_updatePartial;