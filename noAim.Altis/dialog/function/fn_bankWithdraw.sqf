private["_val"];
_val = parseNumber(ctrlText 2702);
if(_val > 999999) exitWith {hint localize "STR_ATM_WithdrawMax";};
if(_val < 0) exitwith {};
if(!([str(_val)] call noaim_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_val > life_zgazzy) exitWith {hint localize "STR_ATM_NotEnoughFunds"};
if(_val < 100 && life_zgazzy > 1000000) exitWith {hint localize "STR_ATM_WithdrawMin"}; //Temp fix for something.

life_znorak = life_znorak + _val;
life_zgazzy = life_zgazzy - _val;
hint format [localize "STR_ATM_WithdrawSuccess",[_val] call noaim_fnc_numberText];
diag_log format ["%1 hat %2 von seinem Konto abgehoben",player getVariable["realname",name player],[_val] call noaim_fnc_numberText];
[] call noaim_fnc_atmMenu;

if (isNil "life_bank_transfer") then {life_bank_transfer = false;};
if !(life_bank_transfer) then 
{
	life_bank_transfer = true;
	[] spawn
	{
		sleep 5;
		[6] call SAX_fnc_updatePartial;
		life_bank_transfer = false;
	};
};