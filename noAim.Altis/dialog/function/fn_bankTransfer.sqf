/*
	Author: Bryan "Tonic" Boardwine
	Figure it out again.
*/
private["_val","_unit","_tax"];
_val = parseNumber(ctrlText 2702);
_unit = call compile format["%1",(lbData[2703,(lbCurSel 2703)])];
if(isNull _unit) exitWith {};
if((lbCurSel 2703) == -1) exitWith {hint localize "STR_ATM_NoneSelected"};
if(isNil "_unit") exitWith {hint localize "STR_ATM_DoesntExist"};
if(_val > 999999) exitWith {hint localize "STR_ATM_TransferMax";};
if(_val < 0) exitwith {};
if(!([str(_val)] call noaim_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_val > life_zgazzy) exitWith {hint localize "STR_ATM_NotEnough"};
_tax = [_val] call noaim_fnc_taxRate;
if((_val + _tax) > life_zgazzy) exitWith {hint format[localize "STR_ATM_SentMoneyFail",_val,_tax]};

life_zgazzy = life_zgazzy - (_val + _tax);

//[[_val,profileName],"TON_fnc_clientWireTransfer",_unit,false] spawn noaim_fnc_DONE;
[_val,profileName] remoteExec ["TON_fnc_clientWireTransfer",_unit];

[format ["ATMTRANSACTION: %1 hat %2 an %3 gesendet.", name player, [_val] call noaim_fnc_numberText, name _unit],"ax_log",false,false] call noaim_fnc_Loggy;

[] call noaim_fnc_atmMenu;
hint format[localize "STR_ATM_SentMoneySuccess",[_val] call noaim_fnc_numberText,_unit getVariable["realname",name _unit],[_tax] call noaim_fnc_numberText];
diag_log format ["%1 hat %2 eine Summe von %3 überwiesen",player getVariable["realname",name player],_unit getVariable["realname",name _unit],[_val] call noaim_fnc_numberText];
[6] call SAX_fnc_updatePartial;