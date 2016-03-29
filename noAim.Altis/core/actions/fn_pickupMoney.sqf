/*
	Author: Bryan "Tonic" Boardwine
	Picks up money
*/
if((time - life_action_delay) < 1.5) exitWith {
	hint "You can't rapidly use action keys!";
	if(!isNil {(_this select 0) getVariable "inUse"}) then {
		_this select 0 setVariable["inUse",false,true];
	};
};
private["_obj","_val"];
_obj = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_val = (_obj getVariable "item") select 1;
if(isNil {_val}) exitWith {};
if(isNull _obj || player distance _obj > 3) exitWith {if(!isNull _obj) then {_obj setVariable["inUse",false,true];};};
if((_obj getVariable["PickedUp",false])) exitWith {deleteVehicle _obj;}; //Object was already picked up.
_obj setVariable["PickedUp",TRUE,TRUE];
if(!isNil {_val}) then
{
	deleteVehicle _obj;
	switch (true) do
	{
		case (_val > 20000000) : {_val = 100000;}; //VAL>20mil->100k
		case (_val > 5000000) : {_val = 250000;}; //VAL>5mil->250k
		default {};
	};
	
	player playmove "AinvPknlMstpSlayWrflDnon";
	titleText[format[localize "STR_NOTF_PickedMoney",[_val] call noaim_fnc_numberText],"PLAIN"];
	//AX_LOG *DEFEKT FIX
	[format ["ITEMPICK: %1 (%2) hat %3€ aufgehoben.", name player, getPlayerUID player, [_val] call noaim_fnc_numberText],"ax_log",false,false] call noaim_fnc_DONEax;
	//format ["ITEMPICK: %1 (%2) hat %3€ aufgehoben.",name Player, getPlayerUID player, [_val] call noaim_fnc_numberText] remoteExecCall ["ax_log",2];
	life_znorak = life_znorak + _val;
	[] call SAX_fnc_updateRequest;
	life_action_delay = time;
};