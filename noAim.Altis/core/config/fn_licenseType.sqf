/*
	Author: Bryan "Tonic" Boardwine
	Returns the short-var of the license name to a long var and display name.
*/
private["_type","_ret","_var","_mode"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,-1,[0]] call BIS_fnc_param;
if(_type == "" OR _mode == -1) exitWith {[]};

switch (_mode) do
{
	case 0:
	{
		switch (_type) do
		{
			case "cair": {_var = "license_cop_air"};
			case "gsg9": {_var = "license_cop_gsg9"};
			case "gsg9tl": {_var = "license_cop_gsg9tl"};
			case "fwair": {_var = "license_fwehr_air"};
			case "driver": {_var = "license_civ_driver"};
			case "truck": {_var = "license_civ_truck"};
			case "pilot": {_var = "license_civ_air"};
			case "boat": {_var = "license_civ_boat"};
			case "dive": {_var = "license_civ_dive"};
			case "gun": {_var = "license_civ_gun"};
			case "rebel": {_var = "license_civ_rebel"};
			case "mafia": {_var = "license_civ_mafia"};
			case "donator": {_var = "license_civ_donator"};
			case "home": {_var = "license_civ_home"};
			case "heroin": {_var = "license_civ_heroin"};
			case "marijuana": {_var = "license_civ_marijuana"};
			case "cocaine": {_var = "license_civ_cocaine"};
			case "oil": {_var = "license_civ_oil"};
			case "diamond": {_var = "license_civ_diamond"};
			case "copper": {_var = "license_civ_copper"};
			case "iron": {_var = "license_civ_iron"};
			case "sand": {_var = "license_civ_sand"};
			case "nudeln": {_var = "license_civ_nudeln"};
			case "wein": {_var = "license_civ_wein"};
			case "zigarren": {_var = "license_civ_zigarren"};
			case "holz": {_var = "license_civ_holz"};
			case "schwefel": {_var = "license_civ_schwefel"};
			case "schmuck": {_var = "license_civ_schmuck"};
			case "kidney": {_var = "license_civ_kidney"};
			case "fwcar": {_var = "license_fwehr_car"};
			case "taxi": {_var = "license_civ_taxi"};
			case "haschisch": {_var = "license_civ_haschisch"};
			case "plastic": {_var = "license_civ_plastic"};
			case "woll": {_var = "license_civ_woll"};
			case "fabric": {_var = "license_civ_fabric"};
			case "aluminium": {_var = "license_civ_aluminium"};
			case "jadgschein": {_var = "license_civ_jadgschein"};
			case "fishing": {_var = "license_civ_fishing"};
			case "anwalt": {_var = "license_civ_anwalt"};
			case "richter": {_var = "license_civ_richter"};
			case "gokart": {_var = "license_civ_gokart"};
			case "logistika": {_var = "license_civ_logistika"};
			case "wooden": {_var = "license_civ_wooden"};
			case "weizenbrot": {_var = "license_civ_weizenbrot"};
			case "laptop": {_var = "license_civ_laptop"};
			case "clubdj": {_var = "license_civ_clubdj"};
			case "gas": {_var = "license_civ_gas"};
			case "clanbase": {_var = "license_civ_clanbase"};
			case "clan1": {_var = "license_civ_clan1"};
			default {_var = ""};
		};
	};
	
	case 1:
	{
		switch (_type) do
		{
			case "license_cop_air": {_var = "cair"};
			case "license_cop_car": {_var = "ccar"};
			case "license_cop_gsg9": {_var = "gsg9"};
			case "license_cop_gsg9tl": {_var = "gsg9tl"};
			case "license_fwehr_air": {_var = "fwair"};
			case "license_fwehr_car": {_var = "fwcar"};
			case "license_civ_driver": {_var = "driver"};
			case "license_civ_truck": {_var = "truck"};
			case "license_civ_air": {_var = "pilot"};
			case "license_civ_boat": {_var = "boat"};
			case "license_civ_dive": {_var = "dive"};
			case "license_civ_gun": {_var = "gun"};
			case "license_civ_mafia": {_var = "mafia"};
			case "license_civ_rebel": {_var = "rebel"};
			case "license_civ_donator": {_var = "donator"};
			case "license_civ_home": {_var = "home"};
			case "license_civ_heroin": {_var = "heroin"};
			case "license_civ_marijuana": {_var = "marijuana"};
			case "license_civ_cocaine": {_var = "cocaine"};
			case "license_civ_oil": {_var = "oil"};
			case "license_civ_diamond": {_var = "diamond"};
			case "license_civ_copper": {_var = "copper"};
			case "license_civ_iron": {_var = "iron"};
			case "license_civ_sand": {_var = "sand"};
			case "license_civ_nudeln": {_var = "nudeln"};
			case "license_civ_wein": {_var = "wein"};
			case "license_civ_zigarren": {_var = "zigarren"};
			case "license_civ_holz": {_var = "holz"};
			case "license_civ_schwefel": {_var = "schwefel"};
			case "license_civ_schmuck": {_var = "schmuck"};
			case "license_civ_logistika": {_var = "logistika"};
			case "license_civ_wooden": {_var = "wooden"};
			case "license_civ_weizenbrot": {_var = "weizenbrot"};
			case "license_civ_laptop": {_var = "laptop"};
			case "license_civ_clubdj": {_var = "clubdj"};
			case "license_civ_gas": {_var = "gas"};
			case "license_civ_aluminium": {_var = "aluminium"};
			case "license_civ_fabric": {_var = "fabric"};
			case "license_civ_clanbase": {_var = "clanbase"};
			case "license_civ_clan1": {_var = "clan1"};
			default {_var = ""};
		};
	};
};

_ret = [_var,(if(_var != "") then {([_var] call noaim_fnc_varToStr)})];
_ret;