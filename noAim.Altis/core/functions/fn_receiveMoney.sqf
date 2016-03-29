/*
	Author: Bryan "Tonic" Boardwine
	Receives money
*/
private["_unit","_val","_from"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_val = [_this,1,"",[""]] call BIS_fnc_param;
_from = [_this,2,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _unit OR isNull _from OR _val == "") exitWith {};
if(player != _unit) exitWith {};
if(!([_val] call TON_fnc_isnumber)) exitWith {};
if(_unit == _from) exitWith {}; //Bad boy, trying to exploit his way to riches.

hint format[localize "STR_NOTF_GivenMoney",_from getVariable["realname",name _from],[(parseNumber (_val))] call noaim_fnc_numberText];
//diag_log format ["%1 hat von %2 eine Summe von %3 gegeben bekommen",player getVariable["realname",name player],_from getVariable["realname",name _from],(parseNumber(_val))];
//AX_LOG *DEFEKT FIX
[format ["GOTMONEY: %1 hat von %2 eine Summe von %3 gegeben bekommen.", player getVariable["realname",name player], _from getVariable["realname",name _from],(parseNumber(_val))],"ax_log",false,false] call noaim_fnc_Loggy;
//[["money",_toLog],"ax_log",false,false] call noaim_fnc_Loggy;

life_znorak = life_znorak + (parseNumber(_val));