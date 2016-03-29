#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Deposits money into the players gang bank.
*/
private["_value"];
_value = parseNumber(ctrlText 2702);

//Series of stupid checks
if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 0) exitWith {};
if(!([str(_value)] call noaim_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_value > life_zgazzy) exitWith {hint localize "STR_NOTF_NotEnoughFunds"};

__SUB__(life_zgazzy,_value);
_gFund = grpPlayer getVariable ["gang_bank",0];
_gFund = _gFund + _value;
grpPlayer setVariable ["gang_bank",_gFund,true];

hint format[localize "STR_ATM_DepositGang",[_value] call noaim_fnc_numberText];
[] call noaim_fnc_atmMenu;
[6] call SAX_fnc_updatePartial;
//[[1,grpPlayer],"TON_fnc_updateGang",false,false] spawn noaim_fnc_DONE;
[1,grpPlayer] remoteExec ["TON_fnc_updateGang",2];