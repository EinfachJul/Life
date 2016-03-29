/*
	Author: Bryan "Tonic" Boardwine
	Called when the player attempts to post bail.
	Needs to be revised.
*/
private["_unit"];
_unit = _this select 1;
if(life_bail_paid) exitWith {};
if(isNil {life_bail_amount}) then {life_bail_amount = 3500;};
if(!isNil "life_canpay_bail") exitWith {hint localize "STR_NOTF_Bail_Post"};
if(life_zgazzy < life_bail_amount) exitWith {hint format[localize "STR_NOTF_Bail_NotEnough",life_bail_amount];};

life_zgazzy = life_zgazzy - life_bail_amount;
life_bail_paid = true;
[0,"STR_NOTF_Bail_Bailed",true,[profileName]] remoteExecCall ["noaim_fnc_broadcast",-2];
//[[0,"STR_NOTF_Bail_Bailed",true,[profileName]],"noaim_fnc_broadcast",true,false] spawn noaim_fnc_TRY;