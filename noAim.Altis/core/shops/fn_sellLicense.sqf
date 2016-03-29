/*
       Author: Bryan "Tonic" Boardwine
	Called when selling a license. May need to be revised.
*/
private["_type"];
_type = _this select 3;
_price = [_type] call noaim_fnc_licensePrice;
_price = _price / 2;
_license = [_type,0] call noaim_fnc_licenseType;

if (_type == "bountyh") then
{
	player setVariable["bounty_hunter",false,true];
};

life_znorak = life_znorak + _price;
titleText[format[localize "STR_NOTF_ChopSoldCar", _license select 1,[_price] call noaim_fnc_numberText],"PLAIN"];
[6] call SAX_fnc_updatePartial;
[2] call SAX_fnc_updatePartial;
missionNamespace setVariable[(_license select 0),false];